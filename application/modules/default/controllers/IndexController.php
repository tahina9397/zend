<?php
class IndexController extends Application_AbstractController
{
	protected $version;

	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');
		$this->view->inlineScript()->appendFile(THEMES_DEFAULT_URL . 'scripts/index/index.js?v='.$this->version, 'text/javascript');
	}

	public function indexAction()
	{
	}
}