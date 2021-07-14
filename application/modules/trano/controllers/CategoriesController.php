<?php

class Trano_CategoriesController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('getcategories', 'html');
		$ajaxContext->addActionContext('delete', 'html');
		$ajaxContext->addActionContext('massdelete', 'html');
		$ajaxContext->addActionContext('getajaxorderitem', 'html');
		$ajaxContext->initContext();

		$this->version = $version = Zend_Registry::get('version');
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Categories');		 
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/categories/index.js?v='.$this->version, 'text/javascript');	 
	}

	public function modifyAction()
	{ 
		$this->view->headTitle()->append('Edit Category');
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/categories/modify.js?v='.$this->version, 'text/javascript');	 

		global $params;
		global $siteconfig;
		$languages = Application_Model_Language::getLanguages();

		$this->view->do = $do = $this->view->escape($this->_getParam('do'));
		$category = array();
	 	switch ($do) {
	 		case 'edit':
		 			$id = (int)$this->_getParam('id');
		 			$where = " id=$id ";
		 			$category = Application_Model_Category::getCategoryById($id);

	 				if($_POST){ 
		 				/*
		 				 * 2 steps :
		 				 * 1. update Application_categories
		 				 * 2. update Application_categories_multilingual
		 				 */

		 				$id = (int)$_POST['Categories']['id'];

		 				// 1. update Application_categories
		 				// update order item
		 				if($_POST['Categories']['order_item']):
		 					$order_item = (int)$_POST['Categories']['order_item'];
		 					$id_category_group = (int)$_POST['Categories']['id_category_group'];
		 					Application_Model_Global::updateOrderItemCategory(TABLE_PREFIX."categories", $order_item, $id_category_group);
		 				else:
		 					$order_item = (int)$_POST['Categories']['old_order_item'];
		 				endif;

		 				$data_categories = array(
							'id_category_group' => (int)$_POST['Categories']['id_category_group']
							,'uniqid'           => $_POST['Categories']['uniqid']
							,'icon'           	=> $_POST['Categories']['icon'] ? $_POST['Categories']['icon'] : NULL
							,'order_item'       => $order_item
							,'update_time'      => date('Y-m-d H:i:s')
		 				);
		 				Application_Model_Global::pupdate(TABLE_PREFIX.'categories', $data_categories, " id=:id ",array(":id" => $id));

		 				// 2. update Application_categories_multilingual
		 				if(!empty($languages)){ 
		 					foreach ($languages as $k => $item) {
		 						$title                = $_POST['Categories']['title_'.$item['abbreviation']];
		 						$text                 = $_POST['Categories']['text_'.$item['abbreviation']];
		 						$seo_title            = $_POST['Categories']['seo_title_'.$item['abbreviation']];
		 						$seo_meta_description = $_POST['Categories']['seo_meta_description_'.$item['abbreviation']];
		 						$seo_meta_keyword     = $_POST['Categories']['seo_meta_keyword_'.$item['abbreviation']];
		 						$short_description    = $_POST['Categories']['short_description_'.$item['abbreviation']];

		 						$seo_permalink = Application_Class_String::cleanString($title) ;

		 						$id_language = $item['id'];

		 						$is_exist_id_language = Application_Model_Global::pselectRow(TABLE_PREFIX.'categories_multilingual', 'id', " id_category=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
		 						if(!$is_exist_id_language['id']){
			 						$data_categories_multilingual = array(
										'id_category'           => $id
										,'id_language'          => $id_language
										,'title'                => $title
										,'short_description'    => $short_description
										,'text'                 => $text
										,'seo_title'            => $seo_title
										,'seo_meta_description' => $seo_meta_description
										,'seo_meta_keyword'     => $seo_meta_keyword
										,'seo_permalink'     => $seo_permalink
			 						);

		 							Application_Model_Global::insert(TABLE_PREFIX.'categories_multilingual', $data_categories_multilingual);
		 						}else{
			 						$data_categories_multilingual = array(
										'title' 				=> $title
										,'short_description' 	=> $short_description
										,'text'                 => $text
										,'seo_title'            => $seo_title
										,'seo_meta_description' => $seo_meta_description
										,'seo_meta_keyword'     => $seo_meta_keyword
										,'seo_permalink'     => $seo_permalink
			 						);
			 						Application_Model_Global::pupdate(TABLE_PREFIX.'categories_multilingual', $data_categories_multilingual, " id_category=:id AND id_language=:id_language ",array(":id"=>$id,":id_language"=>$id_language));
		 						}
		 					}
		 				}

		 				$this->_redirect('/categories');
	 				}		 			
	 				
	 			break;

	 		case 'add':

	 				if($_POST){ 
		 				/*
		 				 * 2 steps :
		 				 * 1. insert in Application_categories
		 				 * 2. insert in Application_categories_multilingual
		 				 */

		 				// 1. insert in Application_categories
		 				// update order item
		 				$id_category_group = (int)$_POST['Categories']['id_category_group'];
		 				if($_POST['Categories']['order_item']):
		 					$order_item = (int)$_POST['Categories']['order_item'];
		 					Application_Model_Global::updateOrderItem(TABLE_PREFIX."categories", $order_item, $id_category_group);
		 				else:
		 					$order_item = Application_Model_Global::getMaxOrderItemCategory(TABLE_PREFIX."categories", $id_category_group) + 1;
		 				endif;

		 				$data_categories = array(
							'id_category_group' => (int)$_POST['Categories']['id_category_group']
							,'uniqid'           => $_POST['Categories']['uniqid']
							,'icon'           	=> $_POST['Categories']['icon'] ? $_POST['Categories']['icon'] : NULL
							,'order_item'       => $order_item
							,'create_time'      => date('Y-m-d H:i:s')
							,'update_time'      => date('Y-m-d H:i:s')
		 				);
		 				Application_Model_Global::insert(TABLE_PREFIX.'categories', $data_categories);
		 				$lastId = Application_Model_Global::lastId();

		 				/*produits phares*/
    					$getIdCategoryGroupByModule = Application_Model_Module::getIdCategoryGroupByModule(2) ;
		 				if(in_array($id_category_group, $getIdCategoryGroupByModule)){
		 					Application_Model_Global::insert(TABLE_PREFIX."produits_phares",array("id_category" => $lastId)) ;
		 				}

		 				// 2. insert in Application_categories_multilingual
		 				if(!empty($languages)){ 
		 					foreach ($languages as $k => $item) {
								$title                = $_POST['Categories']['title_'.$item['abbreviation']];
								$text                 = $_POST['Categories']['text_'.$item['abbreviation']];
								$seo_title            = $_POST['Categories']['seo_title_'.$item['abbreviation']];
								$seo_meta_description = $_POST['Categories']['seo_meta_description_'.$item['abbreviation']];
								$seo_meta_keyword     = $_POST['Categories']['seo_meta_keyword_'.$item['abbreviation']];
								$short_description    	  = $_POST['Categories']['short_description_'.$item['abbreviation']];

								$seo_permalink = Application_Class_String::cleanString($title) ;
								
		 						$data_categories_multilingual = array(
									'id_category'           => $lastId
									,'id_language'          => $item['id']
									,'title'                => $title
									,'short_description'    => $short_description
									,'text'                 => $text
									,'seo_title'            => $seo_title
									,'seo_meta_description' => $seo_meta_description
									,'seo_meta_keyword'     => $seo_meta_keyword
									,'seo_permalink'     => $seo_permalink
		 						);
		 						Application_Model_Global::insert(TABLE_PREFIX.'categories_multilingual', $data_categories_multilingual);
		 					}
		 				}

		 				$this->_redirect('/categories');
	 				}

	 			break;
	 		
	 		default:
	 			break;
	 	}

	 	$this->view->category = $category;
	}

	public function getajaxorderitemAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();	 	

	   	$id_category_group = (int)$this->_getParam('id_category_group');
	   	$categories = Application_Model_Category::getCategoryByIdCategoryGroup($id_category_group);

	   	$options = array(
	   	    'atfirst' => array(
	   	        'value'  => 1
	   	        ,'title' => "At first"
	   	    )
	   	    ,'atend' => array(
	   	        'title' => "At end"   
	   	    )
			,'optgrouplabel'     => "After"
			,'options'           => $categories
			,'tablename'         => TABLE_PREFIX.'categories'
			,'id_category_group' => $id_category_group
	   	);
	   	$options = Application_Class_Forms::optionsOrderItemCategory($options, false); 
	   	echo $options;
	}
	
	public function getcategoriesAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

		$aColumns = 
			array(
				'c.id'
				,'cm.title'
				,'c.update_time'
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

		$sOrder .= (trim($sOrder)!="") ? $sOrder : " ORDER BY cm.title ASC" ;

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
		$sWhere .= (trim($sWhere)!="") ? " AND (cm.id_language= :id_language)" : " WHERE (cm.id_language= :id_language)" ;

		// /* Get default id_language value */
		$sWhereParams[":id_language"] = DEFAULT_LANG_ID ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS c.id
				,c.id_category_group
				,c.archive
				,cm.title
				,IF(c.update_time='0000-00-00 00:00:00' OR c.update_time IS NULL, '', DATE_FORMAT(c.update_time,'%d %b %Y %Hh %imn')) AS update_time
			FROM ".TABLE_PREFIX."categories c
			LEFT JOIN ".TABLE_PREFIX."categories_multilingual cm ON c.id=cm.id_category
			$sWhere
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
		 	 	
		 	 	$row[] = '<input type="checkbox" class="styled" value="'.$item['id'].'" name="checked[]" />';

		 	 	$row[] = $item['title'];

		 	 	$category = Application_Model_Global::getContenuRow(TABLE_PREFIX."categories_groups", TABLE_PREFIX."categories_groups_multilingual", DEFAULT_LANG_ID, 'id_category_group', "T.id=".$item['id_category_group']);

		 	 	$ifHasSelection = $this->ifHasSelection($item["id_category_group"]) ;

		 	 	$r = '<a>'.$category['title'].'</a>';

		 	 	// if($ifHasSelection){
		 	 	/*only in the modules PRODUCTS*/
		 	 	if(in_array($item["id_category_group"], [2,9])){
		 	 		$checked = ($item["archive"]) ? "checked='checked'" : "" ;

			 	 	$r .= "<br>" ;
			 	 	// $r .= "&nbsp;|&nbsp;" ;
			 	 	$r .= '
			 	 		<div class="checkbox inline">
			 	 			<label class="toggle-label cpointer" for="slider_'.$item["id"].'">Afficher sur le slider</label>
			 	 			<input type="checkbox" name="selection" data-resource_type="categories" data-resource_id="'.$item["id"].'" id="slider_'.$item["id"].'" '.$checked.'>
		 	 			</div>
			 	 	' ;

			 	 	$r .= "&nbsp;|&nbsp;" ;

			 	 	/*produits phares*/
			 	 	$xts = $this->getProduitsPhares() ;
		 	 		$checked_xts = (in_array($item["id"], $xts)) ? "checked='checked'" : "" ;

			 	 	$r .= '
			 	 		<div class="checkbox inline">
			 	 			<label class="toggle-label cpointer" for="xts_'.$item["id"].'">Afficher sur le produits phares</label>
			 	 			<input type="checkbox" name="selection" data-resource_type="produits_phares" data-resource_id="'.$item["id"].'" id="xts_'.$item["id"].'" '.$checked_xts.'>
		 	 			</div>
			 	 	' ;

			 	 	$r .= "<br>" ;
 	 		 	 	// $r .= "&nbsp;|&nbsp;" ;

 	 		 	 	/*logos*/
 	 		 	 	$r .= $this->logosWrapper($item["id"]) ;
		 	 	}

		 	 	$row[] = $r ;


		 	 	$row[] = $item['update_time'];

		 	 	$id = $item['id'];
		 	 	
		 	 	$url_edit = $this->view->baseUrl().'/categories/modify/id/'.$item['id'].'/do/edit';

		 	 	$extras = NULL ;

		 	 	if(in_array($item["id_category_group"], [2,9])){
			 	 	$url_extras = $this->view->baseUrl().'/lots/?id_product='.$item['id'] ;
	    			$extras = '<li><a title="" class="tip btn" href="'.$url_extras.'" data-original-title="Lots"><i class="icon-tags"></i></a> </li>';
		 	 	}

		 	 	$row[] = Application_Class_Forms::actions($url_edit,"categories",$item["id"],$extras) ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}

	function ifHasSelection($id_category_group)
	{
		$sql = "
			SELECT 
				m.has_selection
			FROM ".TABLE_PREFIX."modules m
			INNER JOIN ".TABLE_PREFIX."modules_categories_groups mcg ON (mcg.id_module = m.id)
			WHERE mcg.id_category_group = :id_category_group
		" ;

		$res = Application_Model_Global::pqueryRow($sql,array(":id_category_group" => $id_category_group)) ;

		return $res["has_selection"] ;
	}

	function getProduitsPhares()
	{
		$get = Application_Model_Global::pselect(TABLE_PREFIX."produits_phares","id_category","archive = 1") ;

		return array_column($get, "id_category") ;
	}

	function getLogoByIdProduct($id_category)
	{
		$get = Application_Model_Global::pselectRow(TABLE_PREFIX."produits_phares","id_logo","id_category = :id_category",array(":id_category" => $id_category)) ;

		return $get["id_logo"] ;
	}

	function logosWrapper($id_category)
	{
		$sql = "
	        SELECT
	            m.id
	            ,mm.title
	        FROM ".TABLE_PREFIX."medias m
	        INNER JOIN ".TABLE_PREFIX."medias_multilingual mm ON (mm.id_media = m.id)
	        WHERE m.resource_type = :resource_type AND mm.id_language = ".DEFAULT_LANG_ID."
	    " ;
	   
	    $logos = Application_Model_Global::pquery($sql,array(":resource_type" => "logos")) ;


	    if(!empty($logos))
	    {
	    	$getLogoByIdProduct = $this->getLogoByIdProduct($id_category) ;

	    	$select = "<select name='update_logo' data-resource_id=".$id_category." data-resource_type='products_logo'>" ;
	    	$select .= "<option>-- Sélectionner un logo --</option>" ;
	    	foreach ($logos as $logo) {
	    		$selected_logo = ($logo["id"] == $getLogoByIdProduct) ? "selected='selected'" : "" ;
	    		$select .= "<option value='".$logo["id"]."' ".$selected_logo." >".$logo["title"]."</option>" ;
	    	}
	    	$select .= "</select>" ;
	    }

	    return $select ;
	}
}