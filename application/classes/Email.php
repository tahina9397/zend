<?php

class Application_Class_Email {

    public static function send($assignvalues = array(), $render = false) {
        $front = Zend_Controller_Front::getInstance();
        $request = $front->getRequest();
        $module = $request->getModuleName();

        $site_name = Zend_Registry::get('option')->get('site_name');

        $html = new Zend_View();
        $html->setScriptPath(APPLICATION_PATH . '/modules/default/views/scripts/emails');

        if (sizeof($assignvalues) > 0) {
            foreach ($assignvalues as $key => $val):
                $html->assign($key, $val);
            endforeach;
        }

        $mail = new Zend_Mail('utf-8');
        $content = $html->render($assignvalues['phtml']);

        if ($assignvalues['custom_content']) {
            $phtml = $html->render($assignvalues['phtml']);
            $template = Application_Model_Global::pselectRow(TABLE_PREFIX . "template_multilingual", "text", "id_template = 1 AND id_language = " . DEFAULT_LANG_ID);
            $content = str_replace('#custom_content#', $template["text"], $phtml);
        } else {
            $content = $html->render($assignvalues['phtml']);
        }

        // layout
        if (isset($assignvalues['layout'])) {
            $layout = $html->render($assignvalues['layout']);
        } else {
            $layout = $html->render("layout.phtml");
        }

        $html_message = str_replace('#content#', $content, $layout);
        if ($render) {
            echo $html_message;
            die();
        }

        $mail->setBodyHtml($html_message);
        $mail->setFrom($assignvalues['from'], $site_name);
        $mail->addTo($assignvalues['to']);
        //$mail->addTo('mbool_tina@yahoo.fr');
        $mail->setSubject($assignvalues['subject'] . " | " . $site_name);

        if (!empty($assignvalues['addcc'])) {
            $mail->addCc($assignvalues['addcc']);
        }

        if (!empty($assignvalues['addbcc'])) {
            $mail->addBcc($assignvalues['addbcc']);
        }

        // if ($_SERVER['SERVER_ADDR'] != '127.0.0.1') {
        //     $tr = new Zend_Mail_Transport_Smtp('173.212.249.215');
        //     Zend_Mail::setDefaultTransport($tr);
        //     if ($mail->send()) {
        //         return true;
        //     } else {
        //         return false;
        //     }
        // } else {
            // $tr = new Zend_Mail_Transport_Smtp('smtp.blueline.mg');
            // Zend_Mail::setDefaultTransport($tr);
            if ($mail->send()) {
                return true;
            } else {
                return false;
            }
        // }
    }

}
