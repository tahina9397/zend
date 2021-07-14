<?php

class Application_Model_Language { 
 	
 	public static function getLanguages($limit = false)
 	{ 
 		global $db;
 	
 		if($limit)
 			$sql = " SELECT * FROM ".TABLE_PREFIX."languages WHERE active=1 LIMIT 0,$limit";
 		else
 			$sql = " SELECT * FROM ".TABLE_PREFIX."languages WHERE active=1 ";

 		$data = $db->fetchAll($sql);
 		return $data; 		  	 
 	} 

 	public static function getAbbr($id)
 	{ 
 		global $db;
 		$sql  = "SELECT abbreviation FROM ".TABLE_PREFIX."languages WHERE id=$id AND active=1";
 		$data = $db->fetchRow($sql);
 		return $data['abbreviation'];
 	}

 	public static function getOneLanguage($abbr)
 	{ 
 		global $db;
 		$sql  = "SELECT * FROM ".TABLE_PREFIX."languages WHERE abbreviation='$abbr' AND active=1";
 		$data = $db->fetchRow($sql);
 		return $data;
 	}

 	public static function getId($abbr)
 	{ 
 		global $db;
 		$sql  = "SELECT id FROM ".TABLE_PREFIX."languages WHERE abbreviation='$abbr' AND active=1";
 		$data = $db->fetchRow($sql);
 		return $data['id']; 		 
 	}

 	public static function getLocale()
 	{
 		$r = Zend_Registry::get('Zend_Translate');
 		return $r->getLocale();
 	}

 	public static function getCurrentId()
 	{
 		$r = Zend_Registry::get('Zend_Locale');
 		$locale = $r->toString();

 		switch ($locale) {
 			case 'en':
 				$locale = 'en' ;
			break;

 			default:
 				$locale = 'fr' ;
 			break ;
 		}
 		
 		return self::getId($locale);
 	}

 	public static function getLanguageUrl($language_abbr)
 	{
 		$r = Zend_Registry::get('Zend_Translate');
 		$locate = $r->getLocale();

 		$uri = $_SERVER['REQUEST_URI'];
 		$uri = ltrim($uri, '/');
 		$uri = explode('/', $uri);

 		$alllangs = Application_Model_Global::pquery("SELECT id,abbreviation FROM ".TABLE_PREFIX."languages WHERE id IS NOT NULL",array());
 		$langs_abbr = array();
 		if(!empty($alllangs)){
 			foreach ($alllangs as $k => $lang) {
 				$langs_abbr[] = $lang['abbreviation'];
 			}
 		}

 		$uri_without_lang = array();
 		if(!empty($uri)){
 			foreach ($uri as $k => $item) {
 				if (!in_array($item, $langs_abbr)) {
 					$uri_without_lang[] = $item;
 				}
 			}
 		}

 		if($language_abbr!=DEFAULT_LANG_ABBR){
 			$final_uri = '/'.$language_abbr.'/';
 		}else{
 			$final_uri = '/';
 		}

 		if(!empty($uri_without_lang)){
 		    foreach ($uri_without_lang as $k => $item) {
 		        $final_uri .= $item.'/';
 		    }

 		    $final_uri = str_replace('//', '/', $final_uri);
 		}

 		return $final_uri;
 	}
}