<?php

class Application_Class_Url {

	public static function getPageById($id)
	{
		$sql = "
			SELECT p.id, pm.title, pm.seo_permalink
			FROM ".TABLE_PREFIX."pages p
			LEFT JOIN ".TABLE_PREFIX."pages_multilingual pm ON (p.id=pm.id_page AND pm.id_language=".DEFAULT_LANG_ID.")
			WHERE p.id=:id
		";
		$page = Application_Model_Global::pqueryRow($sql,array(":id"=>$id));

		// seo_permalink
		if(is_null($page["seo_permalink"]) or strlen($page["seo_permalink"])==0){
			$page["seo_permalink"] = Application_Class_String::cleanString($page["title"]);
		}

		return $page;
	}

	public static function getCategoryById($id)
	{
		$sql = "
			SELECT c.id, cm.title, cm.seo_permalink
			FROM ".TABLE_PREFIX."categories c
			LEFT JOIN ".TABLE_PREFIX."categories_multilingual cm ON (c.id=cm.id_category AND cm.id_language=".DEFAULT_LANG_ID.")
			WHERE c.id=:id
		";
		$category = Application_Model_Global::pqueryRow($sql,array(":id" => $id));

		// seo_permalink
		if(is_null($category["seo_permalink"]) or strlen($category["seo_permalink"])==0){
			$category["seo_permalink"] = Application_Class_String::cleanString($category["title"]);
		}

		return $category;		
	}

	public static function get($page, $params, $full = false){
	    $t = Zend_Registry::get('Zend_Translate');
		$baseUrl = Zend_Registry::get("baseUrl");
		$fullUrl = BASE_URL.$baseUrl;
		
		switch ($page){
			case 'search':
					$depart = Application_Model_Global::pselectRow(TABLE_PREFIX."villes","code","id=:id_code_ville_depart",array(":id_code_ville_depart" => $params["id_code_ville_depart"])) ;
					$arrivee = Application_Model_Global::pselectRow(TABLE_PREFIX."villes","code","id=:id_code_ville_arrivee",array(":id_code_ville_arrivee" => $params["id_code_ville_arrivee"])) ;

					switch ($params["id_category"]) {
						case "premiere_classe":
							$category_permalink = "premiere_classe" ;
							break;
					}

					$url = "reservations?depart=".$depart["code"]."&arrivee=".$arrivee["code"]."&date=".$params["date_depart"]."&categorie=".$params["id_category"]."&id_cooperative=".$params["id_cooperative"];
					
				break;

			default:
				break;
		}

		if($full){
			return $fullUrl.$url;
		}
		return $baseUrl.$url;
	}

	public static function getMultilingualUrl($params){
		$option = Zend_Registry::get("option") ;

		$id_language = (int)$params["id_language"];
		$resource = $params["resource"];
		$action = $params["action"];
		$permalink = $params["permalink"];
		$category_permalink = $params["category_permalink"];

		$where = "um.id_language = :id_language AND u.resource = :resource AND u.action = :action " ;
		$tab_params[":id_language"] = $id_language ;
		$tab_params[":resource"] = $resource ;
		$tab_params[":action"] = $action ;

		$sql  = "
			SELECT
				u.page
				,um.url
			FROM ".TABLE_PREFIX."url_multilingual um
			INNER JOIN ".TABLE_PREFIX."url u ON (u.id = um.id_url)
			WHERE {$where}
		" ;

		$getUrl = Application_Model_Global::pqueryRow($sql,$tab_params) ;

	 	$languages = Application_Model_Language::getLanguages();
        foreach ($languages as $k => $language) {
        	$id_lang = $language["id"] ;
        	$tab_abbreviation[$id_lang] = $language["abbreviation"] ;
        }
		
		$url = $option->company_site ;

		if (!empty($getUrl["page"])) {
			$url .= ($id_language == 1) ? "/".$getUrl["page"] : "/".$tab_abbreviation[$id_language]."/".$getUrl["page"] ;
		}
		else{
			$url .= ($id_language == 1) ? "" : "/".$tab_abbreviation[$id_language] ;
		}

		/*get mulitlingual permalink*/

		if ($resource == "products") {
			if (!is_null($category_permalink)) {
				$get = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_groups_multilingual","id_category_group","permalink = :category_permalink",array(
					":category_permalink" => $category_permalink 
				)) ;

				$tab_permalink = Application_Model_Global::pselect(TABLE_PREFIX."categories_groups_multilingual","permalink","id_category_group = :id_category_group",array(
					":id_category_group" => $get["id_category_group"] 
				)) ;

				$category_permalink_multi[1] = $tab_permalink[0]["permalink"] ;
				$category_permalink_multi[2] = $tab_permalink[1]["permalink"] ;
			}
		}

		if (!empty($permalink)) {
			switch ($resource) {
				case 'products':
						$get = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_multilingual","id_category","seo_permalink = :permalink",array(
							":permalink" => $permalink 
						)) ;

						$tab_permalink = Application_Model_Global::pselect(TABLE_PREFIX."categories_multilingual","seo_permalink","id_category = :id_category",array(
							":id_category" => $get["id_category"] 
						)) ;

						$permalink_multi[1] = $tab_permalink[0]["seo_permalink"] ;
						$permalink_multi[2] = $tab_permalink[1]["seo_permalink"] ;
					break;
				
				case 'news':
						$get = Application_Model_Global::pselectRow(TABLE_PREFIX."pages_multilingual","id_page","seo_permalink = :permalink",array(
							":permalink" => $permalink 
						)) ;

						$tab_permalink = Application_Model_Global::pselect(TABLE_PREFIX."pages_multilingual","seo_permalink","id_page = :id_page",array(
							":id_page" => $get["id_page"] 
						)) ;

						$permalink_multi[1] = $tab_permalink[0]["seo_permalink"] ;
						$permalink_multi[2] = $tab_permalink[1]["seo_permalink"] ;
					break;

				default:
					break;
			}
		}

		$url .= (!empty($getUrl["url"])) ? "/".$getUrl["url"] : "" ;

		if ($resource == "products" && !empty($category_permalink_multi[$id_language])) {
			$url = str_replace("#category_permalink#", $category_permalink_multi[$id_language], $url) ;
		}

		return (!empty($permalink_multi[$id_language])) ? str_replace("#permalink#", $permalink_multi[$id_language], $url) : $url ;
	}

	public function getBootstrapUrl($params)
	{
		$_module = $params["module"] ;
		$_controller = $params["controller"] ;
		$_action = $params["action"] ;
		$formatted_link = $params["formatted_link"] ;

		$route = new Zend_Controller_Router_Route_Regex(
		    $formatted_link,
		    array(
		        'module'      => $_module
		        ,'controller' => $_controller
		        ,'action'     => $_action
		    ),
		    array(
		    ),
		    $formatted_link
		);

		return $route ;
	}

	public function getUrl($resource,$action)
	{
		$sql  = "
			SELECT
				um.url
			FROM ".TABLE_PREFIX."url_multilingual um
			INNER JOIN ".TABLE_PREFIX."url u ON (u.id = um.id_url)
			WHERE u.resource = :resource AND u.action = :action
		" ;

		$get = Application_Model_Global::pquery($sql,array(
			":resource" => $resource
			,":action" => $action
		)) ;

		return $get ;
	}
}