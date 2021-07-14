<?php

class Application_Model_Multilingual { 
 	
 	public static function get($t, $tm, $kid = 'id', $fid)
 	{ 
 		global $db;
 	
 		$sql = " 
 			SELECT t.*, tm.*
 			FROM  $t t
 			JOIN  $tm tm ON t.$kid=tm.$fid
 			WHERE tm.id_language=".DEFAULT_LANG_ID."
 			ORDER BY t.order_item ASC
 		";

 		$data = $db->fetchAll($sql);
 		return $data; 		  	 
 	} 

 	public static function byid($t, $tm, $pid = 'id', $fid, $id, $ffields, $is_order = true)
 	{ 
 		global $db;

 		$sql_t = "SELECT * FROM $t WHERE id=$id";
 		$t_data = $db->fetchRow($sql_t);

 		$order = ($is_order) ? "ORDER BY t.order_item ASC" : "" ;

 		$sql_tm = " 
 			SELECT 
 				tm.id_language
 				,$ffields
 			FROM  $t t
 			JOIN  $tm tm ON (t.$pid=tm.$fid)
 			WHERE t.id=$id
 			$order
 		";
 		$tm_data = $db->fetchAll($sql_tm);

 		$Seo = new Application_Class_Seo();

 		if(!empty($tm_data)){ 
 			foreach ($tm_data as $k => $item) {
 				$abbr = Application_Model_Language::getAbbr($item['id_language']);

 				foreach ($item as $key => $value) {
 					if($key!='id_language'):
 						$t_data[$key.'_'.$abbr] = $value;

 						if($key=='seo_title'){
 							if(trim($value)==""){
 								$t_data['placeholder_seo_title_'.$abbr] = $Seo->limitTitle($t_data['title_'.$abbr]);
 							}
 						}

 						if($key=='seo_meta_description'){
 							if(trim($value)==""){
 								$t_data['placeholder_seo_meta_description_'.$abbr] = $Seo->limitMetaDescription($t_data['text_'.$abbr]);
 							}
 						}
 					endif;
 				}
 			} 
 		}

 		return $t_data; 		  	 
 	} 

}