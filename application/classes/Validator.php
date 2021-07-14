<?php
class Application_Class_Validator {
	
    public static function validate_url($url) 
    {
        $pattern = '/^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&amp;?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/';
        return preg_match($pattern, $url);
    }
	
	public static function validate_email($email)
	{
		$validator = new Zend_Validate_EmailAddress();
		if ($validator->isValid($email)) {
		    return true;
		} else {
		    return false;
		}
	}
}