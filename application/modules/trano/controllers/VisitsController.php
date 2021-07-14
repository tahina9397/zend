<?php

class Trano_VisitsController extends Application_AbstractController
{
	public function init()
	{}

	public function indexAction()
	{ 
		$this->view->headTitle()->append('Statistiques des visites');
		$this->view->inlineScript()->appendFile(THEMES_TRANO_URL . 'scripts/visits/index.js', 'text/javascript');
	}

	public function dailycronAction()
	{
		$this->_helper->layout->disableLayout(); 
        $this->_helper->viewRenderer->setNoRender();

		$cron = new Application_Class_Cronvisits();
		$cron->processCron("2015-10-11");
	}

	public function getajaxdailyvisitsAction()
	{
		$this->_helper->layout->disableLayout();   
		$this->_helper->viewRenderer->setNoRender();

		$year_month = $this->_getParam("year_month");
		if($year_month){

			$return = "";
			$daily_visits = Application_Model_Visit::getDailyVisits($year_month);

			if(!empty($daily_visits)){
			    foreach ($daily_visits as $k => $dv) {
					$return .= '
				        <tr>
				            <td>'.$dv["jour"].'</td>
				            <td>'.$dv["stats_visits"].'</td>
				        </tr>
				    ';
			    }
			}else{
				$return .= '<tr><td style="text-align:center" colspan="2">'.$this->view->translate("Aucune statistique").'</td></td>';
			}
			echo $return;
		}
	}

	public function getajaxmonthlyvisitsAction()
	{
		$this->_helper->layout->disableLayout();   
		$this->_helper->viewRenderer->setNoRender();

		$year = $this->_getParam("year");
		if($year){
			
			$return = "";
			$monthly_visits = Application_Model_Visit::getMonthlyVisits($year);

			if(!empty($monthly_visits)){
			    foreach ($monthly_visits as $k => $mv) {
					$return .= '
				        <tr>
				            <td>'.$mv["mois_nom"].'</td>
				            <td>'.$mv["stats_visits"].'</td>
				        </tr>
			        ';
			    }
			}else{
				$return .= '<tr><td style="text-align:center" colspan="2">'.$this->view->translate("Aucune statistique").'</td></td>';
			}
			echo $return;
		}
	}
}