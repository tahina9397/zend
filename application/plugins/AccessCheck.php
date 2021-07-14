<?php
class Application_Plugin_AccessCheck extends Zend_Controller_Plugin_Abstract
{  
	public function preDispatch(Zend_Controller_Request_Abstract $request)
	{
		$module   = $request->getModuleName();
		$resource = $request->getControllerName();
		$action   = $request->getActionName();

		if ($module == "admin") {
			$User = new Application_Model_User("admin");
			$getStorage = $User->getStorage();

			if ($getStorage->isEmpty()){
				if (in_array($resource, array("ajax","index"))) {
				}
				else{
					$redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('redirector');
					$redirector->gotoUrl('/')
					           ->redirectAndExit();
				}
			}
			else if($resource == "index"){
				$redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('redirector');
				$redirector->gotoUrl('/siteconfiguration')
				           ->redirectAndExit();
			}
			
		}
	}
}