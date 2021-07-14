<?php

class Trano_AjaxController extends Application_AbstractController
{
	public function init()
	{
	}

    public function deleteresourceAction()
    {
      $this->_helper->layout->disableLayout();
      $this->_helper->viewRenderer->setNoRender();

      $resource_type = $this->_getParam("resource_type") ;
      $resource_id = $this->_getParam("resource_id") ;

      $table = TABLE_PREFIX.$resource_type ;
      $t = Application_Model_Global::pdelete($table,"id=:resource_id",array(":resource_id" => $resource_id)) ;

      if ($t) {
        $res["state"] = "success" ;
        $res["msg"] = "Element suprrimé avec succès" ;
      } 

      echo Zend_Json::encode($res);
    }

    public function massdeleteresourceAction() 
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $resource_type = $this->_getParam('resource_type');

        $table = TABLE_PREFIX.$resource_type ;

        if (!empty($_POST['massdeleteitems'])) {
            foreach ($_POST['massdeleteitems'] as $k => $item) {
                $resource_id = (int) $item['value'];
                Application_Model_Global::pdelete($table,"id=:resource_id",array(":resource_id" => $resource_id)) ;
            }
        }

        $res["state"] = "success" ;
        $res["msg"] = "Eléments suprrimés avec succès" ;

        echo Zend_Json::encode($res);
    } 
    
	public function updatestateAction()
	{ 
		$this->_helper->layout->disableLayout(); 
	   	$this->_helper->viewRenderer->setNoRender();

	   	$resource_id = (int)$this->_getParam('resource_id');
	   	$resource_type = $this->_getParam('resource_type');
        $activate = (int)$this->_getParam('activate');

        switch ($resource_type) {
            case 'pages':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'pages', array('hidden'=>$activate), 'id=:resource_id',array(":resource_id" => $resource_id));
            break;

            case 'medias':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'medias', array('show_in_gallery'=>$activate), 'id=:resource_id',array(":resource_id" => $resource_id));
            break;

            case 'produits_phares':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'produits_phares', array('archive'=>$activate), 'id_category=:resource_id',array(":resource_id" => $resource_id));
            break;

            case 'similar_news':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'pages', array('is_similar_news'=>$activate), 'id=:resource_id',array(":resource_id" => $resource_id));
            break;

            case 'products_logo':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'produits_phares', array('id_logo'=>$activate), 'id_category=:resource_id',array(":resource_id" => $resource_id));
            break;

            case 'news_comments':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'news_comments', array('hidden'=>$activate), 'id=:resource_id',array(":resource_id" => $resource_id));
            break;

            case 'newsletters':
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.'newsletters', array('statut'=>$activate), 'id=:resource_id',array(":resource_id" => $resource_id));
            break;

        	default:
                $res = Application_Model_Global::pupdate(TABLE_PREFIX.$resource_type, array('archive'=>$activate), 'id=:resource_id',array(":resource_id" => $resource_id)) ;
        		break;
        }

        if($res){
            echo 1;
        }

	}
}