<?php

class Trano_UsersController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('getusers', 'html');
		$ajaxContext->addActionContext('gettypeusers', 'html');
		$ajaxContext->addActionContext('delete', 'html');
		$ajaxContext->addActionContext('massdelete', 'html');
		$ajaxContext->initContext();
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Utilisateurs');		 
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/users/index.js', 'text/javascript');	 
	}
	
	public function modifyAction()
	{ 
		$this->view->headTitle()->append('Edit User');

		global $params;
		global $siteconfig;
		$options = Zend_Registry::get("option");
		$this->view->do = $do = $this->view->escape($this->_getParam('do'));

		$first_name = $this->view->escape($_POST['Users']['first_name']) ;
		$last_name = $this->view->escape($_POST['Users']['last_name']) ;
		$full_name = trim($first_name." ".$last_name) ;

		$user = array();
	 	switch ($do) {
	 		case 'edit':
	 				$id = (int)$this->_getParam('id');
	 				$where = " id=:id ";
	 				$user = Application_Model_Global::pselect(TABLE_PREFIX.'users', '', $where,array(":id" => $id));
	 				$user = $user[0];

	 				if($_POST){ 
		 				$data_user = array(
							'first_name'   => $first_name
							,'last_name'   => $last_name
							,'full_name'   => $full_name
							,'email'       => $this->view->escape($_POST['Users']['email'])
							,'update_time' => date('Y-m-d H:i:s')
		 				);

						$id    = (int)$_POST['Users']['id'];
						$where = " id=:id ";
		 				Application_Model_Global::pupdate(TABLE_PREFIX.'users', $data_user, $where,array(":id" => $id));

		 				$this->_redirect('/users'); 	 
	 				}
	 			break;

	 		case 'add':

	 				if($_POST){ 
	 					$token = Application_Plugin_Common::getRandomString() ;
	 					$email = $this->view->escape($_POST['Users']['email']);

		 				$data_user = array(
							'first_name'   => $first_name
							,'last_name'   => $last_name
							,'full_name'   => $full_name
							,'email'       => $email
							,'token' => $token
							,'create_time' => date('Y-m-d H:i:s')
							,'update_time' => date('Y-m-d H:i:s')
		 				);

		 				Application_Model_Global::insert(TABLE_PREFIX.'users', $data_user);

		 				// send mail with a link to set password
				        $html = new Zend_View();
				        $html->setScriptPath(TEMPLATES_TRANO_PATH.'emails/');
						
						$url   = $options->company_site.'/resetpassword?email='.$email;
				        $html->assign('url', $url);
						
						$mail    = new Zend_Mail('utf-8');
						$message = $html->render('createpwd.phtml');
				        $mail->setBodyHtml($message);
				        $mail->setFrom($options->company_email, $options->site_name);
				        $mail->addTo($email);
				        // $mail->addBcc('contact@genius-at-work.com');
				        $mail->setSubject('Mise en place de votre mot de passe');

				        $sent = FALSE;
				        if (!$params->is_local) {
				            if($mail->send())
				            	$sent = TRUE;
				        }else {
				            $tr = new Zend_Mail_Transport_Smtp($params->smtp_local);
				            Zend_Mail::setDefaultTransport($tr);
				            if($mail->send())
				            	$sent = TRUE;
				        }

		 				$this->_redirect('/users');
	 				}
	 			break;
	 		
	 		default:
	 			break;
	 	}

	 	$this->view->user = $user;
	 	$this->view->hash = md5(PASSWORD_HASH.$user['email']) ;
	}

	public function getusersAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

		$aColumns = 
			array(
				'user.id'
				,'user.first_name'
				,'user.last_name'
				,'user.email'
				,'user.update_time'
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
		
		/*
		 * SQL queries
		 * Get data to display
		 */
		$sQuery = "
			SELECT 
				SQL_CALC_FOUND_ROWS user.id
				,user.first_name
				,user.last_name
				,user.email
				,IF(user.update_time='0000-00-00 00:00:00' OR user.update_time IS NULL, '', DATE_FORMAT(user.update_time,'%d %b %Y %Hh %imn')) AS update_time
			FROM ".TABLE_PREFIX."users user
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

		 	 	$row[] = $item['first_name'];
		 	 	$row[] = $item['last_name'];
		 	 	$row[] = $item['email'];
		 	 	$row[] = $item['update_time'];

		 	 	$id = $item['id'];
		 	 	
		 	 	$url_edit = $this->view->baseUrl().'/users/modify/do/edit/id/'.$item['id'];

                $row[] = Application_Class_Forms::actions($url_edit,"users",$item["id"]) ;

		 	 	$output['aaData'][] = $row;
		 	} 
		}
		
		echo json_encode( $output );
	}
	
}