<?php

class Application_Model_Seo  { 
 	
 	public static function getSeoMultilingual()
 	{ 
 		return Application_Model_Multilingual::get(TABLE_PREFIX."seo", TABLE_PREFIX."seo_multilingual", 'id', 'id_seo');		  	 
 	} 

 	public static function getSeoMultilingualById($id)
 	{ 
 		return Application_Model_Multilingual::byid(TABLE_PREFIX."seo", TABLE_PREFIX."seo_multilingual", 'id', 'id_seo', $id, 'tm.seo_title, tm.seo_meta_description, tm.seo_meta_keyword,tm.seo_h1,tm.seo_h2',false);			 
 	}

 	public static function getSeo($page,$module = "default")
 	{
        $current_id_language = Application_Model_Language::getCurrentId();
 		$req = "
            SELECT 
                s.id as seo_id
                ,s.page
                ,sm.seo_title
                ,sm.seo_meta_description
                ,sm.seo_meta_keyword
                ,sm.seo_h1
                ,sm.seo_h2
            FROM " . TABLE_PREFIX . "seo s
            LEFT JOIN " . TABLE_PREFIX . "seo_multilingual sm ON (s.id=sm.id_seo AND sm.id_language=" . $current_id_language .")
            WHERE s.page=:page
        ";
        $res = Application_Model_Global::pqueryRow($req,array(":page" => $page));

        return $res;
 	}

    public static function getOgImage($seoId,$size_name = "facebook")
    {
        $id_media = Application_Model_Media::getCoverIdMedia("metas", $seoId);
        if ($id_media) {
            $home_image = Application_Model_Media::getCover("metas", $seoId, $size_name);
        }
        else{
            $home_image = THEMES_DEFAULT_URL.Zend_Registry::get('option')->default_cover_url ;
        }

        return $home_image ;
    }
}