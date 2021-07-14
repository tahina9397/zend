<?php
class ComingsoonController extends Application_AbstractController
{
	// protected $version;

	public function init(){
		$this->version = $version = Zend_Registry::get('version');
		Zend_Layout::getMvcInstance()->setLayout('comingsoon');
	}

	public function indexAction()
	{
		$this->view->headTitle()->append($this->view->translate("Site en cours de maintenance"));
	}
}