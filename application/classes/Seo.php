<?php
class Application_Class_Seo {

	protected $_seo_title_len;
	protected $_seo_meta_description_len;
	protected $_seo_meta_keywords_len;

	public function __construct()
	{
	    $this->_seo_title_len = 55;
	    $this->_seo_meta_description_len = 135;
	    $this->_seo_meta_keywords_len = 95;
	}

	// limit seo_title (55 car max)
	public function limitTitle($seo_title)
	{ 
		return Application_Class_Utils::getSubstr($seo_title, $this->_seo_title_len);
	}

	// limit seo_meta_description (135 car max)
	public function limitMetaDescription($seo_meta_description)
	{
		return Application_Class_Utils::getSubstr($seo_meta_description, $this->_seo_meta_description_len);
	}

	// limit seo_meta_keywords (95 car max)
	public function limitMetaKeywords($seo_meta_keywords)
	{
		return Application_Class_Utils::getSubstr($seo_meta_keywords, $this->_seo_meta_keywords_len);
	}
}