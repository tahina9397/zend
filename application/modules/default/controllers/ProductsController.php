<?php
class ProductsController extends Application_AbstractController
{
	protected $version;

	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');
		$this->view->inlineScript()->appendFile(THEMES_DEFAULT_URL . 'scripts/products/index.js?v='.$this->version, 'text/javascript');
	}

	public function indexAction()
	{
		$category_permalink = $this->_getParam("category_permalink") ;

		$get = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_groups_multilingual","id_category_group,title","permalink = :category_permalink AND id_language = :id_language",array(":category_permalink" => $category_permalink,":id_language" => DEFAULT_LANG_ID)) ;

		if ($get["id_category_group"]) {
			$this->view->id_category_group = $get["id_category_group"] ;
			$this->view->category_title = $get["title"] ;
		}
		else{
			$this->_redirect("/");		
		}
	}

	public function ficheAction()
	{
		$category_permalink = $this->_getParam("category_permalink") ;
		$permalink = $this->_getParam("permalink") ;

		$check_category_group = Application_Model_Global::pselectRow(TABLE_PREFIX."categories_groups_multilingual","id,id_category_group,title","permalink = :category_permalink AND id_language = :id_language",array(":category_permalink" => $category_permalink,":id_language" => DEFAULT_LANG_ID)) ;

		$get = Application_Model_Category::getCategoryIdByPermalink($permalink) ;

		if ($check_category_group["id_category_group"] && ($check_category_group["id_category_group"] == $get["id_category_group"]) && $get["id_category"]) {
			$this->view->datas = $datas = Application_Model_Page::getPageByCatId($get["id_category"],"large") ;
			$this->view->category_title = $check_category_group["title"] ;

			$this->view->lots = Application_Model_Lots::getLotsByIdProduct($get["id_category"]) ;
		}
		else{
			$this->_redirect("/");		
		}
	}

	public function allAction()
	{
	}
}