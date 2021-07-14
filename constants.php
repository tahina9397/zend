<?php 
// themes/plugins/upload/ckeditor paths
define('THEMES_PATH', ROOT_PATH . '/public/themes/');
define('THEMES_ADMIN_PATH', THEMES_PATH . 'admin/');
define('THEMES_DEFAULT_PATH', THEMES_PATH . 'default/');
define('THEMES_TRANO_PATH', THEMES_PATH . 'trano/');
define('THEMES_LOGIN_PATH', THEMES_PATH . 'login/');
define('THEMES_ERROR_PATH', THEMES_PATH . 'error/');
define('THEMES_COMINGSOON_PATH', THEMES_PATH . 'comingsoon/');
define('PLUGINS_PATH', ROOT_PATH . '/public/plugins/');
define('UPLOAD_PATH', ROOT_PATH . '/public/upload/');
define('CKEDITOR_PATH', ROOT_PATH . '/public/ckeditor/');
define('TEMPLATES_ADMIN_PATH',ROOT_PATH . '/application/modules/admin/views/scripts/');
define('TEMPLATES_TRANO_PATH',ROOT_PATH . '/application/modules/trano/views/scripts/');
define('JSON_PATH', ROOT_PATH . '/json/');

if ($_SERVER['SERVER_ADDR'] == '127.0.0.1'){
	define('BASE_URL', 'http://'.$_SERVER['SERVER_NAME']);
}
else{
	define('BASE_URL', 'https://'.$_SERVER['SERVER_NAME']);
}

define('THEMES_URL', BASE_URL . '/public/themes/');
define('THEMES_ADMIN_URL', THEMES_URL . 'admin/');
define('THEMES_DEFAULT_URL', THEMES_URL . 'default/');
define('THEMES_TRANO_URL', THEMES_URL . 'trano/');
define('THEMES_LOGIN_URL', THEMES_URL . 'login/');
define('THEMES_ERROR_URL', THEMES_URL . 'error/');
define('THEMES_COMINGSOON_URL', THEMES_URL . 'comingsoon/');
define('PLUGINS_URL', BASE_URL . '/public/plugins/');
define('UPLOAD_URL', BASE_URL . '/public/upload/');
define('RELATIVE_UPLOAD_URL', '/public/upload/');
define('CKEDITOR_URL', BASE_URL . '/public/ckeditor/');

// table prefix
define('TABLE_PREFIX', 'na_');