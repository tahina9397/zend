<?php
use Intervention\Image\ImageManagerStatic as Image;

class Application_Model_Logos { 

	public static function getUrlById($id, $size_name = "source"){
		global $db;
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id,filename", " id=:id ",array(":id" => $id));

		$media_url = null;
		if($media){
			$media_path = UPLOAD_PATH . "images/logos/" . $media['filename'];	
			if(file_exists($media_path) && is_file($media_path)){
				$filename = $media['filename'];
				if($size_name!="source"){
					$filename = str_replace("-source", "-".$size_name, $media['filename']);
				}
				$media_url = UPLOAD_URL . "images/logos/" . $filename;
			}	
		}

		return $media_url;
	}
	
	public static function unlink($id){
		$settings = Zend_Registry::get('settings');
		$sizes = $settings['posts']['upload']['sizes'];
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id,filename", " id=:id ",array(":id" => $id));
		
		$filename = $media['filename'];
		$media_path = $media_path_orig = UPLOAD_PATH . "images/logos/" . $filename;
		
		foreach($sizes as $sizename => $item){
			$media_path = str_replace("-source","-".$sizename, $media_path_orig);
			if(file_exists($media_path) && is_file($media_path)){
				@unlink($media_path);
			}
		}
		
		return true;
	}

	public static function getMediaData($id, $size_name = "source"){
		global $db;
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id,filename", " id=:id ",array(":id" => $id));

		$media_data = array();
		if($media){
			$media_path = UPLOAD_PATH . "images/logos/" . $media['filename'];
			if(file_exists($media_path) && is_file($media_path)){
				$Image = Image::make($media_path);

				$media_data["exif"]     = $Image->exif();
				$media_data["height"]   = $Image->height();
				$media_data["width"]    = $Image->width();
				$media_data["filesize"] = self::formatBytes($Image->filesize());
			}
		}

		return $media_data;
	}

	public static function getMediaWidth($id, $size_name = "source"){
		global $db;
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id,filename", " id=:id ",array(":id" => $id));

		if($media){
			$filename = $media['filename'];
			if($size_name!="source"){
				$filename = str_replace("-source", "-".$size_name, $media['filename']);
			}
			$media_path = UPLOAD_PATH . "images/logos/" . $filename;
			if(file_exists($media_path) && is_file($media_path)){
				return Image::make($media_path)->width();
			}
		}

		return null;
	}

	public static function getMediaHeight($id, $size_name = "source"){
		global $db;
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id,filename", " id=:id ",array(":id" => $id));

		if($media){
			$filename = $media['filename'];
			if($size_name!="source"){
				$filename = str_replace("-source", "-".$size_name, $media['filename']);
			}
			$media_path = UPLOAD_PATH . "images/logos/" . $filename;
			if(file_exists($media_path) && is_file($media_path)){
				return Image::make($media_path)->height();
			}
		}

		return null;
	}

	public static function getMediaExtension($id){
		global $db;
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id,filename", " id=:id ",array(":id" => $id));

		if($media){
			$media_path = UPLOAD_PATH . "images/logos/" . $media['filename'];
			if(file_exists($media_path) && is_file($media_path)){
				$path_parts = pathinfo($media_path);
				return $path_parts['extension'];
			}
		}

		return null;		
	}

	public static function formatBytes($size,$level=0,$precision=2,$base=1024) 
    {
        $unit = array('B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB','YB');
        $times = floor(log($size,$base));
        return sprintf("%.".$precision."f",$size/pow($base,($times+$level)))." ".$unit[$times+$level];
    }

 	public static function getMultilingualById($id){ 
 		global $db;

		$t  = TABLE_PREFIX."medias";
		$tm = TABLE_PREFIX."medias_multilingual";

		$t_data = array() ;

		if ($id) {
			$sql_t = "SELECT * FROM $t WHERE id=$id";
			$t_data = $db->fetchRow($sql_t);

			$sql_tm = " 
				SELECT 
					t.*
					,tm.id_language
					,tm.title
					,tm.alt
					,tm.caption
					,tm.description
				FROM $t t
				JOIN $tm tm ON t.id=tm.id_media
				WHERE t.id=$id
			";

			$tm_data = $db->fetchAll($sql_tm);
			$multilingual_key = array('title', 'alt', 'caption', 'description');

			if(!empty($tm_data)){ 
				foreach ($tm_data as $k => $item) {
					$abbr = Application_Model_Language::getAbbr($item['id_language']);

					foreach ($item as $key => $value) {
						if(in_array($key, $multilingual_key)):
							$t_data[$key.'_'.$abbr] = $value;
						else:
							$t_data[$key] = $value;
						endif;
					}
				} 
			}
		}
 		
 		return $t_data;			 
 	}

 	public static function getAll($id_language = DEFAULT_LANG_ID)
 	{
 		$sql = "
 			SELECT m.id AS media_id, m.filename, m.id_user, m.create_time, m.update_time, mm.title, mm.caption, mm.alt, mm.description, CONCAT (u.first_name, ' ',u.last_name) AS media_author, DATE(m.create_time) AS create_date
 			FROM ".TABLE_PREFIX."medias m
 			LEFT JOIN ".TABLE_PREFIX."medias_multilingual mm ON (m.id=mm.id_media AND mm.id_language=$id_language)
 			LEFT JOIN ".TABLE_PREFIX."users u ON (u.id=m.id_user) 
 			WHERE 1 AND m.resource_type IS NULL
 		";
 		return Application_Model_Global::pquery($sql,array());
 	}

 	public static function get($id, $id_language = DEFAULT_LANG_ID)
 	{
 		$sql = "
 			SELECT m.id AS media_id, m.filename, m.id_user, m.create_time, m.update_time, mm.title, mm.caption, mm.alt, mm.description, CONCAT (u.first_name, ' ',u.last_name) AS media_author, DATE(m.create_time) AS create_date
 			FROM ".TABLE_PREFIX."medias m
 			LEFT JOIN ".TABLE_PREFIX."medias_multilingual mm ON (m.id=mm.id_media AND mm.id_language=$id_language)
 			LEFT JOIN ".TABLE_PREFIX."users u ON (u.id=m.id_user) 
 			WHERE m.id=:id
 		";
 		return Application_Model_Global::pqueryRow($sql,array(":id" => $id)); 		
 	}

 	public static function addCover($data)
 	{
 		if(is_array($data)){
 			$id_media = $data["id_media"];
 			$module = $data["module"];
 			$id_item = $data["id_item"];
 			$where = " module=:module AND id_item=:id_item ";

 			$is_exist = Application_Model_Global::pselectRow(TABLE_PREFIX."medias_metas", "id", $where,array(":module" => $module,":id_item" => $id_item));
 			if(isset($is_exist) && (int)$is_exist['id']){
 				$id = (int)$is_exist['id'];
 				Application_Model_Global::pupdate(TABLE_PREFIX."medias_metas", array("id_media"=>$id_media), " id=:id ",array(":id" => $id));
 			}else{
 				Application_Model_Global::insert(TABLE_PREFIX."medias_metas", $data);
 			}
 		}
 	}

 	public static function getCover($module, $id_item, $size_name = "source")
 	{
 		$where = " module=:module AND id_item=:id_item ";
 		$cover = Application_Model_Global::pselectRow(TABLE_PREFIX."medias_metas", "id,id_media", $where,array(":module" => $module,":id_item" => $id_item));

		if(isset($cover) && (int)$cover['id']){
			$id_media = (int)$cover['id_media'];
			return self::getUrlById($id_media, $size_name);
		}else{
			return false;
		}
 	}

 	public static function getVideoCover($module, $id_item)
 	{
 		$where = " module=:module AND id_item=:id_item ";
 		$cover = Application_Model_Global::pselectRow(TABLE_PREFIX."medias_metas", "id,id_media", $where,array(":module" => $module,":id_item" => $id_item));

		if(isset($cover) && (int)$cover['id']){
			$id_media = (int)$cover['id_media'];
			$get = Application_Model_Global::pselectRow(TABLE_PREFIX.'medias','filename','id=:id_media',array(":id_media" => $id_media));
			return $get['filename'] ;
		}else{
			return false;
		}
 	}

 	public static function getCoverIdMedia($module, $id_item)
 	{
 		$where = " module=:module AND id_item=:id_item ";
 		$cover = Application_Model_Global::pselectRow(TABLE_PREFIX."medias_metas", "id,id_media", $where,array(":module" => $module,":id_item" => $id_item));

		if(isset($cover) && (int)$cover['id']){
			return (int)$cover['id_media'];
		}else{
			return false;
		} 		
 	}

 	public static function deleteCover($data)
 	{
 		if(is_array($data)){
 			$module = $data["module"];
 			$id_item = $data["id_item"];
 			$type = $data["type"];
 			$where = " module='$module' AND id_item=:id_item AND type=:type ";

 			Application_Model_Global::pdelete(TABLE_PREFIX."medias_metas", $where,array(":id_item"=>$id_item,":type"=>$type));
 			return true;
 		} 		
 	}
	
	public static function addMedia($data)
	{
		if(!is_array($data)){
			return;
		}
		
		$languages = Application_Model_Language::getLanguages();
		
		// 1. insert in edm_medias
        $data_medias = array(
            'id_user' => $data['id_user']
            ,'resource_type' => (!empty($data["resource_type"])) ? $data["resource_type"] : NULL
            ,'filename' => $data['filename']
            ,'create_time' => ($data["create_time"]) ? $data["create_time"] : date('Y-m-d H:i:s')
            ,'update_time' => ($data["update_time"]) ? $data["update_time"] : date('Y-m-d H:i:s')
        );
        Application_Model_Global::insert(TABLE_PREFIX . "medias", $data_medias);
        $lastId = Application_Model_Global::lastId();

        // 2. insert in edm_medias_multilingual
        if (!empty($languages)) {
            foreach ($languages as $key => $language) {
                $data_medias_multilingual = array(
                    'id_media' => $lastId
                    ,'id_language' => $language['id']
                    ,'title' => (!empty($data['title'])) ? $data['title'] : null
                    ,'caption' => $data['caption']
                    ,'alt' => $data['alt']
                    ,'description' => $data['description']
                );
                Application_Model_Global::insert(TABLE_PREFIX . "medias_multilingual", $data_medias_multilingual);
            }
        }
		
		return $lastId;
	}
	
	public static function getLastMedia()
	{
		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "id", " 1 ORDER BY create_time DESC ",array());
		$id_media = (int)$media["id"];
		return self::getUrlById($id_media, "large");
	}

	public static function fileExists($path)
    {
        $i = 1; 
        $probeer = $path;

        while(file_exists($path)) {
            $punt = strrpos($path,".");
            if(substr($path,($punt-3),1)!==("(") && substr($path,($punt-1),1)!==(")")) {
                $path = substr($path,0,$punt)."(".$i.")".substr($path,($punt),strlen($path)-$punt);
                
            } else {
                $path=substr($path,0,($punt-3))."(".$i.")".substr($path,($punt),strlen($path)-$punt);
            }
            $i++;
        }

     	if ($path) {
            $t = explode("/", $path) ;
            return end($t) ;
        }
    }

 	public static function getImageByResourceTypeAndResourceId($resource_type,$resource_id, $size_name = "source")
 	{
 		$where = "resource_type=:resource_type AND resource_id=:resource_id";
 		$medias = Application_Model_Global::pselect(TABLE_PREFIX."medias", "id,filename", $where,array(":resource_type" => $resource_type,":resource_id" => $resource_id));

 		$media = array();

 		if(!empty($medias)){
 			foreach ($medias as $k => $item) {
 				$media_path = UPLOAD_PATH . "/images/logos/" . $item['filename'];	

 				if(file_exists($media_path) && is_file($media_path)){
 					$filename = $item['filename'];
 					if($size_name != "source"){
 						$filename = str_replace("-source", "-".$size_name, $item['filename']);
 					}
 					$media[$k]["id"] = $item["id"] ;
 					$media[$k]["url"] = UPLOAD_URL . "/images/logos/" . $filename;
 				}	
 			}
 		}

		return $media;
 	}

 	public static function getImageById($id_media, $size_name = "source")
 	{
 		$where = "id=:id_media";
 		$media = Application_Model_Global::pselectRow(TABLE_PREFIX."medias", "filename", $where,array(":id_media" => $id_media));

 		$media_url = NULL ;

 		if(!empty($media)){
			$media_path = UPLOAD_PATH . "/images/logos/" . $media['filename'];	
			if(file_exists($media_path) && is_file($media_path)){
				$filename = $media['filename'];
				if($size_name != "source"){
					$filename = str_replace("-source", "-".$size_name, $media['filename']);
				}
				$media_url = UPLOAD_URL . "/images/logos/" . $filename;
			}	
 		}

		return $media_url;
 	}
}