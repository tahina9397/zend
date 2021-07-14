<?php
class Application_Model_Lots { 

	public static function getLotsByIdProduct($id_product){
		$sql = "SELECT * FROM ".TABLE_PREFIX."products_lots WHERE id_product = :id_product ORDER BY create_time DESC " ;
		$gets = Application_Model_Global::pquery($sql,array(":id_product" => $id_product));

		$tabs = array();

		if(!empty($gets)){
			foreach ($gets as $k =>  $get) {
				$file_path = UPLOAD_PATH . "files/lots/" . $get['filename'];	
				if(file_exists($file_path) && is_file($file_path)){
					$tabs[$k]["filename"] = $get["title"];
					$tabs[$k]["path"] = UPLOAD_URL . "files/lots/" . $get["filename"];
				}	
			}
		}

		return $tabs;
	}
}