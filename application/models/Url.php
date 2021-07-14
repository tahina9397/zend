<?php

class Application_Model_Url { 
 	
 	public static function getUrlMultilingual()
 	{ 
 		return Application_Model_Multilingual::get(TABLE_PREFIX."url", TABLE_PREFIX."url_multilingual", 'id', 'id_url');		  	 
 	} 

 	public static function getUrlMultilingualById($id)
 	{ 
 		return Application_Model_Multilingual::byid(TABLE_PREFIX."url", TABLE_PREFIX."url_multilingual", 'id', 'id_url', $id, 'tm.url',false);			 
 	}
}