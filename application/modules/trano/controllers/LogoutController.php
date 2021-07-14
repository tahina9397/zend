<?php
class Trano_LogoutController extends Application_AbstractController {
	
	public function init() 
	{
    }
	
    function indexAction() 
    {
		$this->_helper->layout->disableLayout();   
		$this->_helper->viewRenderer->setNoRender();

		$User = new Application_Model_User("admin");
		$User->logout();
		
		$this->_redirect('/');		
	}
}