<?php

class Application_Model_Visit {
 	
 	public static function getYearsMonths()
 	{
 		global $db;
 		
 		$sql = "
 		SELECT DISTINCT YEAR(date) AS annee, MONTH(date) AS mois 
 		FROM ".TABLE_PREFIX."visits_daily
 		";

 		$data = $db->fetchAll($sql);

 		$d = array();
 		if(!empty($data)){
 			foreach ($data as $k => $item) {
 				$temp = array();
 				$temp["name"] = $name = ucfirst(Application_Class_Date::numberToMonth($item["mois"]))." ".$item["annee"];
 				$temp["date"] = $date = $item["annee"]."-".sprintf("%02d", $item["mois"]);

 				if(date("Y")==$item["annee"] && date("m")==$item["mois"]){
 					$d["current_year_month_value"] = $item["annee"]."-".sprintf("%02d", $item["mois"]); 
 					$temp["current_year_month"] = 1;
 				}else{
 					$temp["current_year_month"] = 0;
 				}

 				$d["data"][] = $temp;
 			}
 		}
 		return $d;   	 
 	}

 	public static function getYears()
 	{
 		global $db;
 		
 		$sql = "
 		SELECT DISTINCT YEAR(date) AS annee 
 		FROM ".TABLE_PREFIX."visits_monthly
 		";

 		$data = $db->fetchAll($sql);

 		$d = array();
 		if(!empty($data)){
 			foreach ($data as $k => $item) {
 				$temp = array();
 				$temp["date"] = $date = $item["annee"];

 				if(date("Y")==$item["annee"]){
 					$d["current_year_value"] = $item["annee"]; 
 					$temp["current_year"] = 1;
 				}else{
 					$temp["current_year"] = 0;
 				}

 				$d["data"][] = $temp;
 			}
 		}
 		return $d; 		
 	}

 	public static function getDailyVisits($year_month)
 	{
 		global $db;
 		
 		$sql = "
 		SELECT *, DAY(date) as jour
 		FROM ".TABLE_PREFIX."visits_daily
 		WHERE date LIKE '$year_month-%'
 		ORDER BY date ASC
 		";

 		$data = $db->fetchAll($sql);
 		return $data;
 	}

 	public static function getMonthlyVisits($year)
 	{
 		global $db;
 		
 		$sql = "
 		SELECT *, MONTH(date) as mois, YEAR(date) as annee
 		FROM ".TABLE_PREFIX."visits_monthly
 		WHERE date LIKE '$year-%'
 		ORDER BY date ASC
 		";

 		$data = $db->fetchAll($sql);

 		if(!empty($data)){
 			foreach ($data as $k => $item) {
 				$data[$k]["mois_nom"] = ucfirst(Application_Class_Date::numberToMonth($item["mois"]))." ".$item["annee"];
 			}
 		}

 		return $data; 		
 	}

 	public static function getAnnualVisits()
 	{
 		global $db;

 		$sql = "
 		SELECT *, YEAR(date) as annee
 		FROM ".TABLE_PREFIX."visits_annual
 		WHERE 1
 		ORDER BY date ASC
 		";

 		$data = $db->fetchAll($sql);
 		return $data;
 	}

 	public static function getTotalVisits()
 	{
 		$sql = "
 			SELECT SUM(stats_visits) AS total_visit
 			FROM ".TABLE_PREFIX."visits_annual
 			WHERE 1
 		";
 		$stat = Application_Model_Global::pqueryRow($sql,array());

 		if($stat){
 			return (int)$stat["total_visit"];
 		}
 		return "100";
 	}

 	public static function getLastUpdate()
 	{
 		global $db;
 		$sql = "
 		SELECT date 
 		FROM ".TABLE_PREFIX."visits_daily
 		WHERE 1
 		ORDER BY date DESC 
 		LIMIT 1
 		";
 		$data = $db->fetchRow($sql);
 		if($data){
 			$date = $data["date"];
 			$date_arr = explode("-", $date);

 			return $date_arr[2]." / ".$date_arr[1]." / ".$date_arr[0];
 		}else{
 			return date("d / m / Y");
 		}
 	}

 	public static function getvisitbydaterange($date_start, $date_end)
 	{
 		global $db;
 		$sql = "
 		SELECT SUM(stats_visits) AS nbr_visit 
 		FROM ".TABLE_PREFIX."visits_daily 
 		WHERE date>='$date_start' AND date<='$date_end'
 		";
 		$data = $db->fetchRow($sql);
 		if(isset($data) && $data["nbr_visit"]!=NULL){
 			return $data["nbr_visit"];
 		}else{
 			return 0;
 		}
 	}
}