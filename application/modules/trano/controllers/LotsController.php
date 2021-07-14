<?php

class Trano_LotsController extends Application_AbstractController
{
	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append($this->view->translate("Lots"));	

		/*dropzone*/
		$this->view->headLink()->appendStylesheet(PLUGINS_URL.'dropzone/basic.css');
		$this->view->headLink()->appendStylesheet(PLUGINS_URL.'dropzone/dropzone.css');
		$this->view->inlineScript()->appendFile(PLUGINS_URL . 'dropzone/dropzone.js?v='.$this->version, 'text/javascript');

		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/lots/index.js?v='.$this->version, 'text/javascript'); 	 
	}

	public function getlotsAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$id_product = (int)$this->_getParam("id_product") ;

		$aColumns = 
			array(
				'l.id'
				,'l.filename'
				,'l.create_time'
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
		
		$sOrder .= (trim($sOrder)!="") ? $sOrder : " ORDER BY l.create_time DESC " ;

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
		$sWhere .= (trim($sWhere)!="") ? " AND (l.id_product= :id_product) " : " WHERE (l.id_product= :id_product)" ;

		// /* Get default id_language value */
		$sWhereParams[":id_product"] = $id_product ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS l.id
				,IF(l.create_time='0000-00-00 00:00:00' OR l.create_time IS NULL, '', DATE_FORMAT(l.create_time,'%d %b %Y %Hh %imn')) AS create_time
				,l.title
			FROM ".TABLE_PREFIX."products_lots l
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
		 	 	$row[] = $item['create_time'];
		 	 	
		 	 	$url_edit = $this->view->baseUrl().'/lots/modify/?do=edit&id='.$item['id']."&id_product=".$id_product ;
		 	 	$row[] = Application_Class_Forms::actions($url_edit,"products_lots",$item["id"]) ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}

	public function modifyAction()
	{
		$this->view->headTitle()->append($this->view->translate("Modifier un lot"));	

		$this->view->id = $id = (int)$this->_getParam('id');
		$this->view->id_product = $id_product = (int)$this->_getParam('id_product');
		$this->view->lots = $lots = Application_Model_Global::pselectRow(TABLE_PREFIX."products_lots","*","id=:id",array(":id" => $id));

		if($_POST){
			/*
			 * 1 step :
			 * 1. update edm_media_multilingual
			 */
			$id = (int)$_POST['Lots']['id'];

			$title = $_POST['Lots']['title'];

			$data_lots = array(
				'title' => $title 
			);
			Application_Model_Global::pupdate(TABLE_PREFIX.'products_lots', $data_lots, " id=:id",array(":id" => $id));

			$redirect = '/lots/?id_product='.$id_product ;
			$this->_redirect($redirect);				 
		}	 
	}

	public function multipleuploadAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

        $languages = Application_Model_Language::getLanguages();
        $User = new Application_Model_User("admin");

        $folder = $_REQUEST['folder'];
        $upload_path = UPLOAD_PATH . 'files/' . $folder . '/';

        if (!empty($_FILES)) {
            setlocale(LC_CTYPE, "fr_FR.utf8");

            if ($_FILES['file']['size'] > 0 && $_FILES['file']['size'] < MAX_SIZE*DEFAULT_UNIT) {
            	$path_parts = pathinfo($upload_path . $_FILES['file']['name']);
            	$extension = $path_parts["extension"] ;

            	if (!in_array($extension, array("pdf","PDF"))) {
					$ret["state"] = "error" ;
					$ret["msg"] = "Fichier non autorisé" ;
					
	                echo Zend_Json::encode($ret) ;
	                die() ;
            	}

	            $temp_file = $_FILES['file']['tmp_name'];

	            if (!is_dir($upload_path)) {
	                if (!mkdir($upload_path)) {
            			mkdir($upload_path, 0777, true);
            		}
	            }

	            $path_parts = pathinfo($upload_path . $_FILES['file']['name']);
	            $target_filename = uniqid() . "-source." . $path_parts['extension'];
	            $target_file = str_replace('//', '/', $upload_path) . $target_filename;

	            if (move_uploaded_file($temp_file, $target_file)) {
					$d = array(
						'id_product' => (int)$this->_getParam("id_product")
						,'filename' => $target_filename
						,'title' => $path_parts['filename']
						,'create_time' => Application_Plugin_Common::now()
					);
					Application_Model_Global::insert(TABLE_PREFIX."products_lots",$d);

					$ret["state"] = "success" ;
					$ret["msg"] = "Upload avec succès" ;
					
	                echo Zend_Json::encode($ret) ;
	            } else {
	            	$ret["state"] = "error" ;
					$ret["msg"] = "Une erreur est survenue. Veuillez réessayer ultérieurement." ;

	                echo Zend_Json::encode($ret) ;
	            }
            }
            else{
            	$ret["state"] = "error" ;
            	$ret["msg"] = "Fichiers trop volumineux" ;

            	echo Zend_Json::encode($ret);
            	die() ;
            }
        }
        else{
        	$ret["state"] = "error" ;
			$ret["msg"] = "Une erreur est survenue. Veuillez réessayer ultérieurement." ;

            echo Zend_Json::encode($ret) ;
            die() ;
        }
	}
}