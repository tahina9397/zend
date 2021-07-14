<?php

class Application_Model_Group { 
 	
 	public static function getGroups(){ 
 		return Application_Model_Multilingual::get(TABLE_PREFIX."categories_groups", TABLE_PREFIX."categories_groups_multilingual", 'id', 'id_category_group');		  	 
 	} 

 	public static function getGroupById($id,$size_name = "source")
 	{ 
 		$get = Application_Model_Multilingual::byid(TABLE_PREFIX."categories_groups", TABLE_PREFIX."categories_groups_multilingual", 'id', 'id_category_group', $id, 'tm.title,tm.permalink');		

	 	if (!empty($get)) {
 		 	$get['cover']['id_media'] = $id_media = Application_Model_Media::getCoverIdMedia("groupes", $id);

 		 	if ($id_media) {
 		 	    $get['cover']['url'] = Application_Model_Media::getCover("groupes", $id, $size_name);
 		 	    $get['cover']['width'] = Application_Model_Media::getMediaWidth($id_media, $size_name);
 		 	    $get['cover']['height'] = Application_Model_Media::getMediaHeight($id_media, $size_name);
 		 	    $get['cover']['metas'] = Application_Model_Media::get($id_media);
 		 	}
 	 	}	 

 	 	return $get ;
 	}

}