<?php

class Trano_SiteconfigurationController extends Application_AbstractController
{
	public function init()
	{
	}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Site configuration');
		$Options = new Application_Model_Options;

		// update options
		if(!empty($_POST['Option'])){
			foreach ($_POST['Option'] as $meta_key => $meta_value) {
				if($meta_key!="id"){

					if (is_array($meta_value)) {
						$meta_value = implode(",", $meta_value) ;
					}

					$Options->updateOption($meta_key, $meta_value);
				}
			}
		}
		
		$this->view->options = $options = $Options->getAllOptions();
	}
}