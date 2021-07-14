<?php

class Application_Plugin_MaintenanceMode extends Zend_Controller_Plugin_Abstract
{  
	public function routeShutdown(Zend_Controller_Request_Abstract $request)
	{
		$mode_maintenance = Zend_Registry::get('option')->mode_maintenance;
		$allowed_ips = Zend_Registry::get('option')->allowed_ips;

		// if we are on maintenance mode
		if(!in_array($_SERVER["REMOTE_ADDR"], explode(",", $allowed_ips))){
			if($mode_maintenance==1){
				// mode maintenance default module only
				$module = strtolower($request->getModuleName());
				$controller = strtolower($request->getControllerName());

				if((in_array($module, array("default","stock"))) && ($controller!="ajax" && $controller!="comingsoon")){
					$request->setActionName('index');
					$request->setModuleName('default');
					$request->setControllerName('comingsoon');						 				
				}	 
			}
		}
	}
}