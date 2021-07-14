<?php
class Application_Model_Access{
	public static function hasChildren($id){
		$sql = "SELECT id FROM ".TABLE_PREFIX."admin_menu WHERE id_parent=:id";
        $data = Application_Model_Global::pquery($sql,array(":id"=>$id));

        if(!empty($data))
        	return true;
        else
        	return false;
	}
	
	public static function getNumberChildren($id, $id_type_user){
		$sql = "
		SELECT AM.id 
		FROM ".TABLE_PREFIX."admin_menu AM
		INNER JOIN ".TABLE_PREFIX."users_menu_access USA ON (USA.id_admin_menu=AM.id AND USA.id_type_user=:id_type_user)
		WHERE AM.id_parent=:id
		";
        $data = Application_Model_Global::pquery($sql,array(":id"=>$id, ":id_type_user"=>$id_type_user));

        return sizeof($data);
	}

	public static function getChildren($id){
		$sql = "SELECT * FROM ".TABLE_PREFIX."admin_menu WHERE id_parent=:id ORDER BY order_item ASC";
        $data = Application_Model_Global::pquery($sql,array(":id"=>$id));
        return $data;
	}

	public static function getMenuAccessConnectedUser(){
		$User = new Application_Model_User("admin");
	    $data = $User->getData();
        $access = array();

        $id = $data->id;
        if($id){
        	$sql = "SELECT id_type_user FROM ".TABLE_PREFIX."users WHERE id=:id";
        	$data = Application_Model_Global::pqueryRow($sql,array(":id"=>$id));

        	$id_type_user = $data['id_type_user'];
        }
		
        $access = Application_Model_Access::getMenuAccessByTypeUser($id_type_user);
		
        return $access;
	}

	public static function getMenuAccessByTypeUser($id_type_user){
		$sql = "SELECT * FROM ".TABLE_PREFIX."users_menu_access WHERE id_type_user=:id_type_user";

        $data = Application_Model_Global::pquery($sql,array(":id_type_user"=>$id_type_user));
        $res = array();
        if(!empty($data)){
        	foreach ($data as $item) {
        		$res[] = $item['id_admin_menu'];
        	}
        }

        return $res;
	}

	public static function getDroitAccessByIdUser($id_user){
		$sql = "SELECT * FROM ".TABLE_PREFIX."users_droit_access WHERE id_user=:id_user";

        $data = Application_Model_Global::pquery($sql,array(":id_user"=>$id_user));
        $res = array();
        if(!empty($data)){
        	foreach ($data as $item) {
        		$res[] = $item['id_droit'];
        	}
        }

        return $res;
	}
	
	public static function isAllowedMenu(){
		$front = Zend_Controller_Front::getInstance();
    	$request = $front->getRequest();
		$module   = $request->getModuleName();
    	$controller = $request->getControllerName();
    	$action = $request->getActionName();
		$User = new Application_Model_User("admin");
	    $data = $User->getData();
		$id_type_user = $data->id_type_user;
		
		$access = Application_Model_Access::getMenuAccessByTypeUser($id_type_user);
		$id_admin_menu = Application_Model_Access::getIdAdminMenuByController($controller);
		if (in_array($id_admin_menu,$access)){
			return true;
		}else{
			return false;
		}
	}
	
	public static function getMenu(){
		$sql = "SELECT * FROM ".TABLE_PREFIX."admin_menu WHERE id_parent=0 ORDER BY order_item ASC";
		$data = Application_Model_Global::pquery($sql,array());
		return $data;

	}
	
	public static function getIdAdminMenuByController($controller){
		$sql = "SELECT id FROM ".TABLE_PREFIX."admin_menu WHERE controller=:controller";

        $data = Application_Model_Global::pqueryRow($sql,array(":controller"=>$controller));
		return $data['id'];

	}

	public static function getUserToNotify($id_droit,$exclude = array())
	{
		$where = "WHERE uda.id_droit = :id_droit " ;
		$inner = "" ;

		if ($id_droit == 6 || $id_droit == 9 ) {
			$inner .= "INNER JOIN ".TABLE_PREFIX."users u ON(u.id = uda.id_user) " ;
			$where .= " AND u.id_type_user = 2 " ;
		}

		if(!empty($exclude )){
		    $where .= " AND uda.id_user NOT IN(".$exclude.") ";
		}

		$sql = "
		    SELECT 
		        uda.id_user
		    FROM ".TABLE_PREFIX."users_droit_access uda
		    $inner
		    $where
		";

        $res = Application_Model_Global::pquery($sql,array(":id_droit"=>$id_droit));

        return $res ;
	}
}