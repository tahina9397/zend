<?php
class Api_V1Controller extends Application_AbstractController
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
	    	case "tutos":
	    		$results = array();                
	    		$results['Api_name'] = 'vue.js';
	    		$results['Api_version'] = '1.0';
	    		$results['Api_key'] = 'ok';
	    		$results['Method'] = 'signUp';
	    		$results['Requests'] = array($params);

	    		$q = $params["q"] ;

	    		$w = "1" ;
	    		$wParams = [] ;

	    		if ($q) {
	    			$w .= " AND name LIKE :q OR content LIKE :q" ;
	    			$wParams = array(":q" => '%'.$q.'%') ;
	    		}

	    		$sql = "
	    			SELECT * 
	    			FROM ".TABLE_PREFIX."tutos
	    			WHERE {$w}
	    		" ;

	    		$tutos =Application_Model_Global::pquery($sql,$wParams) ; 

	    		$results['Response'] = $tutos ;

	    		echo json_encode($results,JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
    		break;

	    	case "signIn":
	    		$results = array();                
	    		$results['Api_name'] = 'vue.js';
	    		$results['Api_version'] = '1.0';
	    		$results['Api_key'] = 'ok';
	    		$results['Method'] = 'signUp';
	    		$results['Requests'] = array($params);

			    $email =  trim($params["email"]) ;
			    $password =  trim($params["password"]) ;
			    $pwd_md5 = md5($password);

			    Zend_Loader::loadClass('Zend_Auth_Adapter_DbTable');
			    $dbAdapter = Zend_Registry::get('db');
			    $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);

			    $authAdapter->setTableName(TABLE_PREFIX.'users')
			        ->setIdentityColumn('email')
			        ->setCredentialColumn('password');

			    $authAdapter->setIdentity($email)->setCredential($pwd_md5);

			    $auth = Zend_Auth::getInstance();
			    $result = $auth->authenticate($authAdapter);

			    if ($result->isValid()) {
			        $data = $authAdapter->getResultRowObject();
			        $id = (int)$data->id;

			        $auth->setStorage(new Zend_Auth_Storage_Session('member'));
			        $auth->getStorage()->write($data);

			        // update last_activity
			        $id_member = (int)$check_state['id'] ;
			        Application_Model_Global::pupdate(TABLE_PREFIX."users", array("last_activity"=>date("Y-m-d H:i:s")), " id=:id_member ",array(":id_member" => $id_member));

			        $ret['state'] = 'success' ;
			        $ret['msg'] = $this->view->translate("Login avec succès") ;
			        $ret['data'] = $data ;

			        /*store connected user*/
			        $_SESSION["user"]["data"] = $data ;

			        // $ret['connected_user'] = $data->name ;
			        // $ret['connected_user_msg'] = str_replace("#connected_user#", "<strong>".$data->name."</strong>", $this->view->translate("Vous êtes connecté en tant que #connected_user#.")) ;
			    }
			    else{
			    	$ret['state'] = 'error' ;
			        $ret['msg'] = $this->view->translate("Email et/ou mot de passe incorrecte") ;
			    }

	    		$results['Response'] = $ret ;

	    		echo json_encode($results,JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
    		break;

    		case "getContent":
	    		$results = array();                
	    		$results['Api_name'] = 'vue.js';
	    		$results['Api_version'] = '1.0';
	    		$results['Api_key'] = 'ok';
	    		$results['Method'] = 'getContent';
	    		$results['Requests'] = array($params);

	    		$get = Application_Model_Page::getPageByCatId(11);

	    		$results['Response'] = $get ;

	    		echo json_encode($results,JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
    		break;
	    }
	}
}