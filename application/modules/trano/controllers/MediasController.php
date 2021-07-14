<?php

class Trano_MediasController extends Application_AbstractController
{
	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append($this->view->translate("Médias"));	

		/*dropzone*/
		$this->view->headLink()->appendStylesheet(PLUGINS_URL.'dropzone/basic.css');
		$this->view->headLink()->appendStylesheet(PLUGINS_URL.'dropzone/dropzone.css');
		$this->view->inlineScript()->appendFile(PLUGINS_URL . 'dropzone/dropzone.js?v='.$this->version, 'text/javascript');

		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/medias/index.js', 'text/javascript'); 	 
	}

	public function addAction()
	{
		$this->view->headTitle()->append($this->view->translate("Ajouter un média"));		 
	}

	public function modifyAction()
	{
		$this->view->headTitle()->append($this->view->translate("Modifier un média"));	

		$languages = Application_Model_Language::getLanguages();

		$this->view->id = $id = (int)$this->_getParam('id');
		$this->view->media = $media = Application_Model_Media::getMultilingualById($id);

		if($_POST){
			/*
			 * 1 step :
			 * 1. update edm_media_multilingual
			 */
			$id = (int)$_POST['Medias']['id'];

			if(!empty($languages)){ 
				foreach ($languages as $k => $language) {
					$title = Application_Class_Utils::idml($_POST['Medias'], 'title_'.$language['abbreviation'], "");
					$caption = Application_Class_Utils::idml($_POST['Medias'], 'caption_'.$language['abbreviation'], "");
					$alt = Application_Class_Utils::idml($_POST['Medias'], 'alt_'.$language['abbreviation'], "");
					$description = Application_Class_Utils::idml($_POST['Medias'], 'description_'.$language['abbreviation'], "");

					$id_language = (int)$language['id'];
					$data_medias_multilingual = array(
						'title' => $title 
						,'caption' => $caption 
						,'alt' => $alt
						,'description' => $description
					);
					Application_Model_Global::pupdate(TABLE_PREFIX.'medias_multilingual', $data_medias_multilingual, " id_media=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
				}
			}

			$redirect = '/medias/modify/do/edit/id/'.$id;
			$this->_redirect($redirect);				 
		}	 
	}

	public function browseAction()
	{
		$this->_helper->layout->setLayout('browse-medias');

		$this->view->inlineScript()->appendFile(THEMES_TRANO_URL . 'scripts/medias/browse.js?v='.$this->version, 'text/javascript');

		$this->view->medias = $medias = Application_Model_Media::getAll();

		$this->view->id_item = $id_item = $this->_getParam("item_id");
		$this->view->module = $module = $this->_getParam("item_module");
		$this->view->type = $type = $this->_getParam("item_type");
		$this->view->id_media = $id_media = $this->_getParam("id_media", 0);
	}

	public function getmediasAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

		$aColumns = 
			array(
				'media.id'
				,'media.id'
				,'mm.title'
				,'media.update_time'
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
		$sWhere .= (trim($sWhere)!="") ? " AND (mm.id_language= :id_language) AND media.resource_type IS NULL" : " WHERE (mm.id_language= :id_language) AND media.resource_type IS NULL" ;

		// /* Get default id_language value */
		$sWhereParams[":id_language"] = DEFAULT_LANG_ID ;
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS media.id
				,IF(media.update_time='0000-00-00 00:00:00' OR media.update_time IS NULL, '', DATE_FORMAT(media.update_time,'%d %b %Y %Hh %imn')) AS update_time
				,media.id as media_id
				,media.filename
				,media.show_in_gallery
				,mm.title
				,mm.caption 
				,mm.alt 
				,mm.description
				,CONCAT(user.first_name, ' ', user.last_name) AS post_author
				,user.id AS user_id
			FROM ".TABLE_PREFIX."medias media
			LEFT JOIN ".TABLE_PREFIX."medias_multilingual mm ON media.id=mm.id_media
			LEFT JOIN ".TABLE_PREFIX."users user ON user.id=media.id_user
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
		 	 	
		 	 	$row[] = '<input type="checkbox" class="styled" value="'.$item['media_id'].'" name="checked[]" />';

		 	 	// image thumbnail
		 	 	$media_url = Application_Model_Media::getUrlById($item['media_id'], "thumbnail");
		 	 	if($media_url){
		 	 		$row[] = '<img src="'.$media_url.'" />';
		 	 	}else{
		 	 		$row[] = "";
		 	 	}

		 	 	$row[] = $item['title'];

		 	 	$profil_url = $this->view->baseUrl().'/users/modify/do/edit/id/'.$item['user_id'];
		 	 	$row[] = '<a href="'.$profil_url.'">'.$item['post_author'].'</a>';
		 	 	
		 	 	$row[] = $item['update_time'];

		 	 	$media_data      = Application_Model_Media::getMediaData($item['media_id']);
		 	 	$media_width     = $media_data['width'];
		 	 	$media_height    = $media_data['height'];
		 	 	$media_filesize  = $media_data['filesize'];
		 	 	$media_extension = Application_Model_Media::getMediaExtension($item['media_id']);

                $media_infos = '<span class="file-info"><strong>'.$this->view->translate("Nom du fichier").':</strong> '.$item['filename'].'</span><br>';
                $media_infos .= '<span class="file-info"><strong>'.$this->view->translate("Type du fichier").':</strong> .'.$media_extension.'</span><br>';
                $media_infos .= '<span class="file-info"><strong>'.$this->view->translate("Taille du fichier").':</strong> '.$media_filesize.'</span><br>';
                $media_infos .= '<span class="file-info"><strong>'.$this->view->translate("Dimensions").':</strong> '.$media_width.' x '.$media_height.'</span>';
		 	 	$row[] = $media_infos;

		 	 	/*show in gallery*/
		 	 	$show = ($item['show_in_gallery'] == 1 ) ? 'selected' : '' ;
                $hide = ($item['show_in_gallery'] == 0 ) ? 'selected' : '' ;

		 	 	$statut = "" ;
                $statut .= "<select class='styled' name='' id='statut' data-resource_id=".$item['id']." data-resource_type='medias' style='width:100px'>" ;
                $statut .= "<option value='1' ".$show.">Oui</option>" ;
                $statut .= "<option value='0' ".$hide.">Non</option>" ;
                $statut .= "</select>" ;  
                $row[] = $statut ;


		 	 	$id = $item['id'];
		 	 	$url_edit = $this->view->baseUrl().'/medias/modify/do/edit/id/'.$item['media_id'];

		 	 	$row[] = Application_Class_Forms::actions($url_edit,"medias",$item["id"]) ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}

	public function multipleuploadAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

        $languages = Application_Model_Language::getLanguages();
        $User = new Application_Model_User("admin");

        $folder = $_REQUEST['folder'];
        $upload_path = UPLOAD_PATH . 'images/' . $folder . '/';

        if (!empty($_FILES)) {
            setlocale(LC_CTYPE, "fr_FR.utf8");

            if ($_FILES['file']['size'] > 0 && $_FILES['file']['size'] < MAX_SIZE*DEFAULT_UNIT) {
            	$path_parts = pathinfo($upload_path . $_FILES['file']['name']);
            	$extension = $path_parts["extension"] ;

            	if (!in_array($extension, array("jpeg","jpg","png","JPEG","JPG","PNG"))) {
					$ret["state"] = "error" ;
					$ret["msg"] = "Fichier non autorisé" ;
					
	                echo Zend_Json::encode($ret) ;
	                die() ;
            	}

	            $temp_file = $_FILES['file']['tmp_name'];

	            if (!is_dir($upload_path)) {
	                if (!mkdir($upload_path)) {
	                    echo "Erreur: Veuillez créer manuellement le dossier " . $upload_path;
	                    exit(0);
	                }
	            }

	            $path_parts = pathinfo($upload_path . $_FILES['file']['name']);
	            $target_filename = uniqid() . "-source." . $path_parts['extension'];
	            $target_file = str_replace('//', '/', $upload_path) . $target_filename;

	            if (move_uploaded_file($temp_file, $target_file)) {
					$d = array(
						'id_user' => ($User->getId()) ? $User->getId() : 1
						,'filename' => $target_filename
						,'title' => $path_parts['filename']
						,'caption' => NULL
						,'alt' => NULL
						,'description' => NULL
					);
					Application_Model_Media::addMedia($d);

	                // create thumbnail
	                $Image = new Application_Class_Image();
	                $Image->contain($target_file, 'thumbnail', 60, 60);
					$Image->contain($target_file, 'mini', 150, 150);
					$Image->contain($target_file, 'small', 320, 320);
					$Image->contain($target_file, 'medium', 480, 480);
					$Image->contain($target_file, 'large', 640, 640);
					$Image->thumbnail($target_file, '370x370', 370, 370);
					$Image->thumbnail($target_file, 'h350', 350);
					$Image->thumbnail($target_file, 'facebook', 600,600);

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

	public function updatemediainfosAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	if($_POST){

	   		$languages = Application_Model_Language::getLanguages();
		   	$post = array();
		   	parse_str($_POST['data'], $post);
		   	$id = (int)$post['Medias']['id'];

		   	if(!empty($languages)){ 
		   		foreach ($languages as $k => $language) {
		   			$title = Application_Class_Utils::idml($post['Medias'], 'title_'.$language['abbreviation'], "");
		   			$caption = Application_Class_Utils::idml($post['Medias'], 'caption_'.$language['abbreviation'], "");
		   			$alt = Application_Class_Utils::idml($post['Medias'], 'alt_'.$language['abbreviation'], "");
		   			$description = Application_Class_Utils::idml($post['Medias'], 'description_'.$language['abbreviation'], "");

		   			$id_language = (int)$language['id'];
		   			$data_medias_multilingual = array(
		   				'title' => $title 
		   				,'caption' => $caption 
		   				,'alt' => $alt
		   				,'description' => $description
		   			);
		   			Application_Model_Global::pupdate(TABLE_PREFIX.'medias_multilingual', $data_medias_multilingual, " id_media=:id AND id_language=:id_language ",array(":id"=>$id,":id_language"=>$id_language));
		   		}
		   	}

		   	echo "updated";
	   }
	}

	public function getphotoinfosAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$media_id = (int)$this->_getParam("id");
	   	if($media_id){
   			echo Zend_Json::encode($this->view->partial("medias/sidebar/media_metas.phtml", array("media_id"=>$media_id)));
	   	}		
	}

	public function addcoverAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$id_media = (int)$this->_getParam("media_id");
	   	if($id_media){

	   		$module = $this->_getParam("module_item");
	   		$id_item = (int)$this->_getParam("id_item");
	   		$type = $this->_getParam("type");

			$data = array(
				'module' => $module
				,'id_item' => $id_item
				,'type' => $type 
				,'id_media' => $id_media
			);
			Application_Model_Media::addCover($data);

			$cover_photo = $this->view->partial("medias/sidebar/cover_photo.phtml", array("id_media"=>$id_media, "id_item"=>$id_item, "type"=>$type, "module"=>$module));
			echo Zend_Json::encode(array("cover_photo"=>$cover_photo));
		}
	}

	public function deletecoverAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$id_media = (int)$this->_getParam("media_id");
	   	if($id_media){
	   		$module = $this->_getParam("module_item");
	   		$id_item = (int)$this->_getParam("id_item");
	   		$type = $this->_getParam("type");

			$data = array(
				'module' => $module
				,'id_item' => $id_item
				,'type' => $type 
				,'id_media' => $id_media
			);
			Application_Model_Media::deleteCover($data);

			$add_cover = $this->view->partial("medias/sidebar/add_cover.phtml", array("id_media"=>0, "id_item"=>$id_item, "type"=>$type, "module"=>$module));
			echo Zend_Json::encode(array("add_cover"=>$add_cover));
		}	   			
	}

	public function checkmediasAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$medias = Application_Model_Media::getAll();

	   	$res = (!empty($medias)) ? 1 : 0 ;

	   	echo $res ;
	}
}