<?php
/**
 * SEO add-on
 */

$this->attach('view_head', 1, function($view) {
	$options = Zend_Registry::get("option");

	$front      = Zend_Controller_Front::getInstance();
	$request    = $front->getRequest();
	$controller = $request->getControllerName();
	$action     = $request->getActionName();
	$module   	= $request->getModuleName();

	$site_name = $options->site_name;
	$site_link_website = $options->company_site;	
	$facebook_ask_filter_id = $options->facebook_ask_filter_id;
	$twitter_site = $options->twitter_site;
	// $baseUrl = Application_Plugin_Common::getFullBaseUrl();
	$url = Zend_Controller_Front::getInstance()->getRequest()->getRequestUri();
	$t = Zend_Registry::get("Zend_Translate");
	
	$seo = '<meta charset="UTF-8" />' ;

	$seo .= '<meta http-equiv="X-UA-Compatible" content="IE=edge">' ;
	$seo .= '<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">' ;
	$seo .= '<meta name="theme-color" content="#9cc327">' ;

	$twitter_card = '';
	$open_graph   = '';

	// seo canonical link
	$seo .= '<link rel="canonical" href="'.$site_link_website.$url.'">';

	$og_locale = "fr_FR";
	if(DEFAULT_LANG_ABBR == "fr"){
		// en as alternate
		$seo .= '<link rel="alternate" type="text/html" hreflang="en-us" href="'.$site_link_website.'/en'.$url.' title="English (US)"/>';
	}elseif(DEFAULT_LANG_ABBR=="en"){
		// fr as alternate
		$og_locale = "en_US";
		$seo .= '<link rel="alternate" type="text/html" hreflang="fr" href="'.$site_link_website.$url.'" title="Français"/>';
	}

  	$translate = Zend_Registry::get('Zend_Translate');

	switch ($module) {
		case 'default':
			switch ($controller) {
				case 'index':
					$getSeo= Application_Model_Seo::getSeo('index');
					$seoId = $getSeo["seo_id"] ;

					$seo_title = strip_tags($getSeo['seo_title']);
					$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
					$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

					$seo_title = str_replace("#site_name#", $site_name, $seo_title);
					$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
					$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

					$seo .= '<title>'.$seo_title.'</title>';
					$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
					$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

					$home_image = Application_Model_Seo::getOgImage($seoId) ;

					// twitter card
					$twitter_card .= '<meta name="twitter:card" content="summary" />';
					$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
					$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
					$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
					$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

					// open graph
					$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
					$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
					$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
					$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
					$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
					$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
					$open_graph .= '<meta property="og:type" content="object" />';
				break;

				case 'pages':
					switch ($action) {
						case 'about':
								$getSeo= Application_Model_Seo::getSeo('pages_about');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;

						case 'quality':
								$getSeo= Application_Model_Seo::getSeo('pages_quality');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;

						case 'farm':
								$getSeo= Application_Model_Seo::getSeo('pages_farm');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;

						case 'approach':
								$getSeo= Application_Model_Seo::getSeo('pages_approach');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;

						case 'legalnotice':
								$getSeo= Application_Model_Seo::getSeo('pages_legalnotice');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;
						
						default:
							break;
					}
				break;

				case 'products':
					switch ($action) {
						case 'index':
								$category_permalink = $request->getParam('category_permalink');

								$get = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_groups_multilingual","id_category_group,title","permalink = :category_permalink AND id_language = :id_language",array(":category_permalink" => $category_permalink,":id_language" => DEFAULT_LANG_ID)) ;

								$getSeo= Application_Model_Seo::getSeo('products_index');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_title = str_replace("#category_permalink#", $get["title"], $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;

						case 'fiche':
								$permalink = $request->getParam('permalink');
								$datas = $view->datas;

								$get = Application_Model_Category::getCategoryIdByPermalink($permalink) ;

								$getSeo= Application_Model_Seo::getSeo('products_fiche');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($datas['category_text']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_title = str_replace("#permalink#", $get["category_title"], $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								if (!empty($datas["category_cover"]["url"])) {
									$home_image = $datas["category_cover"]["url"] ;
								}
								else{
									$home_image = Application_Model_Seo::getOgImage($seoId) ;
								}


								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;
						
						case 'all':
								$getSeo= Application_Model_Seo::getSeo('products_all');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;

						default:
							# code...
							break;
					}
				break;

				case 'news':
					switch ($action) {
						case 'index':
								$getSeo= Application_Model_Seo::getSeo('news_index');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							# code...
							break;
						
						case 'fiche':
								$permalink = $request->getParam('permalink');
								$get = Application_Model_Page::getPageByPermalink($permalink) ;
								$new = Application_Model_Page::getPageByPageId($get["id_page"]) ;

								$getSeo= Application_Model_Seo::getSeo('news_fiche');
								$seoId = $getSeo["seo_id"] ;

								$seo_title = strip_tags($getSeo['seo_title']);
								$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
								$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

								$seo_title = str_replace("#site_name#", $site_name, $seo_title);
								$seo_title = str_replace("#permalink#", $get["title"], $seo_title);
								$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
								$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

								$seo .= '<title>'.$seo_title.'</title>';
								$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
								$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

								$home_image = ($new["cover"]["id_media"]) ? $new["cover"]["url"] : Application_Model_Seo::getOgImage($seoId) ;

								// twitter card
								$twitter_card .= '<meta name="twitter:card" content="summary" />';
								$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
								$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
								$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
								$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

								// open graph
								$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
								$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
								$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
								$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
								$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
								$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
								$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
								$open_graph .= '<meta property="og:type" content="object" />';
							break;
						

						default:
							# code...
							break;
					}
				break;

				case 'contact':
					$getSeo= Application_Model_Seo::getSeo('contact');
					$seoId = $getSeo["seo_id"] ;

					$seo_title = strip_tags($getSeo['seo_title']);
					$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
					$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

					$seo_title = str_replace("#site_name#", $site_name, $seo_title);
					$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
					$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

					$seo .= '<title>'.$seo_title.'</title>';
					$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
					$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

					$home_image = Application_Model_Seo::getOgImage($seoId) ;

					// twitter card
					$twitter_card .= '<meta name="twitter:card" content="summary" />';
					$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
					$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
					$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
					$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

					// open graph
					$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
					$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
					$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
					$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
					$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
					$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
					$open_graph .= '<meta property="og:type" content="object" />';
				break;

				case 'pages':
					switch ($action) {
						case 'tickets':
							$getSeo= Application_Model_Seo::getSeo('tickets');
							$seoId = $getSeo["seo_id"] ;

							$seo_title = strip_tags($getSeo['seo_title']);
							$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
							$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

							$seo_title = str_replace("#site_name#", $site_name, $seo_title);
							$seo_meta_keyword = str_replace("#site_name#", $site_name, $seo_meta_keyword);

							$seo .= '<title>'.$seo_title.'</title>';
							$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
							$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

							// site image
							$home_image = Application_Model_Seo::getOgImage($seoId) ;

							// twitter card
							$twitter_card .= '<meta name="twitter:card" content="summary" />';
							$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
							$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
							$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
							$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

							// open graph
							$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
							$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
							$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
							$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
							$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
							$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
							$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
							$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
							$open_graph .= '<meta property="og:type" content="object" />';
						break;

						default:
						break;
					}
				break;

				case 'error':
					$getSeo= Application_Model_Seo::getSeo('error');
					$seoId = $getSeo["seo_id"] ;

					$seo_title = strip_tags($getSeo['seo_title']);
					$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
					$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

					$seo_title = str_replace("#site_name#", $site_name, $seo_title);
					$seo_meta_keyword = str_replace("#site_name#", $site_name, $seo_meta_keyword);

					$seo .= '<title>'.$seo_title.'</title>';
					$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
					$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

					// site image
					$home_image = Application_Model_Seo::getOgImage($seoId) ;

					// twitter card
					$twitter_card .= '<meta name="twitter:card" content="summary" />';
					$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
					$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
					$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
					$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

					// open graph
					$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
					$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
					$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
					$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
					$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
					$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
					$open_graph .= '<meta property="og:type" content="object" />';
				break;

				case 'comingsoon':
					$getSeo= Application_Model_Seo::getSeo('comingsoon');
					$seoId = $getSeo["seo_id"] ;

					$seo_title = strip_tags($getSeo['seo_title']);
					$seo_meta_description = strip_tags($getSeo['seo_meta_description']);
					$seo_meta_keyword = strip_tags($getSeo['seo_meta_keyword']);

					$seo_title = str_replace("#site_name#", $site_name, $seo_title);
					$seo_meta_description = str_replace("#site_name#", $site_name, $seo_meta_description);
					$seo_meta_keyword = str_replace("#site_name#", strtolower($site_name), $seo_meta_keyword);

					$seo .= '<title>'.$seo_title.'</title>';
					$seo .= '<meta name="description" content="'.$seo_meta_description.'">';
					$seo .= '<meta name="keywords" content="'.$seo_meta_keyword.'">';

					$home_image = Application_Model_Seo::getOgImage($seoId) ;

					// twitter card
					$twitter_card .= '<meta name="twitter:card" content="summary" />';
					$twitter_card .= '<meta name="twitter:site" content="@'.$twitter_site.'" />';
					$twitter_card .= '<meta name="twitter:title" content="'.$seo_title.'" />';
					$twitter_card .= '<meta name="twitter:description" content="'.$seo_meta_description.'" />';
					$twitter_card .= '<meta name="twitter:image" content="'.$home_image.'" />';

					// open graph
					$open_graph .= '<meta property="fb:ask_filter_id" content="'.$facebook_ask_filter_id.'">';
					$open_graph .= '<meta property="og:site_name" content="'.$site_name.'" />';
					$open_graph .= '<meta property="og:url" content="'.$site_link_website.$url.'/" />';
					$open_graph .= '<meta property="og:title" content="'.$seo_title.'" />';
					$open_graph .= '<meta property="og:description" content="'.$seo_meta_description.'" />';							
					$open_graph .= '<meta property="og:image" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:image:url" content="'.$home_image.'" />';
					$open_graph .= '<meta property="og:locale" content="'.$og_locale.'" />';
					$open_graph .= '<meta property="og:type" content="object" />';
				break;

				default:
				break;
			}	
		break;

		default:
			break;
	}

	echo $seo;
	echo $twitter_card;
	echo $open_graph;
});