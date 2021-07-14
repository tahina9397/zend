<?php
class Application_Class_Geo {
	static public function getLatitude($address){ 
	    $result  = Application_Class_Geo::geocoding($address);

	    if(!empty($result))
	        return Application_Class_Utils::idx($result, '2', '');
	    else
	        return '';

	}

	static public function getLongitude($address){ 
	    $result  = Application_Class_Geo::geocoding($address);

	    if(!empty($result))
	        return Application_Class_Utils::idx($result, '3', '');
	    else
	        return '';
	}

	static public function getCoords($address){ 
	    $result  = Application_Class_Geo::geocoding($address);

	    $latitude = Application_Class_Utils::idx($result, '2', '');
	    $longitude = Application_Class_Utils::idx($result, '3', '');

	    $return = array(
	        'latitude'   => $latitude
	        ,'longitude' => $longitude
	    );

	    return $return;
	}

	static public function distance($lat1, $lng1, $lat2, $lng2, $miles = true)
	{
	  $pi80 = M_PI / 180;
	  $lat1 *= $pi80;
	  $lng1 *= $pi80;
	  $lat2 *= $pi80;
	  $lng2 *= $pi80;
	   
	  $r = 6372.797; // mean radius of Earth in km
	  $dlat = $lat2 - $lat1;
	  $dlng = $lng2 - $lng1;
	  $a    = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlng / 2) * sin($dlng / 2);
	  $c    = 2 * atan2(sqrt($a), sqrt(1 - $a));
	  $km   = $r * $c;
	   
	  return ($miles ? ($km * 0.621371192) : $km);
	}

	static public function getContent($url) {
	    $curl = curl_init();
	    curl_setopt($curl, CURLOPT_TIMEOUT, 10);
	    curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5);
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
	    curl_setopt($curl, CURLOPT_URL, $url);
	    $data = curl_exec($curl);
	    curl_close($curl);
	    return $data;
	}

	static public function geocoding($address) {
	    $url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' . urlencode($address) . '&sensor=true';

	    if (function_exists('curl_init')) {
	        $data = Application_Class_Geo::getContent($url);
	    } else {
	        $data = file_get_contents($url);
	    }

	    $response = json_decode($data, TRUE);
	    $status   = $response['status'];

	    if ($status == 'OK') {
	        $return = array(
	            $status,
	            $response['results'][0]['types'],
	            $response['results'][0]['geometry']['location']['lat'],
	            $response['results'][0]['geometry']['location']['lng'],
	            $response['results'][0]['formatted_address'] 
	        ); // successful geocode, $status-$precision-$lat-$lng
	    } else {
	        // echo '<!-- geocoding : failure to geocode : ' . $status . " -->\n";
	        $return = NULL; // failure to geocode
	    }

	    return $return;
	}
}