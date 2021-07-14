<?php
class NewsController extends Application_AbstractController
{
	protected $version;

	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');

		Zend_View_Helper_PaginationControl::setDefaultViewPartial('_partials/pagination_moteur_ajax.phtml');

		$this->view->inlineScript()->appendFile(THEMES_DEFAULT_URL . 'scripts/news/index.js?v='.$this->version, 'text/javascript');
	}

	public function indexAction()
	{
		$params["q"] = $this->_getParam("q","") ;
		$params["d"] = $this->_getParam("d","") ;
		
		$get = Application_Model_Page::getPageByCatId(3,"large",$params) ;
		array_multisort(array_column($get["content"], 'create_date'), SORT_DESC, $get["content"]);
		$news = $get["content"] ;
		$news = !empty($news) ? $news : array();

		$paginator = Zend_Paginator::factory($news);
		$currentpage=$this->getRequest()->getParam('page',1);
		$paginator->setCurrentPageNumber($currentpage);
    	$paginator->setItemCountPerPage(NB_ROW);
    	$this->view->paginator = $paginator;
	}

	public function getAction()
	{
		$this->_helper->layout->disableLayout(); 

		$params["q"] = $this->_getParam("q","") ;
		$params["d"] = $this->_getParam("d","") ;

		$get = Application_Model_Page::getPageByCatId(3,"large",$params) ;
		array_multisort(array_column($get["content"], 'create_date'), SORT_DESC, $get["content"]);
		$news = $get["content"] ;
		$news = !empty($news) ? $news : array();

		$paginator = Zend_Paginator::factory($news);
		$currentpage=$this->getRequest()->getParam('page',1);
		$paginator->setCurrentPageNumber($currentpage);
    	$paginator->setItemCountPerPage(NB_ROW);
    	$this->view->paginator = $paginator;
	}

	public function ficheAction()
	{
		$permalink = $this->_getParam("permalink") ;

		$get = Application_Model_Page::getPageByPermalink($permalink) ;

		if ($get["id_page"]) {
			/*update nb views*/
			Application_Model_News::setPostViews($get["id_page"]) ;

			$this->view->id_new = $get["id_page"] ;
			$this->view->new = $new = Application_Model_Page::getPageByPageId($get["id_page"]) ;

			/*commentaires*/
			$getCommentsByIdNew = Application_Model_News::getCommentsByIdNew($get["id_page"]) ;
			$comments = !empty($getCommentsByIdNew) ? $getCommentsByIdNew : array();

			$paginator = Zend_Paginator::factory($comments);
			$currentpage=$this->getRequest()->getParam('page',1);
			$paginator->setCurrentPageNumber($currentpage);
	    	$paginator->setItemCountPerPage(NB_ROW_COMMENTS);
	    	$this->view->paginator = $paginator;
		}
		else{
        	$url = Application_Class_Url::getMultilingualUrl(array("id_language" => DEFAULT_LANG_ID,"resource" => "news","action" => "index")) ;
			$this->_redirect($url);		
		}
	}

	public function addcommentAction()
	{
		$this->_helper->layout->disableLayout(); 
		$this->_helper->viewRenderer->setNoRender();

		$data_comment = array(
			"id_new" => (int)$this->_getParam("id_new")
			,"name" => $this->_getParam("name")
			,"email" => $this->_getParam("email")
			,"comment" => $this->_getParam("commentaire")
			,"create_time" => Application_Plugin_Common::now()
		) ;

		$t = Application_Model_Global::insert(TABLE_PREFIX.'news_comments',$data_comment);

	   	if($t)
		{
			/*notify admin to the new comment*/
			$new = Application_Model_Page::getPageByPageId($this->_getParam("id_new")) ;
			$params["from"] = $this->_getParam("email") ;
			$params["title"] = $new["title"] ;

			$t = $this->sendMailToAdmin($params) ;

			if ($t) {
				$res["state"] = "success";
				$res["msg"] = $this->view->translate("Votre commentaire a été envoyé et en attente d'approbation par l'administrateur.");
			}
			else{
				$res['state'] = 'error' ;
				$res['msg'] = $this->view->translate("Une erreur s'est produite, veuillez réessayer ultérieurement") ;
			}
		}
		else{
			$res['state'] = 'error' ;
			$res['msg'] = $this->view->translate("Une erreur s'est produite, veuillez réessayer ultérieurement") ;
		}

		echo Zend_Json::encode($res) ;
	}

	public function getcommentsAction()
	{
		$this->_helper->layout->disableLayout();

		$this->view->id_new = $id_new = (int)$this->_getParam("resource_id") ;

		/*commentaires*/
		$getCommentsByIdNew = Application_Model_News::getCommentsByIdNew($id_new) ;
		$comments = !empty($getCommentsByIdNew) ? $getCommentsByIdNew : array();

		$paginator = Zend_Paginator::factory($comments);
		$currentpage=$this->getRequest()->getParam('page',1);
		$paginator->setCurrentPageNumber($currentpage);
    	$paginator->setItemCountPerPage(NB_ROW_COMMENTS);
    	$this->view->paginator = $paginator;
	}

	public function sendMailToAdmin($params)
	{
		global $param;
		
		$options = Zend_Registry::get("option") ;

		$html = new Zend_View();
		$html->setScriptPath(APPLICATION_PATH . '/modules/default/views/scripts/emails/');
		$html->assign('datas', $params);
		$message = $html->render('comments.phtml');

		$mail    = new Zend_Mail('utf-8');
		$mail->setBodyHtml($message);
		$mail->setFrom("noreply@natoralyaroma.com", $options->site_name);
		$mail->addTo($options->company_email);
		$mail->addBcc($options->admin_email);
		$mail->setSubject("Nouveau commentaire");

		$sent = FALSE;
		if (!$param->is_local) {
		    if($mail->send())
		        $sent = TRUE;
		}else {
		    $tr = new Zend_Mail_Transport_Smtp($param->smtp_local);
		    Zend_Mail::setDefaultTransport($tr);
		    if($mail->send())
		        $sent = TRUE;
		}

		return $sent ;
	}
}