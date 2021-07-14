<?php

class Application_Model_Module { 
 	
 	public static function getModules()
 	{ 
 		global $db;
 	
 		$sql = " SELECT * FROM ".TABLE_PREFIX."modules WHERE 1 ";

 		$data = $db->fetchAll($sql);
 		return $data; 		  	 
 	} 

 	public static function getIdModuleByCategoryGroup($id_category_group)
 	{ 
 		global $db;
 		$sql = "SELECT id_module FROM ".TABLE_PREFIX."modules_categories_groups WHERE id_category_group=$id_category_group";
 		$data = $db->fetchRow($sql);
 		return $data['id_module'];		 
 	}

 	public static function getIdCategoryGroupByModule($id_module){
 	    global $db;
 	    $sql = "SELECT id_category_group FROM ".TABLE_PREFIX."modules_categories_groups WHERE id_module=$id_module";
 	    $data = $db->fetchAll($sql);

 	    $res = array();
 	    if(!empty($data)){ 
 	    	foreach ($data as $key => $value) {
 	    		$res[] = $value['id_category_group']; 	
 	    	} 
 	    }

 	    return $res;
 	}

 	public static function getModulesGroups()
 	{ 
 		global $db;
 		$sql  = " SELECT id, title FROM ".TABLE_PREFIX."modules WHERE 1 ";
 		$data = $db->fetchAll($sql);

 		if(!empty($data)){ 
 			foreach ($data as $k => $item) {
 				$id_module = $item['id'];
 				$sql_mcg = "
 					SELECT mcg.id_category_group, cgm.title
 					FROM ".TABLE_PREFIX."modules_categories_groups mcg 
 					LEFT JOIN ".TABLE_PREFIX."categories_groups_multilingual cgm ON cgm.id_category_group=mcg.id_category_group
 					WHERE mcg.id_module=$id_module AND cgm.id_language=".DEFAULT_LANG_ID."
 				";		
 				$data_mcg = $db->fetchAll($sql_mcg);
 				$data[$k]['categories_groups'] = $data_mcg;

 			} // endforeach
 		} // endif

 		return $data;
 	}

 	public static function getModuleIdBySlug($slug)
 	{
 		$module = Application_Model_Global::pselectRow(TABLE_PREFIX."modules", "id", " slug=:slug ",array(":slug" => $slug));
 		if(!empty($module)){
 			return (int)$module['id'];
 		}else{
 			return 0;
 		}
 	}

 	public static function getTitleModuleIdBySlug($slug)
 	{
 		$module = Application_Model_Global::pselectRow(TABLE_PREFIX."modules", "id,title", " slug=:slug ",array(":slug" => $slug));
 		if(!empty($module)){
 			return $module ;
 		}else{
 			return array() ;
 		}
 	}
}