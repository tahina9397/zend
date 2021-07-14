<?php

class Trano_GroupsController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('getgroups', 'html');
		$ajaxContext->addActionContext('delete', 'html');
		$ajaxContext->addActionContext('massdelete', 'html');
		$ajaxContext->initContext();
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append($this->view->translate("Groupes"));		 
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/groups/index.js', 'text/javascript');	 
	}

	public function modifyAction()
	{ 
		$this->view->headTitle()->append($this->view->translate("Modifier un groupe"));

		global $params;
		global $siteconfig;
		$languages = Application_Model_Language::getLanguages();

		$this->view->do = $do = $this->view->escape($this->_getParam('do'));
		$group = array();
	 	switch ($do) {
	 		case 'edit':
		 			$id = (int)$this->_getParam('id');
		 			$where = " id=$id ";
		 			$group = Application_Model_Group::getGroupById($id);
		 			
	 				if($_POST){ 
		 				/*
		 				 * 3 steps :
		 				 * 1. update Application_categories_groups
		 				 * 2. update Application_categories_groups_multilingual
		 				 * 3. update Application_modules_categories_groups 	
		 				 */

		 				$id = (int)$_POST['Groups']['id'];

		 				// 1. update Application_categories_groups
		 				// update order item
		 				if($_POST['Groups']['order_item']):
		 					$order_item = (int)$_POST['Groups']['order_item'];
		 					Application_Model_Global::updateOrderItem(TABLE_PREFIX."categories_groups", $order_item);
		 				else:
		 					$order_item = (int)$_POST['Groups']['old_order_item'];
		 				endif;

		 				$data_categories_groups = array(
		 					'order_item'	=> $order_item
		 					,'update_time'	=> date('Y-m-d H:i:s')
		 				);
		 				Application_Model_Global::pupdate(TABLE_PREFIX.'categories_groups', $data_categories_groups, " id=:id ",array(":id" => $id));

		 				// 2. update Application_categories_groups_multilingual
		 				if(!empty($languages)){ 
		 					foreach ($languages as $k => $item) {
		 						$title = Application_Class_Utils::idml($_POST['Groups'], 'title_'.$item['abbreviation'], $_POST['Groups']['title_'.DEFAULT_LANG_ABBR]);
		 						$id_language = $item['id'];

		 						$is_exist_id_language = Application_Model_Global::pselectRow(TABLE_PREFIX.'categories_groups_multilingual', 'id', " id_category_group=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
		 						if(!$is_exist_id_language['id']){
			 						$data_categories_groups_multilingual = array(
										'id_category_group' => $id
										,'id_language'      => $id_language
										,'title'            => $title
										,'permalink'        => Application_Class_String::cleanString($title)
			 						);

		 							Application_Model_Global::insert(TABLE_PREFIX.'categories_groups_multilingual', $data_categories_groups_multilingual);
		 						}else{
			 						$data_categories_groups_multilingual = array(
										'title' => $title
										,'permalink'        => Application_Class_String::cleanString($title)
			 						);
			 						Application_Model_Global::pupdate(TABLE_PREFIX.'categories_groups_multilingual', $data_categories_groups_multilingual, " id_category_group=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
		 						}
		 					}
		 				}

		 				// 3. update Application_modules_categories_groups
		 				$data_modules_categories_groups = array(
		 					'id_module'			 => (int)$_POST['Groups']['id_module']
		 				);
		 				Application_Model_Global::pupdate(TABLE_PREFIX.'modules_categories_groups', $data_modules_categories_groups, " id_category_group=:id ",array(":id" => $id));

		 				$this->_redirect('/groups/modify/do/edit/id/'.$id);
	 				}		 			
	 				
	 			break;

	 		case 'add':

	 				if($_POST){ 
		 				/*
		 				 * 3 steps :
		 				 * 1. insert in Application_categories_groups
		 				 * 2. insert in Application_categories_groups_multilingual
		 				 * 3. insert in Application_modules_categories_groups 	
		 				 */

		 				// 1. insert in Application_categories_groups
		 				// update order item
		 				if($_POST['Groups']['order_item']):
		 					$order_item = (int)$_POST['Groups']['order_item'];
		 					Application_Model_Global::updateOrderItem(TABLE_PREFIX."categories_groups", $order_item);
		 				else:
		 					$order_item = Application_Model_Global::getMaxOrderItem(TABLE_PREFIX."categories_groups") + 1;
		 				endif;

		 				$data_categories_groups = array(
		 					'order_item'	=> $order_item
		 					,'create_time'	=> date('Y-m-d H:i:s')
		 					,'update_time'	=> date('Y-m-d H:i:s')
		 				);
		 				Application_Model_Global::insert(TABLE_PREFIX.'categories_groups', $data_categories_groups);
		 				$lastId = Application_Model_Global::lastId();

		 				// 2. insert in Application_categories_groups_multilingual
		 				if(!empty($languages)){ 
		 					foreach ($languages as $k => $item) {
		 						$title = Application_Class_Utils::idml($_POST['Groups'], 'title_'.$item['abbreviation'], $_POST['Groups']['title_'.DEFAULT_LANG_ABBR]);

		 						$data_categories_groups_multilingual = array(
									'id_category_group' => $lastId
									,'id_language'      => $item['id']
									,'title'            => $title
									,'permalink'        => Application_Class_String::cleanString($title)
		 						);
		 						Application_Model_Global::insert(TABLE_PREFIX.'categories_groups_multilingual', $data_categories_groups_multilingual);
		 					}
		 				}

		 				// 3. insert in Application_modules_categories_groups
		 				$data_modules_categories_groups = array(
		 					'id_module'			 => (int)$_POST['Groups']['id_module']
		 					,'id_category_group' => $lastId
		 				);
		 				Application_Model_Global::insert(TABLE_PREFIX.'modules_categories_groups', $data_modules_categories_groups);

		 				$this->_redirect('/groups/modify/do/edit/id/'.$lastId);
	 				}

	 			break;
	 		
	 		default:
	 			break;
	 	}

	 	$this->view->group = $group;
	}

	public function getgroupsAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

		$aColumns = 
			array(
				'cg.id'
				,'cgm.title'
				,'cg.update_time'
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
		$sWhere .= (trim($sWhere)!="") ? " AND (cgm.id_language= :id_language)" : " WHERE (cgm.id_language= :id_language)" ;

		// /* Get default id_language value */
		$sWhereParams[":id_language"] = DEFAULT_LANG_ID ;

		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS cg.id
				,cgm.title
				,IF(cg.update_time='0000-00-00 00:00:00' OR cg.update_time IS NULL, '', DATE_FORMAT(cg.update_time,'%d %b %Y %Hh %imn')) AS update_time
			FROM ".TABLE_PREFIX."categories_groups cg
			LEFT JOIN ".TABLE_PREFIX."categories_groups_multilingual cgm ON cg.id=cgm.id_category_group
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
		 	 	$row[] = $item['update_time'];

		 	 	$id = $item['id'];
		 	 	
		 	 	$url_edit = $this->view->baseUrl().'/groups/modify/id/'.$item['id'].'/do/edit';

		 	 	$row[] = Application_Class_Forms::actions($url_edit,"categories_groups",$item["id"]) ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}
}