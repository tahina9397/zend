<?php

class Trano_DashboardController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->initContext();
	}
	
	public function indexAction(){
		$this->view->headTitle()->append('Tableau de bord');	
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'js/functions/index.js', 'text/javascript');
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'js/charts/chart1.js', 'text/javascript');	
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'js/charts/chart2.js', 'text/javascript');	
		$this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'js/charts/chart3.js', 'text/javascript');	
	}
	
	public function errorAction(){
		$this->view->headTitle()->append("Interdit d'accès");
	}
}