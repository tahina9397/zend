<?php

/**
 * Alerts flash messenger plugin
 * 
 * @author Mamy Christian
 * @copyright 2015 everydaymadagascar.com
 */
class Application_Plugin_Alerts
{

	/**
	 *
	 *
	 * Success notification
	 * 
	 * @param string $message        	
	 */
	public static function notice($message, $title = "")
	{
		Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->addMessage(array(
			'level' => 'notice'
			,'message' => $message
			,'title' => $title
		));
	}

	/**
	 *
	 *
	 * Error notification
	 * 
	 * @param string $message        	
	 */
	public static function error($message, $title = "")
	{
		Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->addMessage(array(
			'level' => 'error'
			,'message' => $message
			,'title' => $title
		));
	}

	/**
	 *
	 *
	 * Generic notification
	 * 
	 * @param string $message        	
	 */
	public static function warning($message, $title = "")
	{
		Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->addMessage(array(
			'level' => 'warning'
			,'message' => $message
			,'title' => $title
		));
	}

	/**
	 * Get messages from current session (optional) and from previous session and return them
	 * Flushes the current session messages
	 *
	 * @param bool $current
	 * include messages from current session
	 */
	public static function getMessages($current = true)
	{
		$flashMessages = array();
		$flashMessenger = Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger');
		
		// check for current messages
		// if found, display them now and flush the current message array
		// therefore, all messages intended to be shown on next page-refresh, should be near the redirect
		// and not in the parts which include other functionalities on the same page
		if ($current && $flashMessenger->hasCurrentMessages()) {
			$flashMessages = $flashMessenger->getCurrentMessages();
			$flashMessenger->clearCurrentMessages();
		}
		if ($flashMessenger->hasMessages()) {
			$flashMessages = array_merge($flashMessages, $flashMessenger->getMessages());
		}
		
		return $flashMessages;
	}
}