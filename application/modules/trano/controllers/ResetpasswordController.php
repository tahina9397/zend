<?php

class Trano_ResetpasswordController extends Application_AbstractController
{
	public function init()
	{
		$ajaxContext = $this->_helper->getHelper('AjaxContext');
		$ajaxContext->initContext();
		Zend_Layout::getMvcInstance()->setLayout('login');
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Reset password'); 	
		$sess = new Zend_Session_Namespace('adminlogin');
		if($_POST){ 
			$email = $this->_getParam('email') ;
			$hash = $this->_getParam('hash') ;

			if (md5(PASSWORD_HASH.$email) == $hash) {
				$password  = $this->view->escape($_POST['password']);
				$cpassword = $this->view->escape($_POST['cpassword']); 

				if(trim($password)=="" or trim($cpassword)==""){ 
	        		$sess->login_error = '
			            <div style="margin-top: 16px;" class="alert alert-error">
	                        <button data-dismiss="alert" class="close" type="button">×</button>
	                        Les 2 champs sont obligatoires.
	                    </div>';  	 
				}
				elseif($password!=$cpassword){ 
	        		$sess->login_error = '
			            <div style="margin-top: 16px;" class="alert alert-error">
	                        <button data-dismiss="alert" class="close" type="button">×</button>
	                        Les 2 mots de passe ne sont pas identiques.
	                    </div>'; 	 
				}else{ 
					$return = Application_Model_Global::pupdate(TABLE_PREFIX."users", array('password'=>md5($password)), "email=:email",array(":email" => $email));

					$sess->login_error = '
			            <div style="margin-top: 16px;" class="alert alert-succes">
	                        <button data-dismiss="alert" class="close" type="button">×</button>
	                        Votre mot de passe a été changé avec succès.
	                    </div>'; 	
				}
			}
			else{
	    		$sess->login_error = '
		            <div style="margin-top: 16px;" class="alert alert-error">
	                    <button data-dismiss="alert" class="close" type="button">×</button>
	                    Token invalide.
	                </div>'; 
			}
		}
	} 
}