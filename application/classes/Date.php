<?php
class Application_Class_Date {
	
	public static function age($naiss)  
	{
		list($jour, $mois, $annee) = split('-', $naiss);
		$today['mois'] = date('n');
		$today['jour'] = date('j');
		$today['annee'] = date('Y');
		$annees = $today['annee'] - $annee;
		
		if ($today['mois'] <= $mois) {
			if ($mois == $today['mois']) {
				if ($jour > $today['jour'])
					$annees--;
			}
			else
				$annees--;
		}
		return $annees;
	}	
	
	// public static function ConvertToMysqlDate($date)
	// {
	// 	if (isset($date)){
	// 	$tDate=explode("/",$date);
	// 	return $dateUk=$tDate[2]."-".$tDate[1]."-".$tDate[0];
	// 	}else return "";
	// }

	public static function isDateMySqlFormat($date)
	{
	    if (preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/", $date))
	        return true;
	    else
	        return false;
	}

	public static function toLongFormatDate($date) {
	    if (isset($date)) {
	        $Date = explode(" ", $date);
	        $tDate = explode("-", $Date[0]);

	        $lang = DEFAULT_LANG_ABBR;
	        $months = array(
	            "fr" => array("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre")
	            , "en" => array("january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december")
	            , "mg" => array("janoary", "febroary", "martsa", "aprily", "may", "jona", "jolay", "aogositra", "septambra", "oktobra", "novambra", "desambra")
	        );
	        return $tDate[2] . " " . ucfirst($months[$lang][(int) $tDate[1] - 1]) . " " . $tDate[0];
	    } else
	        return "";
	}

	public static function convertFromDatepicker($date)
	{
		if (isset($date)){
			$tDate=explode("-",$date);
			$dateUk=$tDate[2]."-".$tDate[1]."-".$tDate[0];

			$sqlFormat = self::formatMonth($dateUk) ;

			return $sqlFormat ;
		}
		else return "";
	}

	public static function ConvertToMysqlDate($date)
	{
		if (isset($date)){
			$tDate=explode("/",$date);
			$dateUk=$tDate[2]."-".$tDate[1]."-".$tDate[0];

			$sqlFormat = self::formatMonth($dateUk) ;

			return $sqlFormat ;
		}
		else return "";
	}

	public static function ConvertToSlash($date)
	{
		if (isset($date)){
			$tDate=explode("-",$date);
			$dateSlash =$tDate[2]."-".$tDate[1]."-".$tDate[0];

			return $dateSlash ;
		}
		else return "";
	}

	public static function formatMonth($date)
	{
		$extract = explode("-", $date) ;

		if (strlen($extract[1]) <= 1) {
			$extract[1] = trim("0".$extract[1]) ;
		}

		$date = implode("-", $extract) ;

		return $date ;
	}

	public static function formatDay($date)
	{
		$extract = explode("-", $date) ;

		if (strlen($extract[2]) <= 1) {
			$extract[2] = trim("0".$extract[2]) ;
		}

		$date = implode("-", $extract) ;

		return $date ;
	}

	public static function format($date) {
	    if (isset($date)) {
	        $tDate = explode("/", $date);
	        $lang = DEFAULT_LANG_ABBR;
	        $months = array(
	            "fr" => array("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre")
	            , "en" => array("january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december")
	            , "po" => array("janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "outubro", "novembro", "dezembro")
	        );
	        return $tDate[0] . " " . ucfirst($months[$lang][(int) $tDate[1] - 1]) . " " . $tDate[2];
	    }
	    else
	        return "";
	}

	public static function formatfromMysql($date) {
	    if (isset($date)) {
	        $tDate = explode("-", $date);
	        $lang = DEFAULT_LANG_ABBR;
	        $months = array(
	            "fr" => array("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre")
	            , "en" => array("january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december")
	            , "mg" => array("janoary", "febroary", "martsa", "aprily", "may", "jiona", "jolay", "aogositra", "septambra", "oktobra", "novambra", "desambra")
	        );
	        return $tDate[2] . " " . ucfirst($months[$lang][(int) $tDate[1] - 1]) . " " . $tDate[0];
	    }
	    else
	        return "";
	}

	public static function time($time,$sec = true) {
	    if (isset($time)) {
	        $tTime = explode(":", $time);

	        $t1 = $tTime[0]."h".$tTime[1]."min" ;

	        if ($sec) {
	        	$t1 .= $tTime[2]."s" ;
	        }

	        return $t1 ;
	    }
	    else
	        return "";
	}

	public static function formatTime($datetime, $type = "en") {
	    if(isset($datetime)){
	    	$tr = Zend_Registry::get('Zend_Translate');

	    	$date_time = explode(" ", $datetime);
	    	$date = $date_time[0];
	    	$time = $date_time[1];

	    	if($type=="en"){
	    		$date_format = self::formatfromMysql($date);
	    	}elseif($type=="fr"){
				$date_format = self::format($date);
	    	}

	    	$time_format = self::time($time);
	    	return $date_format." ".$tr->translate("à")." ".$time_format;
	    }
	    return "";
	}

	public static function numberToMonth($number){
		$lang = DEFAULT_LANG_ABBR;
		$months = array(
		    "fr" => array("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre")
		    , "en" => array("january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december")
		    , "po" => array("janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "outubro", "novembro", "dezembro")
		);
		return $months[$lang][$number - 1];
	}

	public static function dateStr($date)
    {
        $t = explode(" ", $date);
        $date = self::formatfromMysql($t[0]);

        return $date;
    }

    public static function parse_date($date)
    { 
    	/*format : 12 NOV 2016 */
    	$t = date_parse($date);
	   	$mois = self::numberToMonth($t['month']);
	   	$t = trim($t['day']." ".$mois." ".$t['year']);

	   	return $t;
    }

     public static function getMonth($date)
    {
    	$d = strtotime($date) ;

    	return date("F",$d);
    }

    public static function monthToNumber($month_string)
    {
    	$date = date_parse($month_string);

    	return $date['month'] ;
    }

    public static function getDayAndDayAbbr()
    {
    	$lang = DEFAULT_LANG_ABBR;

		$days = array(
		    "fr" => array( 
		    	array("title" => "Lundi","abbr" => "mon") ,
		    	array("title" => "Mardi","abbr" => "tue") ,
		    	array("title" => "Mercredi","abbr" => "wed") ,
		    	array("title" => "Jeudi","abbr" => "thu") ,
		    	array("title" => "Vendredi","abbr" => "fri") ,
		    	array("title" => "Samedi","abbr" => "sat") ,
		    	array("title" => "Dimanche","abbr" => "sun")
		    )
		);

		return $days[$lang];
    }

    public function getDayByAbbr($abbr)
    {
    	$days = array( 
	    	"mon" => "Lundi"
	    	,"tue" => "Mardi"
	    	,"wed" => "Mercredi"
	    	,"thu" => "Jeudi"
	    	,"fri" => "Vendredi"
	    	,"sat" => "Samedi"
	    	,"sun" => "Dimanche"
    	);

    	return $days ;
    }

    public function checkDateFormat($date)
    {
		if (preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/",$date)) {
		    return true;
		} else {
		    return false;
		}
    }

    public function checkIfValidDate($input_date,$format="Y-m-d")
    {
    	$dt = new DateTime() ;

    	$date_obj = $dt::createFromFormat($format, $input_date);
    	return $date_obj && $date_obj->format($format) == $input_date;
    }

    public function jourdansmois($mois , $an)
    {
		$enmois = $an*12 + $mois; 
		if (($enmois > 2037 * 12 -1) || ($enmois<1970)){return 0;} 
		$an_suivant = floor(($enmois+1)/12); 
		$mois_suivant = $enmois + 1 - 12 * $an_suivant; 
		$duree=mktime(0, 0, 1, $mois_suivant, 1, $an_suivant)-mktime(0, 0, 1, 
		$mois, 1, $an);
		return ($duree/(3600*24)); 
	}

	public function getMonthAbbr($month_str)
	{	
		switch ($month_str) {
			case 'janvier':
			case 'january':
					$res[$month_str] = "JAN" ;
				break;

			case 'février':
			case 'february':
					$res[$month_str] = "FEB" ;
				break;

			case 'mars':
			case 'march':
					$res[$month_str] = "MAR" ;
				break;

			case 'avril':
			case 'april':
					$res[$month_str] = "APR" ;
				break;

			case 'mai':
			case 'may':
					$res[$month_str] = "MAY" ;
				break;

			case 'juin':
			case 'june':
					$res[$month_str] = "JUN" ;
				break;

			case 'juillet':
			case 'july':
					$res[$month_str] = "JUL" ;
				break;

			case 'août':
			case 'august':
					$res[$month_str] = "AUG" ;
				break;

			case 'septembre':
			case 'september':
					$res[$month_str] = "SEP" ;
				break;

			case 'octobre':
			case 'october':
					$res[$month_str] = "OCT" ;
				break;

			case 'novembre':
			case 'november':
					$res[$month_str] = "NOV" ;
				break;

			case 'décembre':
			case 'december':
					$res[$month_str] = "DEC" ;
				break;
			
			default:
				break;
		}
		
		return $res[$month_str] ;
	}

	public function getDateDiff($date1,$date2){
		$diff = abs(strtotime($date2) - strtotime($date1));

		$years = floor($diff / (365*60*60*24));
		$months = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));
		$days = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));

		return array(
			"years" => $years
			,"months" => $months
			,"days" => $days
		) ;
	}
}