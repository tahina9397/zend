<?php

/**
 * Common, application-wide methods
 * 
 */
class Application_Plugin_Common extends Zend_Controller_Plugin_Abstract
{
	/**
	 * generate random unique string
	 */
	static public function getRandomString()
	{
		return sha1(uniqid('', true));
	}

	/**
	 * generate random number
	 */
	static public function getRandomNum($min = 100000000, $max = 999999999)
	{
		return (int) mt_rand($min, $max) + time();
	}
	
	static public function getUniqId($length = 4)
	{
 		$chaine = "0123456789";
		srand((double)microtime()*1000000);
		$ok=false;
		while($ok===false){
			$string = "";
			for($i=0; $i<$length; $i++) {
				$string .= $chaine[rand()%strlen($chaine)];
			}
			$req = Application_Model_Global::pselectRow(TABLE_PREFIX."membres","id","code_secret = :code_secret",array(":code_secret" => $string));
			if(empty($req)){
				$ok=true;
			}
		}
		return $string;
	}

	/**
	 * get full base url (http://www.example.com/socialstrap)
	 */
	static public function getFullBaseUrl($include_base = true)
	{
		$front = Zend_Controller_Front::getInstance();
		$view = new Zend_View();
		
		if ($include_base) {
			$base_url = $view->baseUrl();
		} else {
			$base_url = '';
		}
		
		$url = $front->getRequest()->getScheme() . '://' . $front->getRequest()->getHttpHost() . $base_url;
		
		return $url;
	}

	
	/**
	 * get safe uri (http://www.example.com/socialstrap/something/something)
	 */
	static public function getSafeUri()
	{
		$front = Zend_Controller_Front::getInstance();
		$request = $front->getRequest();
		$controller = $request->getControllerName();
		$action = $request->getActionName();
		
		$url = Application_Plugin_Common::getFullBaseUrl().'/'.$controller.'/'.$action.'/';
		
		$params = Zend_Controller_Front::getInstance()->getRequest()->getParams();
		foreach ($params as $key => $val){
			if ($key === 'module' || $key === 'controller' || $key === 'action' || ! is_string($val) || ! is_string($val)) continue;
			$url .= htmlentities(strip_tags($key)) . '/' . htmlentities(strip_tags($val)) . '/';
		}

		return $url;
	}

	/**
	 * Returns mysql datetime for current time
	 */
	public static function now()
	{
		return date('Y-m-d H:i:s', time());
	}

	/**
	 * strip tags filter
	 */
	static function stripTags($content)
	{
		/*
		 * allow some tags and attributtes
		 * 
		$filter = new Zend_Filter_StripTags(array(
			'allowTags' => array(
				'a',
				'img',
				'pre'
			),
			'allowAttribs' => array(
				'src',
				'href'
			)
		));
		*/
		
		// strip everything
		$filter = new Zend_Filter_StripTags();
			
		return $filter->filter($content);
	}

	/**
	 * get location from ip address
	 */
	static function getLocatinFromIp()
	{
		$location = file_get_contents('http://freegeoip.net/json/'.$_SERVER['REMOTE_ADDR']);
 		return $location;
	}

	/**
	 * limit input to max posts
	 */
	static function limitInput($data)
	{
		if (Zend_Registry::get('option')->get('max_post_length') > 0 && strlen($data) > Zend_Registry::get('option')->get('max_post_length')) {
			$data = mb_substr($data, 0, Zend_Registry::get('option')->get('max_post_length'), 'utf-8') . '...';
		}
		
		return $data;
	}

	/**
	 * Return time elapsed
	 */
	static public function getTimeElapsedString($timestamp,$txt = true)
	{
		$etime = time() - $timestamp;
		
		$translator = Zend_Registry::get('Zend_Translate');
		
		if ($etime < 1) {
			return $translator->translate('a moment ago');
		}
		
		$a = array(
			12 * 30 * 24 * 60 * 60 => 'year',
			30 * 24 * 60 * 60 => 'month',
			24 * 60 * 60 => 'day',
			60 * 60 => 'hour',
			60 => 'minute',
			1 => 'second'
		);
		
		foreach ($a as $secs => $str) {
			$d = $etime / $secs;
			if ($d >= 1) {
				$r = round($d);
				
				switch ($str) {
					case 'year':
						if ($r > 1) { 
							$ret = (!$txt) ? $etime : sprintf($translator->translate('%s years ago'), $r) ;
						}
						else{
							$ret = (!$txt) ? $etime : sprintf($translator->translate('1 year ago'), $r) ;
						}
						break;
					case 'month':
						if ($r > 1) { 
							$ret = (!$txt) ? $etime : sprintf($translator->translate('%s months ago'), $r) ;
						}
						else{
							$ret = (!$txt) ? $etime : sprintf($translator->translate('1 month ago'), $r) ;
						}
						break;
					case 'day':
						if ($r > 1) { 
							$ret = (!$txt) ? $etime : sprintf($translator->translate('%s days ago'), $r) ;
						}
						else{
							$ret = (!$txt) ? $etime : sprintf($translator->translate('1 day ago'), $r) ;
						}
						break;
					case 'hour':
						if ($r > 1) { 
							$ret = (!$txt) ? $etime : sprintf($translator->translate('%s hours ago'), $r) ;
						}
						else{
							$ret = (!$txt) ? $etime : sprintf($translator->translate('1 hour ago'), $r) ;
						}
						break;
					case 'minute':
						if ($r > 1) { 
							$ret = (!$txt) ? $etime : sprintf($translator->translate('%s minutes ago'), $r) ;
						}
						else{
							$ret = (!$txt) ? $etime : sprintf($translator->translate('1 minute ago'), $r) ;
						}
						break;
					case 'second':
						if ($r > 1) { 
							$ret = (!$txt) ? $etime : sprintf($translator->translate('%s seconds ago'), $r) ;
						}
						else{
							$ret = (!$txt) ? $etime : sprintf($translator->translate('1 second ago'), $r) ;
						}
						break;
					default:
						;
						break;
				}
				return $ret;
			}
		}
	}
}