<?php
use YoHang88\LetterAvatar\LetterAvatar;
use Intervention\Image\ImageManagerStatic as Image;

class Application_Model_Member { 
 	
 	const NAMESPACE_DEFAULT = 'membres';
 	protected $_namespace;
    
	public function __construct($namespace = self::NAMESPACE_DEFAULT)
	{
	    $this->_namespace  = $namespace;
	}

 	public function isConnected()
 	{ 
 		$storage = new Zend_Auth_Storage_Session($this->_namespace);
 		if(empty($storage->read()))
 			return false;

 		if($storage != NULL && (int)$storage->read()->id)
 			return true;
 		return false;	  	 
 	} 

 	public function logout(){
 		$storage = new Zend_Auth_Storage_Session($this->_namespace);
 		$storage->clear();
 	}

 	public function getData(){
 		$storage = new Zend_Auth_Storage_Session($this->_namespace);
 		return $storage->read();
 	}

 	public function getStorage(){
 		return new Zend_Auth_Storage_Session($this->_namespace);
 	}

 	public function getId(){
 		$storage = new Zend_Auth_Storage_Session($this->_namespace);
 		$data = $storage->read();
 		if($data)
 			return (int)$data->id;
 		return 0;
 	}

 	public function getMemberByToken($token){
 		return Application_Model_Global::pselectRow(TABLE_PREFIX."membres", 'id', " token=:token ",array(":token" => $token));
 	}

 	public function getMemberByCode($code){
 		return Application_Model_Global::pselectRow(TABLE_PREFIX."membres", 'id', " code=:code ",array(":code" => $code));
 	}

 	public function activate($id_member){
 		return Application_Model_Global::pupdate(TABLE_PREFIX."membres", array("activate"=>1), " id=:id_member ",array(":id_member" => $id_member));
 	}

 	public function get($id_member){
 		$sql = "
 			SELECT 
				c.*
			FROM " . TABLE_PREFIX . "membres c
			WHERE c.id=:id_member 
		";

		$query = Application_Model_Global::pqueryRow($sql,array(":id_member" => $id_member));

 		return $query ;
 	}

 	public function getProfilePicture($id_member){
 		$sql = "
 			SELECT
 				m.*
 			FROM ".TABLE_PREFIX."membres m 
 			WHERE m.id = :id_member
 		" ;

		$member = Application_Model_Global::pqueryRow($sql,array(":id_member" => $id_member));

		$get_membres_categories = Application_Model_Global::pselectRow(TABLE_PREFIX."membres_categories","id_type_membre,id_sous_type_membre","id_membre=:id_member",array(":id_member" => $id_member));

		if (!empty($get_membres_categories)) {
			$member["id_type_membre"] = $get_membres_categories["id_type_membre"] ;
			$member["id_sous_type_membre"] = $get_membres_categories["id_sous_type_membre"] ;
		}

		if ($member["privilege"] == "commercial") {
			$commercial = Application_Model_Global::pselectRow(TABLE_PREFIX."commerciaux_details","login","id_member=:id_member",array(":id_member" => $id_member));
			$member["login"] = $commercial["login"] ;
		}

 		$profile_picture_path = THEMES_DEFAULT_PATH."upload/images/profile/".$member["profile_picture"];
 		$profile_avatar_path  = THEMES_DEFAULT_PATH."upload/images/profile/".$member["profile_avatar"];

 		if ($member["privilege"] == "admin") {
 			if(file_exists($profile_picture_path) && is_file($profile_picture_path)){
 				$member["profile_picture"] = THEMES_DEFAULT_URL."upload/images/profile/".$member["profile_picture"];
 			}elseif(file_exists($profile_avatar_path) && is_file($profile_avatar_path)){
 				$member["profile_picture"] = THEMES_DEFAULT_URL."upload/images/profile/".$member["profile_avatar"];
 			}
 		}
 		else{
 			$member["profile_picture"] = Zend_registry::get("option")->site->name.THEMES_DEFAULT_URL."images/default.png" ;
 		}
 		

 		return $member;
 	}
}