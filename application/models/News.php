<?php

class Application_Model_News { 
 	
 	public static function getCommentsByIdNew($id_new,$archive = 0)
 	{
 		$w = "1 AND nc.id_new = :id_new AND nc.hidden = :archive" ;

 		$sql = "
 			SELECT 
 				nc.id
 				,nc.id_new
 				,nc.name as author_name
 				,nc.email
 				,nc.comment
 				,DATE(nc.create_time) as create_date
 				,TIME(nc.create_time) as create_time 
 			FROM ".TABLE_PREFIX."news_comments nc
 			WHERE {$w}
 			ORDER BY nc.create_time DESC
 		";

 		$comments = Application_Model_Global::pquery($sql,array(
 			":id_new" => $id_new
 			,":archive" => $archive
 		));

 		if (!empty($comments)) {
 			foreach ($comments as $key => $value) {
 				$comments[$key]["publication_date"] = ucwords(Application_Class_Date::formatfromMysql($value['create_date']));
 			}
 		}

 		return $comments ;
 	} 

 	public static function getPostViews($id_new){
 		$sql = "
 			SELECT 
 				COUNT(id) as nb_views
 			FROM ".TABLE_PREFIX."news_visits
 			WHERE id_new = :id_new
 		" ;

 		return Application_Model_Global::pqueryRow($sql,array(":id_new" => $id_new)) ;
 	}
 	 
 	public static function setPostViews($id_new) {
 		$ip = $_SERVER["REMOTE_ADDR"];

 		$w = "id_new = :id_new AND ip = :ip" ;
 		$wparams = array(
 			":id_new" => $id_new
 			,":ip" => $ip
 		) ;
 		$get = Application_Model_Global::pselectRow(TABLE_PREFIX."news_visits","id",$w,$wparams) ;

 		if (empty($get)) {
 		    $data_in = array(
 		        'id_new' => $id_new
 		        ,'ip' => $ip
 		    );
 		    Application_Model_Global::insert(TABLE_PREFIX . "news_visits", $data_in);
 		}

 		return 1 ;
 	}
}