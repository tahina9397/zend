<?php

class Trano_PagesController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('getpages', 'html');
		$ajaxContext->initContext();

		$this->version = $version = Zend_Registry::get('version');
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Pages');
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/pages/index.js?v='.$this->version, 'text/javascript');
	}

	public function modifyAction()
	{ 
		$this->view->headTitle()->append('Edit Page');	

		global $params;
		global $siteconfig;
		$languages = Application_Model_Language::getLanguages();

		$this->view->do = $do = $this->view->escape($this->_getParam('do'));
		$page = array();

		$slug = $this->_getParam("slug") ;

	 	switch ($do) {
	 		case 'edit':
		 			$id = (int)$this->_getParam('id');
		 			$where = " id=$id ";
		 			$page = Application_Model_Page::getPageById($id);
		 			
	 				if($_POST){ 
		 				/*
		 				 * 3 steps :
		 				 * 1. update Application_pages
		 				 * 2. update Application_pages_categories
		 				 * 3. update Application_pages_multilingual
		 				 */

		 				$id = (int)$_POST[$slug]['id'];

						// 1. update Application_pages
						$data_pages = array(
							'slug' => $slug
							,'icon' => $_POST[$slug]['icon']
							,'update_time' => date('Y-m-d H:i:s')
						);
						Application_Model_Global::pupdate(TABLE_PREFIX.'pages', $data_pages, " id=:id ",array(":id"=>$id));

						// 2. update Application_pages_categories
						Application_Model_Global::pdelete(TABLE_PREFIX.'pages_categories', " id_page=:id ",array(":id" => $id));

						// if(!empty($_POST[$slug]['categories'])) { 
						// 	foreach ($_POST[$slug]['categories'] as $key => $value) {
							 	$data_pages_categories = array(
									'id_page'      => $id
									,'id_category' => $_POST[$slug]['categories']
							 	);
							 	Application_Model_Global::insert(TABLE_PREFIX.'pages_categories', $data_pages_categories);
						// 	} 
						// } 		

		 				// 3. update Application_pages_multilingual
		 				if(!empty($languages)){ 
		 					foreach ($languages as $k => $item) {
								$title                = $_POST[$slug]['title_'.$item['abbreviation']];
								$text                 = $_POST[$slug]['text_'.$item['abbreviation']];
								$icon                 = $_POST[$slug]['icon_'.$item['abbreviation']];
								$seo_title            = $_POST[$slug]['seo_title_'.$item['abbreviation']];
								$seo_meta_description = $_POST[$slug]['seo_meta_description_'.$item['abbreviation']];
								$seo_meta_keyword     = $_POST[$slug]['seo_meta_keyword_'.$item['abbreviation']];

								$id_language = $item['id'];

		 						$is_exist_id_language = Application_Model_Global::pselectRow(TABLE_PREFIX.'pages_multilingual', 'id', " id_page=:id AND id_language=:id_language ",array(":id"=>$id,":id_language"=>$id_language));
		 						if(!$is_exist_id_language['id']){
			 						$data_pages_multilingual = array(
										'id_page'               => $id
										,'id_language'          => $id_language
										,'title'                => $title
										,'text'                 => $text
										,'icon'                 => $icon
										,'seo_title'            => $seo_title
										,'seo_meta_description' => $seo_meta_description
										,'seo_meta_keyword'     => $seo_meta_keyword
										,'seo_permalink'     => Application_Class_String::cleanString($title)
			 						);

		 							Application_Model_Global::insert(TABLE_PREFIX.'pages_multilingual', $data_pages_multilingual);
		 						}else{
			 						$data_pages_multilingual = array(
										'title'                 => $title
										,'text'                 => $text
										,'icon'                 => $icon
										,'seo_title'            => $seo_title
										,'seo_meta_description' => $seo_meta_description
										,'seo_meta_keyword'     => $seo_meta_keyword
										,'seo_permalink'     => Application_Class_String::cleanString($title)
			 						);

		 							Application_Model_Global::pupdate(TABLE_PREFIX.'pages_multilingual', $data_pages_multilingual, " id_page=:id AND id_language=:id_language ",array(":id"=>$id,":id_language"=>$id_language));
		 						}
		 					}
		 				}

		 				$this->_redirect('/pages/modify/?slug='.$slug.'&do=edit&id='.$id);
	 				}		 			
	 				
	 			break;

	 		case 'add':

	 				if($_POST){ 

		 				/*
		 				 * 3 steps :
		 				 * 1. insert in Application_pages
		 				 * 2. insert in Application_pages_categories
		 				 * 3. insert in Application_pages_multilingual
		 				 */

						// 1. insert in Application_pages
						$data_pages = array(
							'slug' => $slug
							,'icon' => $_POST[$slug]['icon']
							,'create_time' => date('Y-m-d H:i:s')
							,'update_time' => date('Y-m-d H:i:s')
						);
						Application_Model_Global::insert(TABLE_PREFIX.'pages', $data_pages);
						$lastId = Application_Model_Global::lastId();

						// 2. insert in Application_pages_categories
						// if(!empty($_POST[$slug]['categories'])) { 
						// 	foreach ($_POST[$slug]['categories'] as $key => $value) {
							 	$data_pages_categories = array(
									'id_page'      => $lastId
									,'id_category' => $_POST[$slug]['categories']
							 	);
							 	Application_Model_Global::insert(TABLE_PREFIX.'pages_categories', $data_pages_categories);
						// 	} 
						// } 	
									

		 				// 3. insert in Application_pages_multilingual
		 				if(!empty($languages)){ 
		 					foreach ($languages as $k => $item) {
								$title                = Application_Class_Utils::idml($_POST[$slug], 'title_'.$item['abbreviation'], $_POST[$slug]['title_'.DEFAULT_LANG_ABBR]);
								$text                 = $_POST[$slug]['text_'.$item['abbreviation']];
								$icon                 = $_POST[$slug]['icon_'.$item['abbreviation']];
								$seo_title            = $_POST[$slug]['seo_title_'.$item['abbreviation']];
								$seo_meta_description = $_POST[$slug]['seo_meta_description_'.$item['abbreviation']];
								$seo_meta_keyword     = $_POST[$slug]['seo_meta_keyword_'.$item['abbreviation']];

		 						$data_pages_multilingual = array(
									'id_page'               => $lastId
									,'id_language'          => $item['id']
									,'title'                => $title
									,'text'                 => $text
									,'icon'                 => $icon
									,'seo_title'            => $seo_title
									,'seo_meta_description' => $seo_meta_description
									,'seo_meta_keyword'     => $seo_meta_keyword
									,'seo_permalink'     => Application_Class_String::cleanString($title)
		 						);
		 						Application_Model_Global::insert(TABLE_PREFIX.'pages_multilingual', $data_pages_multilingual);
		 					}
		 				}

		 				$this->_redirect('/pages/modify/?slug='.$slug.'&do=edit&id='.$lastId);
	 				}

	 			break;
	 		
	 		default:
	 			break;
	 	}

		$this->view->page = $page;	 
	}

	public function getpagesAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$slug = $this->_getParam("slug") ;

		$aColumns = 
			array(
				'page.id'
				,'pm.title'
				,'pm.text'
				,'page.hidden'
				,'page.update_time'
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
		$sWhere .= (trim($sWhere)!="") ? " AND (pm.id_language= :id_language) AND page.slug=:slug" : " WHERE (pm.id_language= :id_language) AND page.slug=:slug" ;

		// /* Get default id_language value */
		$sWhereParams[":id_language"] = DEFAULT_LANG_ID ;
		$sWhereParams[":slug"] = $slug ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS page.id
				,page.hidden
				,page.is_similar_news
				,IF(page.update_time='0000-00-00 00:00:00' OR page.update_time IS NULL, '', DATE_FORMAT(page.update_time,'%d %b %Y %Hh %imn')) AS update_time
				,pm.title
				,pm.text
				,cm.title as category_title
				,pc.id_category
			FROM ".TABLE_PREFIX."pages page
			LEFT JOIN ".TABLE_PREFIX."pages_multilingual pm ON page.id=pm.id_page
			LEFT JOIN ".TABLE_PREFIX."pages_categories pc ON page.id=pc.id_page
			LEFT JOIN ".TABLE_PREFIX."categories_multilingual cm ON cm.id_category=pc.id_category AND cm.id_language=".DEFAULT_LANG_ID."
			$sWhere
			$sOrder
			$sLimit
		";

		$rResult        = Application_Model_Global::pquery($sQuery,$sWhereParams);
		$total          = Application_Model_Global::pquery("SELECT FOUND_ROWS()");
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

		 	 	$id = $item['id'];

		 	 	/*hidden*/
		 	 	$hidden = ($item['hidden'] == 1 ) ? 'selected' : '' ;
                $show = ($item['hidden'] == 0 ) ? 'selected' : '' ;

		 	 	$statut = "" ;
                $statut .= "<select class='styled' name='' id='statut' data-resource_id=".$item['id']." data-resource_type='pages' style='width:100px'>" ;
                $statut .= "<option value='1' ".$hidden.">Désactiver</option>" ;
                $statut .= "<option value='0' ".$show.">Activer</option>" ;
                $statut .= "</select>" ;  
		 	 	
		 	 	$row[] =  '<input type="checkbox" class="styled" value="' . $id. '" name="checked[]" />';

		 	 	$row[] = $item['title'];
		 	 	$row[] = Application_Class_String::text_cut(strip_tags($item['text']), 55);		 

	 	 		$r = "<a href='#'>".$item['category_title']."</a>" ;

	 	 		if($item["id_category"] == 3){
		 	 		$checked = ($item["is_similar_news"]) ? "checked='checked'" : "" ;

			 	 	$r .= "&nbsp;|&nbsp;" ;
			 	 	$r .= '
			 	 		<div class="checkbox inline">
			 	 			<label class="toggle-label cpointer" for="new_'.$item["id"].'">Actualités similaires</label>
			 	 			<input type="checkbox" name="selection" data-resource_type="similar_news" data-resource_id="'.$item["id"].'" id="new_'.$item["id"].'" '.$checked.'>
		 	 			</div>
			 	 	' ;
	 	 		}

	 	 		$row[] = $r ;

	 	 		$row[] = $item['update_time'];
	 	 		$row[]= $statut ;

		 	 	$url_edit = $this->view->baseUrl().'/pages/modify/?slug='.$slug.'&do=edit&id='.$item["id"] ;

      //           $row[] = Application_Class_Forms::actions($url_edit,"pages",$item["id"]) ;

	 	 		$actions = '<ul class="table-controls acenter">';
				$actions .= '<li><a title="" class="tip btn" href="'.$url_edit.'" data-original-title="Modifier"><i class="icon-pencil"></i></a> </li>';
				$actions .= '<li><a title="" class="tip btn delete" data-resource_id="'.$item["id"].'" data-resource_type="pages" style="cursor: pointer" data-original-title="Supprimer"><i class="icon-trash"></i></a> </li>';

	 	 		if($item["id_category"] == 3){
	 	 			$url_comments = $this->view->baseUrl().'/pages/comments/?id='.$item["id"] ;
					$actions .= '<li><a title="" class="tip btn" href="'.$url_comments.'" data-original-title="Afficher commentaires"><i class="icon-comment"></i></a> </li>';
				}

				$actions .= '</ul>'; 

				$row[] = $actions ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}

	/*comments*/
	public function commentsAction()
	{ 
		$this->view->headTitle()->append('Commentaires');
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/pages/comments.js?v='.$this->version, 'text/javascript');
	}

	public function getcommentsAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$id_new = $this->_getParam("resource_id") ;

		$aColumns = 
			array(
				'c.id'
				,'c.name'
				,'c.email'
				,'c.comment'
				,'c.hidden'
				,'c.create_time'
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

		$sOrder .= (trim($sOrder)!="") ? $sOrder : " ORDER BY c.create_time DESC" ;

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
		$sWhere .= (trim($sWhere)!="") ? " AND c.id_new=:id_new" : " WHERE c.id_new=:id_new" ;

		// /* Get default id_language value */
		$sWhereParams[":id_new"] = $id_new ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS c.id
				,c.hidden
				,c.name
				,c.email
				,c.comment
				,IF(c.create_time='0000-00-00 00:00:00' OR c.create_time IS NULL, '', DATE_FORMAT(c.create_time,'%d %b %Y %Hh %imn')) AS create_time
			FROM ".TABLE_PREFIX."news_comments c
			$sWhere
			$sOrder
			$sLimit
		";

		$rResult        = Application_Model_Global::pquery($sQuery,$sWhereParams);
		$total          = Application_Model_Global::pquery("SELECT FOUND_ROWS()");
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

		 	 	$id = $item['id'];
		 	 	
		 	 	$row[] =  '<input type="checkbox" class="styled" value="' . $id. '" name="checked[]" />';
	 	 		$row[] = "<a href='#'>".$item['name']."</a>" ;
	 	 		$row[] = "<a href='#'>".$item['email']."</a>" ;
		 	 	$row[] = $item['comment'];
	 	 		$row[] = $item['create_time'];

		 	 	/*hidden*/
		 	 	$hidden = ($item['hidden'] == 1 ) ? 'selected' : '' ;
                $show = ($item['hidden'] == 0 ) ? 'selected' : '' ;

		 	 	$statut = "" ;
                $statut .= "<select class='styled' name='' id='statut' data-resource_id=".$item['id']." data-resource_type='news_comments' style='width:100px'>" ;
                $statut .= "<option value='1' ".$hidden.">Oui</option>" ;
                $statut .= "<option value='0' ".$show.">Non</option>" ;
                $statut .= "</select>" ;  

	 	 		$row[]= $statut ;

	 	 		$actions = '<ul class="table-controls acenter">';
				$actions .= '<li><a title="" class="tip btn delete" data-resource_id="'.$item["id"].'" data-resource_type="news_comments" style="cursor: pointer" data-original-title="Supprimer"><i class="icon-trash"></i></a> </li>';
				$actions .= '</ul>'; 

				$row[] = $actions ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}
}