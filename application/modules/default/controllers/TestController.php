<?php
class TestController extends Application_AbstractController
{
	public function init()
	{
        // error_reporting(E_ALL);
        // ini_set("display_errors", 1);
	}

	public function indexAction()
    {
        $Image = new Application_Class_Image() ;
        $t = $Image->removeBG() ;

        echo "<pre>" ;
        print_r($t);
        echo "</pre>" ;
        die() ;
    }

  
    public function templatemailAction()
    {
        $this->_helper->layout->disableLayout(); 
        // $this->_helper->viewRenderer->setNoRender();

        $this->view->content = $content = $this->view->partial("test/_partials/activation.phtml",array()) ;
    }

    public function translateAction()
    {
        $this->_helper->layout->disableLayout(); 
        $this->_helper->viewRenderer->setNoRender();

        $translations = Application_Model_Global::pselect(TABLE_PREFIX."translations_multilingual","id_translation,`key` as mot_cle","id_language = 1") ;

        if (!empty($translations)) {
            foreach ($translations as $t) {
                $tr = Application_Model_Translation::translate("fr","en",$t["mot_cle"]) ;

                Application_Model_Global::pupdate(TABLE_PREFIX."translations_multilingual",array("value" => $tr),"id_translation = :id_translation AND id_language = 2",array(":id_translation" => $t["id_translation"])) ;
            }
        }

        die("here") ;
    }

    public function removebgAction()
    {
        $this->_helper->layout->disableLayout(); 
        $this->_helper->viewRenderer->setNoRender();
        
        $Image = new Application_Class_Image() ;
        $t = $Image->removeBG() ;

        echo "<pre>" ;
        print_r($t);
        echo "</pre>" ;
        die() ;
    }


}