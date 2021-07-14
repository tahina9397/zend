<?php
class PagesController extends Application_AbstractController
{
	protected $version;

	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');
		$this->view->inlineScript()->appendFile(THEMES_DEFAULT_URL . 'scripts/pages/index.js?v='.$this->version, 'text/javascript');
	}

	public function indexAction()
	{
	}

	public function aboutAction()
	{
		$getPage = Application_Model_Page::getPageByCatId(1) ;
		$this->view->contents = $getPage["content"] ;

		$getTestimonial = Application_Model_Page::getPageByCatId(12) ;
		$this->view->testimonials = $getTestimonial["content"] ;

		$getObjectif = Application_Model_Page::getPageByCatId(13) ;
		$this->view->objectifs = $getObjectif["content"] ;

		$getTeam = Application_Model_Page::getPageByCatId(14) ;
		$this->view->teams = $getTeam["content"] ;
	}

	public function qualityAction()
	{
		$getPage = Application_Model_Page::getPageByCatId(15) ;
		$this->view->contents = $getPage["content"] ;

		$getPartenaires = Application_Model_Page::getPageByCatId(16) ;
		$this->view->partenaires = $getPartenaires["content"] ;

		$getProducts = Application_Model_Page::getPageByCatId(17) ;
		$this->view->products = $getProducts["content"] ;
	}

	public function farmAction()
	{
		$getPage = Application_Model_Page::getPageByCatId(19) ;
		$this->view->contents = $getPage["content"] ;
	}

	public function approachAction()
	{
		$section_1 = Application_Model_Page::getPageByCatId(20) ;
		$this->view->section_1 = $section_1 ;

		$section_2 = Application_Model_Page::getPageByCatId(21) ;
		$this->view->section_2 = $section_2["content"] ;

		$section_3 = Application_Model_Page::getPageByCatId(22) ;
		$this->view->section_3 = $section_3 ;
	}

	public function legalnoticeAction()
	{
		$section_1 = Application_Model_Page::getPageByCatId(32) ;
		$this->view->section_1 = $section_1 ;
	}
}