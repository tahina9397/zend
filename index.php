<?php
require_once __DIR__ . '/init.php';
require_once __DIR__ . '/constants.php';

// timezone
date_default_timezone_set("Africa/Nairobi");

function getDefaultLanguage() {
   	if (isset($_SERVER["HTTP_ACCEPT_LANGUAGE"]))
      	return parseDefaultLanguage($_SERVER["HTTP_ACCEPT_LANGUAGE"]);
   	else
      	return parseDefaultLanguage(NULL);
}

function parseDefaultLanguage($http_accept, $deflang = "fr") {
   	if(isset($http_accept) && strlen($http_accept) > 1)  {
      	# Split possible languages into array
      	$x = explode(",",$http_accept);
      	foreach ($x as $val) {
         	#check for q-value and create associative array. No q-value means 1 by rule
         	if(preg_match("/(.*);q=([0-1]{0,1}\.\d{0,4})/i",$val,$matches))
            	$lang[$matches[1]] = (float)$matches[2];
         	else
            	$lang[$val] = 1.0;
      	}

      	#return default language (highest q-value)
      	$qval = 0.0;
      	foreach ($lang as $key => $value) {
         	if ($value > $qval) {
            	$qval = (float)$value;
            	$deflang = $key;
         	}
      	}
   	}
   	return strtolower($deflang);
}

/*
if (strpos($_SERVER['REDIRECT_URL'], 'admin') !== false) {
   // do nothing
}else{
   if(!empty($_SERVER['HTTP_REFERER'])){
   	$lc = getDefaultLanguage();
   	if(isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])){
      	$lc = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);

      	if( ($lc == "fr-fr" or $lc == 'fr') AND !empty($_SERVER['REDIRECT_URL']) ) {
         	if(substr($_SERVER['REDIRECT_URL'], 0, 3)!='/fr'){
            	header("location: /fr");
            	exit();
         	}
      	}      
   	}
   }
}
*/

try{
	Application::run();
}catch(Exception $e){
	echo $e->getMessage();
}