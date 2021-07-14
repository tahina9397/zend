<?php

class Application_Model_Category  { 
 	
 	public static function getCategories(){ 
 		return Application_Model_Multilingual::get(TABLE_PREFIX."categories", TABLE_PREFIX."categories_multilingual", 'id', 'id_category');		  	 
 	}

 	public static function getCategory($except_ids = array())
    {
        $where = "1" ;

        if(!empty($except_ids)){
            $where .= " AND c.id NOT IN(".$except_ids.")";
        }


        $sql = "
            SELECT c.id, cm.id_category, cm.title,cm.seo_permalink,c.order_item
            FROM ".TABLE_PREFIX."categories c 
            LEFT JOIN ".TABLE_PREFIX."categories_multilingual cm ON (c.id=cm.id_category AND cm.id_language=".DEFAULT_LANG_ID.")
            WHERE $where
            ORDER BY cm.title ASC
        ";

        return Application_Model_Global::pquery($sql,array());
    }

    public static function getCategoryIdByPermalink($category_permalink){
        $sql = "
            SELECT 
                c.id as id_category 
                ,c.id_category_group as id_category_group
                ,cm.title as category_title
            FROM ".TABLE_PREFIX."categories c 
            LEFT JOIN ".TABLE_PREFIX."categories_multilingual cm ON (c.id=cm.id_category AND cm.id_language=".DEFAULT_LANG_ID.")
            LEFT JOIN ".TABLE_PREFIX."categories_groups cg ON (cg.id=c.id_category_group)
            WHERE cm.seo_permalink=:category_permalink
        ";
        $data = Application_Model_Global::pqueryRow($sql,array(":category_permalink" => $category_permalink));

        // if(!empty($data)){
        //     return (int) $data['id_category'];
        // }

        return $data;
    }

    public static function slugify($name, $except_id = null)
    {
        $seo_permalink = Application_Class_String::cleanString($name);
        if((int)$except_id){
            $where = "AND cm.id_category NOT IN($except_id)";
        }
        $query = "
            SELECT COUNT(*) AS numhits 
            FROM ".TABLE_PREFIX."categories_multilingual cm
            WHERE 1 AND cm.seo_permalink LIKE :seo_permalink $where
        ";
        $result = Application_Model_Global::pqueryRow($query,array(":seo_permalink" => $seo_permalink));

        $numhits = 0;
        if(!empty($result)){
            $numhits = $result['numhits'];
        }

        return ($numhits > 0) ? ($seo_permalink . '-' . $numhits) : $seo_permalink;
    }

 	public static function getCategoryById($id,$size_name = "source"){ 
 		$res = Application_Model_Multilingual::byid(TABLE_PREFIX."categories", TABLE_PREFIX."categories_multilingual", 'id', 'id_category', $id, 'tm.title, tm.text,tm.short_description, tm.seo_title, tm.seo_meta_description, tm.seo_meta_keyword,tm.seo_permalink');

        if (!empty($res)) {
            /*get permalink*/
            $p = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_groups_multilingual","permalink as category_permalink","id_category_group = :id_category_group",array(":id_category_group" => $res["id_category_group"])) ;

            $res["category_permalink"] = $p["category_permalink"] ;


            $res['cover']['id_media'] = $id_media = Application_Model_Media::getCoverIdMedia("category", $res['id']);

            if ($id_media) {
                $res['cover']['url'] = Application_Model_Media::getCover("category", $res['id'], $size_name);
                $res['cover']['width'] = Application_Model_Media::getMediaWidth($id_media, $size_name);
                $res['cover']['height'] = Application_Model_Media::getMediaHeight($id_media, $size_name);
                $res['cover']['metas'] = Application_Model_Media::get($id_media);
            }
        }			

        return $res ; 
 	}

 	public static function getCategoryByIdCategoryGroup($id_category_group,$archive = 0)
 	{ 
 		global $db;

        if (is_array($id_category_group)) {
            $category_str = implode(",", $id_category_group ) ;
            $w = "WHERE c.id_category_group IN ($category_str) " ;
        }
        else{
            $w = "WHERE c.id_category_group=$id_category_group" ;
        }

        if ($archive) {
            $w .= " AND c.archive = 1" ;
        }

 		$sql = "
 			SELECT c.id, c.id_category_group, c.order_item, c.uniqid, cm.title
 			FROM ".TABLE_PREFIX."categories c
 			LEFT JOIN ".TABLE_PREFIX."categories_multilingual cm ON ( c.id=cm.id_category AND cm.id_language=".DEFAULT_LANG_ID." ) 
 			{$w}
 			ORDER BY c.order_item ASC
 		"; 

 		$data = $db->fetchAll($sql);
 		return $data;
 	}	

 	public static function getCategoryBox($id_category_group)
 	{
 		global $db;
 		$categories_box = array();

 		$name_sql = "
 			SELECT title
 			FROM ".TABLE_PREFIX."categories_groups_multilingual 
 			WHERE id_category_group=$id_category_group AND id_language=".DEFAULT_LANG_ID."
 		";
 		
 		$name_run = $db->fetchRow($name_sql);
 		$categories_box['categories_name'] = $name_run['title'];

 		$list_sql = "
 			SELECT cm.title, cm.id_category , cm.seo_permalink
 			FROM ".TABLE_PREFIX."categories_multilingual cm 
 			JOIN ".TABLE_PREFIX."categories c ON cm.id_category = c.id 
 			WHERE cm.id_language=".DEFAULT_LANG_ID." AND c.id_category_group=$id_category_group
 			ORDER BY cm.title ASC
 		";
 		$list_run = $db->fetchAll($list_sql);

 		if(!empty($list_run)){ 
 			foreach ($list_run as $key => $value) {
 				$categories_box['categories_list'][] = $value; 	
 			} 
 		}

 		return $categories_box;
 	}

 	public static function getCheckedCategories($id_category_group, $item_id, $table, $fk){
 		global $db; 

 		$categories = array();
 		$categoriesquery = "
 			SELECT * 
 			FROM ".TABLE_PREFIX."$table tc 
 			JOIN ".TABLE_PREFIX."categories c ON tc.id_category = c.id  
 			WHERE tc.$fk = $item_id AND c.id_category_group=$id_category_group
 		";
 		$categoriesresult = $db->fetchAll($categoriesquery);

 		if(!empty($categoriesresult)){ 
 			foreach ($categoriesresult as $key => $value) {
 			 	$categories[] = $value['id_category'];	
 			} 
 		}

 		return $categories;
 	}

    public static function getCategoryTitleByModule($module)
    {
        $category = array();

        $module_id = Application_Model_Module::getModuleIdBySlug($module);
        $id_category_group = Application_Model_Module::getIdCategoryGroupByModule($module_id);

        if(!empty($id_category_group)){
            foreach ($id_category_group as $key => $value) {
                $categories = Application_Model_Category::getCategoryBox($value);
                if(!empty($categories)){
                    foreach ($categories['categories_list'] as $k => $item) {
                        $category[] = array("category_title"=>$item['title'],"category_name"=>$categories['categories_name'],"category_id"=>$item['id_category']);
                    }
                }
            }
        }

        return $category ;

    }

    public static function getCatById($id_category,$id_language = DEFAULT_LANG_ID)
    {
        $sql = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_multilingual","title","id_category = :id_category AND id_language = :id_language",array(":id_category" => $id_category,":id_language" => $id_language)) ;

        if (!empty($sql)) {
            return $sql["title"] ;
        }
        
    }
}