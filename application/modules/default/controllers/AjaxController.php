<?php
class AjaxController extends Application_AbstractController{

    public function init()
    {
      // error_reporting(E_ALL);
      // ini_set("display_errors",1);
    }

    /**
     * Generic zend-form ajax validator
     */
    public function validateformAction()
    {
      // error_reporting(E_ALL);
      //           ini_set("display_errors",1);
                
        $formName = $this->getRequest()->getParam('identifier', null);

        if (! $formName || ! is_string($formName)) {
            $this->getHelper('json')->sendJson('form validator error');
        }

        $form_class = 'Application_Form_' . $formName;

        if (! class_exists($form_class)) {
            $this->getHelper('json')->sendJson('form validator error');
        }
        
        $form = new $form_class();

        $form->isValid($this->_getAllParams());

        $json = array();

        if ($form->getElement('csrf')) {
            $form->getElement('csrf')->initCsrfToken();
            $form->getElement('csrf')->initCsrfValidator();
            $new_csrf_hash = $form->getElement('csrf')->getHash();

            $json['ajax_csrf'] = $new_csrf_hash;
        }

        $json['errors'] = $form->getMessages();
        $this->getHelper('json')->sendJson($json);
    }

    public function newsletterAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $email = $this->_getParam('email');

        $check = Application_Model_Global::pselectRow(TABLE_PREFIX.'newsletters','id,statut',"email = :email",array(":email" => $email));

        if (!empty($check)) {
            if ($check["statut"]) {
                $ret['state'] = "error" ;
                $ret['msg'] = str_replace("#site_name#", Zend_Registry::get("option")->site_name, $this->view->translate("Vous êtes déja abonnés à #site_name#"));
            }
            else{
                Application_Model_Global::pupdate(TABLE_PREFIX.'newsletters',array("statut" => 1),"id=:id",array(":id" => $check["id"]));

                $ret['state'] = "success" ;
                $ret['msg'] = str_replace("#site_name#", Zend_Registry::get("option")->site_name, $this->view->translate("Désormais vous êtes de nouveau abonnés à #site_name#"));
            }
        }
        else{
            $data = array(
                "id_language" => DEFAULT_LANG_ID
                ,"email" => $email
                ,"statut" => 1
                ,"create_time" => Application_Plugin_Common::now()
                ,"update_time" => Application_Plugin_Common::now()
            );

            $res = Application_Model_Global::insert(TABLE_PREFIX.'newsletters',$data);

            if ($res) {
                /*send mail*/
                $data_email=array(
                    "custom_content" => TRUE
                    ,"phtml"     => "subscribe_newsletter.phtml"
                    ,"from"     => Zend_Registry::get('option')->get('company_email')
                    ,"to"       => $email
                    ,"addbcc"   => Zend_Registry::get('option')->get('admin_email')
                    ,"subject"  => $this->view->translate("Newsletter - Nouvelle inscription")
                );

                if (Application_Class_Email::send($data_email)) {
                  $ret['state'] = "success" ;
                  $ret['msg'] = str_replace("#site_name#", Zend_Registry::get("option")->site_name, $this->view->translate("Désormais vous êtes abonnés à #site_name#"));
                }
                else{
                  $ret['state'] = "error" ;
                  $ret['msg'] = $this->view->translate("Une erreur est survenue. Veuillez réessayer ultérieurement") ;
                }
            }
        }

        echo Zend_Json::encode($ret);
    }
}