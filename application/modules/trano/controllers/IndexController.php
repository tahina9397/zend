<?php

class Trano_IndexController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->initContext();
		Zend_Layout::getMvcInstance()->setLayout('login');
	}

	public function indexAction()
	{
		global $params;
		global $siteconfig;
		$options = Zend_Registry::get("option");
		
		$this->view->headTitle()->append('Admin login');

		// $storage = new Zend_Auth_Storage_Session('authSession', 'admin');
		// $data    = $storage->read();

		$User = new Application_Model_User("admin");
		$storage = $User->getStorage();
		if (!$storage->isEmpty()):
		    $this->_redirect('/siteconfiguration');
		endif;

		// authenticate user
		$sess = new Zend_Session_Namespace('adminlogin');
		if($_POST){
			if(!empty($_POST['tab']) AND $_POST['tab']=="login") { 
			    $email      = $this->view->escape($_POST['email']);
			    $password   = $this->view->escape($_POST['password']);
			    $rememberme = (!empty($_POST['rememberme'])) ? $this->view->escape($_POST['rememberme']) : 0;

				$return = $this->authenticate($email, $password, $rememberme);
			    switch ($return) {
			        case 'okok':
			                $this->_redirect('/siteconfiguration');
			            break;

			        case 'invalid':
			        		$sess->login_error = '
	        		            <div style="margin-top: 16px;" class="alert alert-error">
	                                <button data-dismiss="alert" class="close" type="button">×</button>
	                                Login et/ou mot de passe incorrect.
	                            </div>';		            
			            break;

			        case 'emptyfields':
			        		$sess->login_error = '
    				            <div style="margin-top: 16px;" class="alert alert-error">
    		                        <button data-dismiss="alert" class="close" type="button">×</button>
    		                        Tous les champs sont obligatoires.
    		                    </div>	
			        		';
			            break;
			        
			        default:
			            break;
			    }			 	 
			}else if(!empty($_POST['tab']) AND $_POST['tab']=="forgot-password"){ 
				$email = $this->view->escape($_POST['fp_email']);
			    
			    $where = " email=:email";
			    $exist = Application_Model_Global::pselect(TABLE_PREFIX.'users', '', $where,array(":email" => $email));

			    if(!empty($exist)){
			    	$hash = md5(PASSWORD_HASH.$email) ;

	 				// send mail with a link to set password
			        $html = new Zend_View();
			        $html->setScriptPath(TEMPLATES_TRANO_PATH.'emails/');
					
					$url   = $options->company_site.'/resetpassword?email='.$email.'&hash='.$hash;
			        $html->assign('url', $url);
					
					$mail    = new Zend_Mail('utf-8');
					$message = $html->render('forgotpwd.phtml');
			        $mail->setBodyHtml($message);
			        $mail->setFrom($options->company_email, $options->site_name);
			        $mail->addTo($email);
			        // $mail->addBcc('contact@genius-at-work.com');
    				$mail->setSubject('Récupération de votre mot de passe');

			        $sent = FALSE;
			        if (!$params->is_local) {
			            if($mail->send())
			            	$sent = TRUE;
			        }else {
			            $tr = new Zend_Mail_Transport_Smtp($params->smtp_local);
			            Zend_Mail::setDefaultTransport($tr);
			            if($mail->send())
			            	$sent = TRUE;
			        }

			        if($sent){ 
                		$sess->login_error = '
        		            <div style="margin-top: 16px;" class="alert alert-success">
                                <button data-dismiss="alert" class="close" type="button">×</button>
                                Un email vient d\'être envoyé dans votre boîte mail.
                            </div>	
                		'; 	 
			        }else{ 
	            		$sess->login_error = '
	    		            <div style="margin-top: 16px;" class="alert alert-error">
	                            <button data-dismiss="alert" class="close" type="button">×</button>
	                            Il y a eu une erreur lors de l\'envoit du mail, veuillez recommencer.
	                        </div>	
	            		'; 	 
			        }
			    }else{ 
	        		$sess->login_error = '
			            <div style="margin-top: 16px;" class="alert alert-error">
	                        <button data-dismiss="alert" class="close" type="button">×</button>
	                        Adresse email incorrecte et/ou inexistante.
	                    </div>	
	        		';	 	 
			    }
			}
		} // end if($_POST)
	}

	private function authenticate($email, $password, $rememberme) {
		global $params;

	    if (!empty($email) and !empty($password)):
	    	$w = "email = :email AND password = :password " ;
	    	$get = Application_Model_Global::pselectRow(TABLE_PREFIX.'users','id',$w,array(":email" => $email,":password" => md5($password))) ;

	    	if (!empty($get)) {
				// bool setcookie ( string $name [, string $value [, int $expire = 0 [, string $path [, string $domain [, bool $secure = false [, bool $httponly = false ]]]]]] )
			    if ($rememberme == 1):
			    	setcookie("email", $email, time() + 60 * 60 * 24 * 100, "/", $params->cookie_domain);
			        setcookie("password", $password, time() + 60 * 60 * 24 * 100, "/", $params->cookie_domain);
			    else:
			        setcookie("email", "", NULL, "/", $params->cookie_domain);
			        setcookie("password", "", NULL, "/", $params->cookie_domain);
			    endif;

			    Zend_Loader::loadClass('Zend_Auth_Adapter_DbTable');
			    $dbAdapter   = Zend_Registry::get('db');
			    $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
			    $authAdapter->setTableName(TABLE_PREFIX.'users')
			            ->setIdentityColumn('email')
			            ->setCredentialColumn('password');

			    $authAdapter->setIdentity($email);
			    $authAdapter->setCredential(md5($password));

			    $auth = Zend_Auth::getInstance();
			    $result = $auth->authenticate($authAdapter);

			    if ($result->isValid()):
			        $data = $authAdapter->getResultRowObject(null, 'password');
			    	$auth->setStorage(new Zend_Auth_Storage_Session('admin'));
			        $auth->getStorage()->write($data);

			        // update last
			        $id = $data->id;
			        Application_Model_Global::pupdate(TABLE_PREFIX."users", array('last_activity'=>date('Y-m-d H:i:s')), " id=:id ",array(":id" => $id));

			        return "okok";
			    else:
			        return "invalid";
			    endif;
	    	}
	    	else {
	    		return "invalid" ;
	    	}
	    else:
	        return "emptyfields";
	    endif;
	}
}