<?php

class Trano_ModulesController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('getmodules', 'html');
		$ajaxContext->initContext();		
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append($this->view->translate("Modules"));	
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/modules/index.js', 'text/javascript');

		$module = array();
		$this->view->do = $this->view->translate("Ajouter un module");
		if($_POST){
			$id = (int)$_POST['Modules']['id'];
			if($id){ 
				// Update
				$title = $this->view->escape($_POST['Modules']['title']);
		 	 	if(trim($title)!=""){ 
		 	 		/*get pages having old slug*/
		 	 		$get = Application_Model_Global::pselectRow(TABLE_PREFIX."modules","slug","id=:id",array(":id" => $id)) ;

		 	 		$pages = array() ;
		 	 		
		 	 		if(!empty($get)){
		 	 			$pages = Application_Model_Global::pselect(TABLE_PREFIX."pages","id","slug=:slug",array(":slug" => $get["slug"])) ;
		 	 		}

		 	 		$where = " id=:id ";
		 	 		$data = array(
						'title'        => $title
						,'slug'        => Application_Class_String::cleanString($title)
						,'update_time' => date('Y-m-d H:i:s')
		 	 		);
		 	 		Application_Model_Global::pupdate(TABLE_PREFIX.'modules', $data, $where,array(":id" => $id));

		 	 		/*update pages with slug*/
		 	 		if(!empty($pages))
		 	 		{
		 	 			foreach ($pages as $page) {
		 	 				Application_Model_Global::pupdate(TABLE_PREFIX.'pages', array("slug" => Application_Class_String::cleanString($title)), "id=:id",array(":id" => $page["id"]));
		 	 			}
		 	 		}

		 	 		$this->_redirect('/modules'); 	 
		 	 	}
			}else{ 
				// Insert
		 	 	$title = $this->view->escape($_POST['Modules']['title']);
		 	 	if(trim($title)!=""){ 
		 	 		$data = array(
						'title'        => $title
						,'slug'        => Application_Class_String::cleanString($title)
						,'create_time' => date('Y-m-d H:i:s')
						,'update_time' => date('Y-m-d H:i:s')
		 	 		);
		 	 		Application_Model_Global::insert(TABLE_PREFIX.'modules', $data); 	 
		 	 	}
	 	 	}
	 	 		
		} // endif	 

		$id = (int)$this->_getParam('id');
		if($id){ 
			// Pop data for update
			$where = " id=:id ";
			$module = Application_Model_Global::pselect(TABLE_PREFIX.'modules', '', $where,array(":id" => $id));
			$module = $module[0];

			$this->view->do = $this->view->translate("Modifier un module");
		}

		$this->view->module = $module;
	}

	public function getmodulesAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

		$aColumns = 
			array(
				'module.id'
				,'module.title'
				,'module.update_time'
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

		// /* Get default id_language value */
		// $sWhere .= " AND (cm.id_language= :id_language)" ; 
		// $sWhereParams[":id_language"] = DEFAULT_LANG_ID ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS module.id
				,module.title
				,module.slug
				,IF(module.update_time='0000-00-00 00:00:00' OR module.update_time IS NULL, '', DATE_FORMAT(module.update_time,'%d %b %Y %Hh %imn')) AS update_time
			FROM ".TABLE_PREFIX."modules module
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

		 	 	$row[] = $item['id'];
		 	 	$row[] = $item['title'];
		 	 	$row[] = $item['slug'];
		 	 	$row[] = $item['update_time'];

		 	 	$id = $item['id'];
		 	 	
		 	 	$url_edit = $this->view->baseUrl().'/modules/index/id/'.$item['id'];

		 	 	$row[] = ($item["id"] != 1) ? Application_Class_Forms::actions($url_edit,"modules",$item["id"])  : "";

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );	 	 
	}
}