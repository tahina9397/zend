<?php

class Trano_TranslationsController extends Application_AbstractController
{
	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');

		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('gettranslations', 'html');
		$ajaxContext->addActionContext('delete', 'html');
		$ajaxContext->addActionContext('massdelete', 'html');
		$ajaxContext->addActionContext('scan', 'html');
		$ajaxContext->addActionContext('changelang', 'html');
		$ajaxContext->initContext();
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Translations');
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/translations/index.js?v='.$this->version, 'text/javascript');

		$id = (int)$this->_getParam('id');
		$this->view->id_language = $id;
		$sess = new Zend_Session_Namespace();	
		$sess->translate_lang_id = $id;	 	 

	}

	public function modifyAction()
	{ 
		$sess = new Zend_Session_Namespace();
		$this->view->headTitle()->append('Edit Translation');

		global $params;
		global $siteconfig;
		$languages = Application_Model_Language::getLanguages();

		$this->view->do = $do = $this->view->escape($this->_getParam('do'));
		$translation = array();
	 	switch ($do) {
	 		case 'edit':
					$id          = (int)$this->_getParam('id');
					$where       = " id=$id ";
					$id_language = (int)$this->_getParam('lang');
					$this->view->id_language = $id_language;

		 			$translation = Application_Model_Translation::getValueMultilingual($id, $id_language);
		 			
	 				if($_POST){ 
		 				/*
		 				 * 2 steps :
		 				 * 1. update Application_translations
		 				 * 2. update Application_translations_multilingual
		 				 */

		 				$id = (int)$_POST['Translations']['id'];
		 				$id_language = (int)$_POST['Translations']['id_language'];
		 				$value = $this->view->escape($_POST['Translations']['value']);

		 				// 1. update Application_translations
		 				$data_translations = array(
							'update_time' => date('Y-m-d H:i:s')
		 				);
		 				Application_Model_Global::pupdate(TABLE_PREFIX.'translations', $data_translations, " id=:id ",array(":id" => $id));

		 				// 2. update Application_categories_multilingual
 						$data_translations_multilingual = array(
							'value' => $value
 						);
 						$where = " id_translation=:id AND id_language=:id_language ";
 						Application_Model_Global::pupdate(TABLE_PREFIX.'translations_multilingual', $data_translations_multilingual, $where,array(":id" => $id,":id_language" => $id_language));
		 			
		 				$this->_redirect('/translations/index/id/'.$id_language);
	 				}		 			
	 				
	 			break;

	 		case 'add':

	 				if($_POST){ 
		 				/*
		 				 * 2 steps :
		 				 * 1. insert in Application_translations
		 				 * 2. insert in Application_translations_multilingual
		 				 */

		 				// 1. insert in Application_translations
		 				$Application_translations = array(
							'create_time'  => date('Y-m-d H:i:s')
							,'update_time' => date('Y-m-d H:i:s')
		 				);

		 				Application_Model_Global::insert(TABLE_PREFIX.'translations', $Application_translations);
		 				$lastId = Application_Model_Global::lastId();

		 				// 2. insert in Application_categories_multilingual
		 				if(!empty($languages)){ 
		 					$key = $value = $this->view->escape($_POST['Translations']['key']);

		 					foreach ($languages as $k => $item) {
		 						$data_translations_multilingual = array(
									'id_translation'         => $lastId
									,'id_language'           => $item['id']
									,'language_abbreviation' => $item['abbreviation']
									,'key'                   => $key
									,'value'                 => $value
		 						);
		 						Application_Model_Global::insert(TABLE_PREFIX.'translations_multilingual', $data_translations_multilingual);
		 					}
		 				}

		 				$this->_redirect('/translations/index/id/'.$sess->translate_lang_id);
	 				}

	 			break;
	 		
	 		default:
	 			break;
	 	}

	 	$this->view->translation = $translation;
	}

	public function gettranslationsAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();
	   	global $db;

		$aColumns = 
			array(
				't.id'
				,'tm.key'
				,'tm.value'
				,'t.update_time'
			);
		   		   		
		/* 
		 * Paging
		 */
		$sLimit = "";
		if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' )
		{
			$sLimit = "LIMIT ".intval( $_GET['iDisplayStart'] ).", ". intval( $_GET['iDisplayLength'] );
		}
		
		/*
		 * Ordering
		 */
		$sOrder = "";
		if ( isset( $_GET['iSortCol_0'] ) )
		{
			$sOrder = "ORDER BY  ";
			for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ )
			{
				if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" )
				{
					$sOrder .= $aColumns[ intval( $_GET['iSortCol_'.$i] ) ]." ". ($_GET['sSortDir_0']==='asc' ? 'ASC' : 'DESC') .", ";
				}
			}
			
			$sOrder = substr_replace( $sOrder, "", -2 );
			if ( $sOrder == "ORDER BY" )
			{
				$sOrder = "";
			}
		}

		/*
		 * Filtering
		 */
		$sWhere = "";
		$sWhereParams = array();
		if (isset($_GET['sSearch']) && $_GET['sSearch'] != "") {
		    $like1 = $_GET['sSearch'] ;
		    $sWhere = "WHERE (";
		    for ( $i=0 ; $i<count($aColumns) ; $i++ )
		    {
		    	$sWhere .= $aColumns[$i]." LIKE :like1 OR ";
		    }

		    $sWhereParams[":like1"] = "%".$like1."%";
		
		    $sWhere = substr_replace($sWhere, "", -3);
		    $sWhere .= ')';
		}

		/* Individual column filtering */
		for ( $i=0 ; $i<count($aColumns) ; $i++ )
		{
			if ( isset($_GET['bSearchable_'.$i]) && $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' )
			{
				if ( $sWhere == "" )
				{
					$sWhere = "WHERE ";
				}
				else
				{
					$sWhere .= " AND ";
				}

				$sWhere .= $aColumns[$i]." LIKE :like2_$i ";
			    $sWhereParams[":like2_$i"] = "%".$_GET['sSearch_' . $i]."%" ;
			}
		}

		/* Get default id_language value */
		$sWhere .= (trim($sWhere)!="") ? " AND (tm.id_language= :id_language)" : " WHERE (tm.id_language= :id_language)" ;

		// /* Get default id_language value */
		$sWhereParams[":id_language"] = DEFAULT_LANG_ID ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS t.id
				,IF(t.update_time='0000-00-00 00:00:00' OR t.update_time IS NULL, '', DATE_FORMAT(t.update_time,'%d %b %Y %H:%i')) AS update_time
				,tm.id_translation
			FROM ".TABLE_PREFIX."translations t
			LEFT JOIN ".TABLE_PREFIX."translations_multilingual tm ON t.id=tm.id_translation
			$sWhere
			GROUP BY t.id
			$sOrder
			$sLimit
		";

		$rResult        = Application_Model_Global::pquery($sQuery,$sWhereParams);
		$total          = Application_Model_Global::pquery("SELECT FOUND_ROWS()",array());
		$iFilteredTotal = $total[0]['FOUND_ROWS()'];
		$iTotal         = $total[0]['FOUND_ROWS()'];
		
		/*
		 * Output
		 */
		$output = array(
			"sEcho"                => intval($_GET['sEcho']),
			"iTotalRecords"        => $iTotal,
			"iTotalDisplayRecords" => $iFilteredTotal,
			"aaData"               => array()
		);

		if(!empty($rResult)){ 
		 	foreach ($rResult as $k => $item) {
		 	 	$row = array();
		 	 	
		 	 	$count = -1;
		 	 	$row[] = '<input type="checkbox" class="styled" value="'.$item['id'].'" name="checked[]" />';

		 	 	//$sess = new Zend_Session_Namespace();	
				$id_language = (int)$_GET['id'];

 				$translations = Application_Model_Translation::getValueMultilingual($item['id_translation'], $id_language);
 				$row[] = $translations['key'];
 				$row[] = $translations['value'];

		 	 	$row[] = $item['update_time'];

		 	 	$id = $item['id_translation'];
		 	 	
		 	 	$url_edit = $this->view->baseUrl().'/translations/modify/id/'.$item['id_translation'].'/lang/'.$id_language.'/do/edit';

		 	 	$row[] = Application_Class_Forms::actions($url_edit,"translations",$item["id_translation"]) ;


		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}

	public function scanAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

		global $dirs_to_translate;
		$languages = Application_Model_Language::getLanguages();

		// add folder with no subfolder(s) directly
		array_push($dirs_to_translate, APPLICATION_PATH.'/forms');

		// add here folder which contains subfolders
		$directories = array(APPLICATION_PATH.'/modules/default');
		if(!empty($directories)){
			foreach ($directories as $k => $directory) {

				//Application_Class_Folder::listDirectory(APPLICATION_PATH);
				Application_Class_Folder::listDirectory($directory);
					
				$content = "";
				$translations = array();

				if(!empty($dirs_to_translate)){ 
					foreach ($dirs_to_translate as $k => $folder) {
			 		    $files = array_filter(glob("$folder/*"), 'is_file');
			 		    $contents = array_map('file_get_contents', $files);
			 		    foreach ($contents as $content) {        
			 	    	    preg_match_all("'translate\(\"(.*?)\"'si", $content, $matchfirst);
			 	    	    if(!empty($matchfirst[1])):
			 	    	    	foreach ($matchfirst[1] as $k => $item) {
			 	    	    		$translations[] = $item;
			 	    	    	}
			 	    	    endif;
			 	    	    
			 	    	    preg_match_all("'translate\(\'(.*?)\''si", $content, $matchsecond);
			 	    	   	if(!empty($matchsecond[1])):
			 	    	   		foreach ($matchsecond[1] as $k => $item) {
			 	    	   			$translations[] = $item;
			 	    	   		}
			 	    	   	endif;
			 		    }
					} 
				}
				
			    if(!empty($translations)){ 
			    	foreach ($translations as $key => $translation) {
			    		if(!Application_Model_Translation::isTranslated($translation)):
			 				/*
			 				 * 2 steps :
			 				 * 1. insert in Application_translations
			 				 * 2. insert in Application_translations_multilingual
			 				 */

			 				// 1. insert in Application_translations
			 				$Application_translations = array(
								'create_time'  => date('Y-m-d H:i:s')
								,'update_time' => date('Y-m-d H:i:s')
			 				);
			 				Application_Model_Global::insert(TABLE_PREFIX.'translations', $Application_translations);
			 				$lastId = Application_Model_Global::lastId();

			 				// 2. insert in Application_categories_multilingual
			 				if(!empty($languages)){ 
			 					foreach ($languages as $k => $item) {
			 						$data_translations_multilingual = array(
										'id_translation'         => $lastId
										,'id_language'           => $item['id']
										,'language_abbreviation' => $item['abbreviation']
										,'key'                   => $translation
										,'value'                 => $translation
			 						);

			 						Application_Model_Global::insert(TABLE_PREFIX.'translations_multilingual', $data_translations_multilingual);
			 					}
			 				}
			 			endif;
			    	}	 
			    }
				
			}

			$res["state"] = "success" ;
		  	$res["msg"] = "Scan effectué avec succès" ;
		}	
		else{
			$res["state"] = "error" ;
		  	$res["msg"] = "Une erreur est survenue. Veuillez réessayer ultérieurement." ;
		}

	   	echo Zend_Json::encode($res) ;
	}

	public function changelangAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();	

	   	$sess = new Zend_Session_Namespace();
	   	$sess->locale  = (!empty($sess->locale) AND $sess->locale=="fr") ? "en" : "fr"; 

	   	$id_language = Application_Model_Language::getId($sess->locale);
	   	$sess->translate_lang_id = $id_language;	 

	   	echo 1;
	}

	public function refreshkeysAction(){
		$keys = Application_Model_Translation::refreshTranslationsKeys();
	}

	public function refreshpagestranslationsAction(){
		$keys = Application_Model_Translation::refreshPagesTranslations();
	}

	public function addlanguageAction(){
		Application_Model_Translation::addlanguage(3, 'it');
	}

	public function addpageslanguageAction(){
		Application_Model_Translation::addpageslanguage(3, 'it');
	}
}