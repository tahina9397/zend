<?php

class Application_Model_Page { 
 	
 	public static function getPages() { 
 		return Application_Model_Multilingual::get(TABLE_PREFIX."pages", TABLE_PREFIX."pages_multilingual", 'id', 'id_page');		  	 
 	} 

 	public static function getPageById($id){ 
 		return Application_Model_Multilingual::byid(TABLE_PREFIX."pages", TABLE_PREFIX."pages_multilingual", 'id', 'id_page', $id, 'tm.title, tm.text, tm.seo_title, tm.seo_meta_description, tm.seo_meta_keyword,tm.seo_permalink,tm.icon', false);			 
 	}

 	public static function getPageByCatId($category_id,$size_name = "source",$filter = array())
 	{
 		$w = "1 AND pc.id_category=:category_id AND p.hidden=0 " ;
 		$tab_params[":category_id"] = $category_id ;

 		if ($filter["q"]) {
 			$w .= " AND MATCH(pm.title,pm.text) AGAINST ('".$filter["q"]."' IN NATURAL LANGUAGE MODE)" ;
 		}
 		else if ($filter["d"]) {
 			$w .= " AND YEAR(p.create_time) = :date_publication_year AND MONTH(p.create_time) = :date_publication_month " ;
 			$tab_params[":date_publication_year"] = date("Y",strtotime($filter["d"])) ;
 			$tab_params[":date_publication_month"] = date("m",strtotime($filter["d"])) ;
 		}
 		
 		$sql = "
			SELECT 
				p.id as page_id
				,p.icon
				,DATE(create_time) as create_date
				,pm.title
				,pm.text
				,pm.seo_permalink
			FROM ".TABLE_PREFIX."pages p
			LEFT JOIN ".TABLE_PREFIX."pages_multilingual pm ON (p.id=pm.id_page AND pm.id_language=".DEFAULT_LANG_ID.")
			LEFT JOIN ".TABLE_PREFIX."pages_categories pc ON (p.id=pc.id_page)
			WHERE {$w}
			ORDER BY p.create_time ASC
		";	
		$page = Application_Model_Global::pquery($sql,$tab_params);

		if (!empty($page)) {
			foreach ($page as $key => $item) {
				$page[$key]['cover']['id_media'] = $id_media = Application_Model_Media::getCoverIdMedia("pages", $item['page_id']);

				if ($id_media) {
				    $page[$key]['cover']['url'] = Application_Model_Media::getCover("pages", $item['page_id'], $size_name);
				    $page[$key]['cover']['width'] = Application_Model_Media::getMediaWidth($id_media, $size_name);
				    $page[$key]['cover']['height'] = Application_Model_Media::getMediaHeight($id_media, $size_name);
				    $page[$key]['cover']['metas'] = Application_Model_Media::get($id_media);
				}
			}
		}

		$sql_category = "
			SELECT 
				cm.title as category_title
				,cm.short_description as category_description
				,cm.text as category_text
				,cm.seo_permalink as category_permalink
				,cgm.permalink as category_group_permalink
			FROM ".TABLE_PREFIX."categories_multilingual cm
			INNER JOIN ".TABLE_PREFIX."categories c ON (c.id = cm.id_category)
			INNER JOIN ".TABLE_PREFIX."categories_groups_multilingual cgm ON (cgm.id_category_group= c.id_category_group)
			WHERE cm.id_category=:category_id AND cm.id_language=".DEFAULT_LANG_ID."
		";	
		$category = Application_Model_Global::pqueryRow($sql_category,array(":category_id" => $category_id));

		$id_media = Application_Model_Media::getCoverIdMedia("category", $category_id);

		if ($id_media) {
		    $category['cover']['url'] = Application_Model_Media::getCover("category", $category_id, $size_name);
		    $category['cover']['width'] = Application_Model_Media::getMediaWidth($id_media, $size_name);
		    $category['cover']['height'] = Application_Model_Media::getMediaHeight($id_media, $size_name);
		    $category['cover']['metas'] = Application_Model_Media::get($id_media);
		}

		return array(
			"category_title" => $category['category_title']
			,"category_text" => $category['category_text']
			,"category_description" => $category['category_description']
			,"category_cover" => $category['cover']
			,"category_permalink" => $category['category_permalink']
			,"category_group_permalink" => $category['category_group_permalink']
			,"content" => $page
		);
 	}

 	public static function getPageByPageId($page_id,$size_name = "source"){
 		$sql = "
			SELECT 
				pm.title
				,pm.text
				,pm.icon
				,pm.seo_permalink
				,pc.id_category
				,DATE(p.create_time) as create_time
			FROM ".TABLE_PREFIX."pages p
			LEFT JOIN ".TABLE_PREFIX."pages_multilingual pm ON (p.id=pm.id_page AND pm.id_language=".DEFAULT_LANG_ID.")
			LEFT JOIN ".TABLE_PREFIX."pages_categories pc ON (p.id=pc.id_page)
			WHERE p.id=:page_id AND p.hidden=0 
		";	
		$page = Application_Model_Global::pqueryRow($sql,array(":page_id" => $page_id));

		if (!empty($page)) {
			$page['cover']['id_media'] = $id_media = Application_Model_Media::getCoverIdMedia("pages", $page_id);

			if ($id_media) {
			    $page['cover']['url'] = Application_Model_Media::getCover("pages", $page_id, $size_name);
			    $page['cover']['width'] = Application_Model_Media::getMediaWidth($id_media, $size_name);
			    $page['cover']['height'] = Application_Model_Media::getMediaHeight($id_media, $size_name);
			    $page['cover']['metas'] = Application_Model_Media::get($id_media);
			}

			// $category_id = $page['id_category'] ;

			// $sql_category = "
			// 	SELECT 
			// 		cm.title as category_title
			// 		,cm.short_description as category_description
			// 		,cm.text as category_text
			// 	FROM ".TABLE_PREFIX."categories_multilingual cm
			// 	WHERE cm.id_category=:category_id 
			// ";	
			// $category = Application_Model_Global::pqueryRow($sql_category,array(":category_id" => $category_id));
		}

		return $page ;
	}

	public static function getPageByPermalink($seo_permalink){
 		$sql = "
			SELECT 
				pm.title
				,pm.id_page
				,pm.text
				,pm.icon
			FROM ".TABLE_PREFIX."pages p
			LEFT JOIN ".TABLE_PREFIX."pages_multilingual pm ON (p.id=pm.id_page AND pm.id_language=".DEFAULT_LANG_ID.")
			WHERE pm.seo_permalink=:seo_permalink AND p.hidden = 0
		";	
		$page = Application_Model_Global::pqueryRow($sql,array(":seo_permalink" => $seo_permalink));
		return $page;
 	}



}