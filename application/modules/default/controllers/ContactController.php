<?php
class ContactController extends Application_AbstractController
{
	protected $version;

	public function init()
	{
		$this->version = $version = Zend_Registry::get('version');

		$this->view->headLink()->appendStylesheet("https://unpkg.com/leaflet@1.5.1/dist/leaflet.css");
		$this->view->inlineScript()->appendFile("https://unpkg.com/leaflet@1.5.1/dist/leaflet.js", 'text/javascript');

		$this->view->headLink()->appendStylesheet("https://api.tiles.mapbox.com/mapbox-gl-js/v1.2.0/mapbox-gl.css");
		$this->view->inlineScript()->appendFile("https://api.tiles.mapbox.com/mapbox-gl-js/v1.2.0/mapbox-gl.js", 'text/javascript');

		$this->view->inlineScript()->appendFile(THEMES_DEFAULT_URL.'js/leaflet-mapbox-gl.js', 'text/javascript');

		$this->view->inlineScript()->appendFile(THEMES_DEFAULT_URL . 'scripts/contact/index.js?v='.$this->version, 'text/javascript');
	}

	public function indexAction()
	{
		$contact_form = new Application_Form_Contact() ;
		$this->view->contact_form = $contact_form ;
	}

	public function sendAction()
   	{
		$this->_helper->layout->disableLayout(); 
		$this->_helper->viewRenderer->setNoRender();

		global $param;
		$options = Zend_Registry::get("option") ;

		$name =  $this->_getParam('name') ;
		$email =  $this->_getParam('email') ;
		$message =  $this->_getParam('message') ;
		$legal_notice =  (int)$this->_getParam('legal_notice',0) ;

	    if (!$legal_notice) {
	        $res['state'] = 'error' ;
	        $res['msg'] = $this->view->translate("Veuillez accepter la politique de confidentialité du site") ;

			echo Zend_Json::encode($res) ;
			die() ;
	    }

		if (empty($this->_getParam("g-recaptcha-response"))) {
	        $res['state'] = 'error' ;
	        $res['msg'] = $this->view->translate("Veuillez cocher la case captcha") ;

			echo Zend_Json::encode($res) ;
			die() ;
	    }

		$html = new Zend_View();
		$html->setScriptPath(APPLICATION_PATH . '/modules/default/views/scripts/emails/');
		$html->assign('datas', array("from" => $name,"message" => $message));
		$message = $html->render('contact.phtml');

		$setSubject = "#name# via #site_name#" ;
		$setSubject = str_replace("#name#", $name, $setSubject) ;
		$setSubject = str_replace("#site_name#", $options->site_name, $setSubject) ;

		$mail    = new Zend_Mail('utf-8');
		$mail->setBodyHtml($message);
		$mail->setFrom($email, $options->site_name);
		$mail->addTo($options->company_email);
		$mail->addBcc($options->admin_email);
		$mail->setSubject($setSubject);

		$sent = FALSE;
		if (!$param->is_local) {
		    if($mail->send())
		        $sent = TRUE;
		}else {
		    $tr = new Zend_Mail_Transport_Smtp($param->smtp_local);
		    Zend_Mail::setDefaultTransport($tr);
		    if($mail->send())
		        $sent = TRUE;
		}

       	if($sent)
		{
			$data_contact = array(
				"name" => $name
				,"email" => $email
				,"message" => $message
				,"create_time" => Application_Plugin_Common::now()
			) ;
			
			Application_Model_Global::insert(TABLE_PREFIX.'contacts',$data_contact);

			$res["state"] = "success";
			$res["msg"] = $this->view->translate("Votre message a été envoyé");
		}
		else{
			$res['state'] = 'error' ;
			$res['msg'] = $this->view->translate("Une erreur s'est produite, veuillez réessayer ultérieurement") ;
		}

		echo Zend_Json::encode($res) ;
    }
}