<?php
use \Statickidz\GoogleTranslate;
// use Stichoza\GoogleTranslate\GoogleTranslate;
// use Google\Cloud\Translate\V3\TranslationServiceClient ;


class Application_Model_Translation {

	public static function getTranslations(){ 
		return Application_Model_Multilingual::get(TABLE_PREFIX."marq_translations", TABLE_PREFIX."translations_multilingual", 'id', 'id_translation');		  	 
	} 

	public static function getTranslationById($id){ 
		return Application_Model_Multilingual::byid(TABLE_PREFIX."marq_translations", TABLE_PREFIX."translations_multilingual", 'id', 'id_translation', $id, 'tm.key, tm.value', false);			 
	}

 	public static function getValueMultilingual($id_translation, $id_language)
 	{ 
 		global $db;
 		$sql = " SELECT id_translation,id_language,`key`,value FROM ".TABLE_PREFIX."translations_multilingual WHERE id_translation='$id_translation' AND id_language='$id_language' ";

 		$data = $db->fetchRow($sql);
 		return $data; 		  	 
 	} 

 	public static function isTranslated($str)
 	{ 
 		global $db;
 		$str = $db->quote($str);
 		$sql = "SELECT * FROM `".TABLE_PREFIX."translations_multilingual` WHERE `id_language` =1 AND `key` = $str";
 		
 		$data = $db->fetchAll($sql);
 		if(!empty($data))
 			return true;
 		else 
 			return false;	 
 	}

 	public static function translate($source,$target,$text)
 	{
 		$trans = new GoogleTranslate();
 		$result = $trans->translate($source, $target, $text);

 		return $result ;

		// $trans->setSource($source); // Translate from FR
		// $trans->setTarget($target); // Translate to NE
		// $trans->translate($text); // Text

		// $translationServiceClient = new TranslationServiceClient();
		// try {
		//     $contents = [];
		//     $targetLanguageCode = '';
		//     $formattedParent = $translationServiceClient->locationName('[PROJECT]', '[LOCATION]');
		//     $response = $translationServiceClient->translateText($contents, $targetLanguageCode, $formattedParent);
		// } finally {
		//     $translationServiceClient->close();
		// }

 	}

}