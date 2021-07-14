<?php
class Application_Class_Cronvisits {

	private $actions;

	public function __construct(){
		$this->actions =  array('stats_visits');
	}

    /**
     * Launch cron job
     *
     * @param $date
     */
    public function processCron($date)
    {
        $year = date("Y", strtotime($date));
        $month =  date("m", strtotime($date));

		$this->compileMonth($year, $month);
		$this->compileYear($year);

		$query = "OPTIMIZE TABLE ".TABLE_PREFIX."visits_daily";
		Application_Model_Global::pexecute($query,array());   
    }
	
    /**
     * Compile 1 month
     *
     * @param $year int
     * @param $month int
     */
    private function compileMonth($year, $month) 
    {
		$query = "INSERT INTO ".TABLE_PREFIX."visits_monthly (date, ".implode(', ',$this->actions).", updated) SELECT '".$year."-".$month."-01', ";
		foreach($this->actions as $action){
			$query .= " @cnt".$action." := SUM(D.".$action."), ";
		}

		$query .= " '".date("Y-m-d H:i:s")."' FROM ".TABLE_PREFIX."visits_daily D WHERE D.date LIKE '".$year."-".$month."-%' ON DUPLICATE KEY UPDATE ";
			
		foreach($this->actions as $action){
			$query .= " `".$action."`=@cnt".$action.", ";
		}
		
		$query .= " `updated`='".date("Y-m-d H:i:s")."' ";
		Application_Model_Global::pexecute($query,array());
    }

    /**
     * Compile 1 year
     *
     * @param $year int
     * @return array
     */
    private function compileYear($year) 
    {

		$query = "INSERT INTO ".TABLE_PREFIX."visits_annual (date, ".implode(', ',$this->actions).", updated) SELECT '".$year."-01-01', ";
		foreach($this->actions as $action){
			$query .= " @cnt".$action." := SUM(D.".$action."), ";
		}

		$query .= " '".date("Y-m-d H:i:s")."' FROM ".TABLE_PREFIX."visits_monthly D WHERE D.date LIKE '".$year."-%' ON DUPLICATE KEY UPDATE ";
			
		foreach($this->actions as $action){
			$query .= " `".$action."`=@cnt".$action.", ";
		}
		
		$query .= " `updated`='".date("Y-m-d H:i:s")."' ";
		Application_Model_Global::pexecute($query,array());
    }

    /**
     * Add daily visit
     * @param $type string
     * @param $date string
     */
    public function addVisitDaily($type, $date)
    {
		$query = "INSERT INTO ".TABLE_PREFIX."visits_daily (date, ".$type.", updated) VALUES ('".date("Y-m-d",strtotime($date))."',1,'".date("Y-m-d H:i:s")."')";
		$query .= " ON DUPLICATE KEY UPDATE ".$type."=".$type."+1, updated='".date("Y-m-d H:i:s")."'";
		Application_Model_Global::pexecute($query,array());
    }

    /**
     * Increment monthly visit
     * @param $type string
     * @param $date string
     */
    public function incrementVisitMonthly($type, $date)
    {
		$query = "INSERT INTO ".TABLE_PREFIX."visits_monthly (date, ".$type.", updated) VALUES ('".date("Y-m-d",strtotime($date))."',1,'".date("Y-m-d H:i:s")."')";
		$query .= " ON DUPLICATE KEY UPDATE ".$type."=".$type."+1, updated='".date("Y-m-d H:i:s")."'";
		Application_Model_Global::pexecute($query,array());
    }

    /**
     * Increment annually visit
     * @param $type string
     * @param $date string
     */
    public function incrementVisitAnnually($type, $date)
    {
		$query = "INSERT INTO ".TABLE_PREFIX."visits_annual (date, ".$type.", updated) VALUES ('".date("Y-m-d",strtotime($date))."',1,'".date("Y-m-d H:i:s")."')";
		$query .= " ON DUPLICATE KEY UPDATE ".$type."=".$type."+1, updated='".date("Y-m-d H:i:s")."'";
		Application_Model_Global::pexecute($query,array());
    }
}