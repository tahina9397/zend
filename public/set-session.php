<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

define('FACEBOOK_SDK_V4_SRC_DIR', __DIR__.'/src/Facebook/');
require_once(__DIR__.'/src/Facebook/autoload.php');

header('Content-Type: application/json');

if ( isset($_GET['accessToken']) && !empty($_GET['accessToken']) ) {

        $accessToken = $_GET['accessToken'];
        
        $fb = new Facebook\Facebook([
            'app_id' => '986024141451023',
            'app_secret' => 'e54a93527f72d753be71a7ba914dcfd3',
            'default_graph_version' => 'v2.8'
        ]);
        $fb->setDefaultAccessToken($accessToken);

        try {

            $profile_request = $fb->get('/me');
            $profile = $profile_request->getGraphNode()->asArray();

            $_SESSION['fb-user-token'] = $accessToken;
            $_SESSION['fb-user']       = $profile;

            echo 
                json_encode( 
                    array(
                        'id'    => $profile['id'],
 	                     'name' => $profile['name'],
                    ), JSON_PRETTY_PRINT
                );

        } catch (FacebookApiException $e) {
            error_log($e);
	    }

} else {
   header('HTTP/1.1 400');
}