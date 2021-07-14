<?php

class Trano_JqueryfileuploadController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->addActionContext('upload', 'html');
		$ajaxContext->initContext();
	}

	public function uploadAction()
	{
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$upload_handler = new Application_Class_UploadHandler(array(
	   	    'upload_dir' => UPLOAD_PATH.'images/posts/editor/',
	   	    'upload_url' => RELATIVE_UPLOAD_URL.'images/posts/editor/',
	   	));
	}
}