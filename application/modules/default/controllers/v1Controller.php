<?php

class v1Controller extends Application_AbstractController
{
	public function init()
	{
		$this->_helper->layout->disableLayout(); 
		$this->_helper->viewRenderer->setNoRender();

	    // $key =  $this->_getParam('key') ;
	    // if (!Application_Model_Ws::verifyKey($key)){
	    //     echo json_encode(array("Api_key"=>'Error'));
	    //     exit();
	    // }
	    
	    error_reporting(0);
	    ini_set("display_errors",0);
	}

	public function indexAction(){

	    header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
	    header("Cache-Control: post-check=0, pre-check=0", false);
	    header("Pragma: no-cache"); 
	    header("Content-Type: application/json");
	    header("Access-Control-Allow-Origin: *");

	    setlocale(LC_MONETARY, 'en_US');

	    $params = array();

	    $method = $this->_getParam('method');
	    $params = $this->_getParam('params');
	    $query = $this->_getParam('query');


	    switch($method){
	    	case "signUp":
	    		$results = array();                
	    		$results['Api_name'] = 'vue?js';
	    		$results['Api_version'] = '1.0';
	    		$results['Api_key'] = 'ok';
	    		$results['Method'] = 'signUp';
	    		$results['Requests'] = array($params);

	    		$email =  $params["email"];
	    		$password =  $params["password"];

	    		$ret['code'] = 0 ;
	    		$ret['msg'] = "Ceci est un essai" ;
	    		$results['Response'] = $ret ;
	    		
	    		echo json_encode($results,JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
    		break;
	    }
	}
}