<?php

class Trano_TestController extends Application_AbstractController
{
	public function init()
	{}

	public function indexAction()
	{	
		error_reporting(E_ALL);
        ini_set("display_error", 1);

        echo "<pre>" ;
        print_r("Trano/taxibrousse");
        echo "</pre>" ;
        die() ;


     	$city = explode(", ", "Antsirabé, Madagascar") ;

     	$strCity = "" ;
       	foreach ($city as $c) {
       		$strCity .= Application_Class_String::noaccent($c).", " ;
       	}

        echo "<pre>" ;
        print_r(rtrim($strCity," ,")) ;
        echo "</pre>" ;
        die() ;
        
		$whyMadagascar = Application_Model_Page::getPageByCatId(1) ;

		echo "<pre>";
		print_r($whyMadagascar) ;
		echo "</pre>";
		die() ;
		
	}
}