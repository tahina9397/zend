<?php
if ($_SERVER['SERVER_ADDR'] == '127.0.0.1'){
	// local
	define('DB_HOST', 'localhost');
	define('DB_DATABASENAME', 'natoraly_aroma_db');
	define('DB_USERNAME', 'root');
	define('DB_PASSOWRD', 'root');
}else{
	define('DB_HOST', 'localhost');
	define('DB_DATABASENAME', 'marahi');
	define('DB_USERNAME', 'marahi@marahi.ra');
	define('DB_PASSOWRD', 'marahi.COM123');
}