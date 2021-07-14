<?php
class Zend_View_Helper_FlashMessages extends Zend_View_Helper_Abstract
{
    public function flashMessages()
    {
        $messages = Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger')->getMessages();
        $output = '';
       
        if (!empty($messages)) {
            foreach ($messages as $message) {
                
                $output .= '
                    <div class="alert ' . key($message) . '" style="margin-top: 16px;">
                        <button type="button" class="close" data-dismiss="alert">×</button>    
                        '.current($message).'    
                    </div>    
                ';
            
            }
        }
        
        return $output;
    }
}