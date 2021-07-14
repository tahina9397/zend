<?php
class Application_Class_Snippets {

	public static function multilingualTabs()
	{ 
		$translator = Zend_Registry::get('Zend_Translate');
		$languages = Application_Model_Language::getLanguages();

	 	$return = '';
	 	$return .= '<ul class="nav-multilingual nav nav-tabs">';
 
 		if(!empty($languages)){ 
 		 	foreach ($languages as $k => $item) {
 		 		$active = ($k==0) ? 'class="active"' : '' ;
 		 		$return .= '<li '.$active.'><a data-toggle="tab" style="cursor:pointer" abbr="'.$item['abbreviation'].'" >'.$item['title'].'</a></li>';	 	
 		 	} 
 		} 	 	

	 	$return .= '</ul>';
	 	echo $return;
	}

	public static function breadcrumb($module, $module_url)
	{ 
		$translator = Zend_Registry::get('Zend_Translate');
		$view = new Zend_View();

		$locale = Zend_Registry::get('Zend_Locale')->getLanguage();

		$front      = Zend_Controller_Front::getInstance();
		$request    = $front->getRequest();
		$controller = $request->getControllerName();
		$action     = $request->getActionName();

		// $uri = $request->getRequestUri(); 
		// if($locale!="fr"){
		// 	$uri_lang = str_replace("/".$locale, "", $uri);
		// }else{
		// 	$uri_lang = "/en";
		// 	$uri_lang .= $uri;
		// }

		// $label_locale = NULL;
		// if($locale=="fr") 
		// 	$label_locale = $translator->translate("English");
		// elseif($locale=="en") 
		// 	$label_locale = $translator->translate("Français");
		
		$return = '';
		$return .= '
		<div class="crumbs">
		    <ul id="breadcrumbs" class="breadcrumb"> 
		        <li><a href="'.$view->baseUrl().'">'.$translator->translate("Tableau de bord").'</a></li>
		        <li class="active"><a href="'.$module_url.'" title="">'.$module.'</a></li>
		    </ul>
		    
		    <ul class="breadcrumb-right">
		    	<li><a target="_blank" href="'.Zend_Registry::get("option")->company_site.'" title="'.$translator->translate("Visiter le site").'"><i class="icon-home"></i><span>'.$translator->translate("Visiter le site").'</span></a></li>
		        <li><a href="'.$view->baseUrl().'/users" title="'.$translator->translate("Utilisateurs").'"><i class="icon-user"></i><span>'.$translator->translate("Utilisateurs").'</span></a></li>
		        <li><a href="'.$view->baseUrl().'/siteconfiguration" title="'.$translator->translate("Configuration du site").'"><i class="icon-cogs"></i><span>'.$translator->translate("Configuration du site").'</span></a></li>
		    </ul>
		    
		</div>';

		return $return;
	}

	public static function breadcrumbfront($module, $module_url)
	{ 
		$translator = Zend_Registry::get('Zend_Translate');
		$view = new Zend_View();

		$locale = Zend_Registry::get('Zend_Locale')->getLanguage();

		$front      = Zend_Controller_Front::getInstance();
		$request    = $front->getRequest();
		$controller = $request->getControllerName();
		$action     = $request->getActionName();

		$uri = $request->getRequestUri(); 
		if($locale!="fr"){
			$uri_lang = str_replace("/".$locale, "", $uri);
		}else{
			$uri_lang = "/en";
			$uri_lang .= $uri;
		}

		$label_locale = NULL;
		if($locale=="fr") 
			$label_locale = $translator->translate("English");
		elseif($locale=="en") 
			$label_locale = $translator->translate("Français");
		
		$return = '';
		$return .= '
		<div class="crumbs">
		    <ul id="breadcrumbs" class="breadcrumb"> 
		        <li><a href="'.$view->baseUrl().'/">'.$translator->translate("Home").'</a></li>
		        <li class="active"><a href="'.$module_url.'" title="">'.$module.'</a></li>
		    </ul>
		</div>';

		return $return;
	}

}