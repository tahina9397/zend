<?php

class Trano_ContactsController extends Application_AbstractController {

    public function init() {
        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('getcontacts', 'html');
        $ajaxContext->initContext();

        $this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/contacts/index.js', 'text/javascript');
    }

    public function indexAction() {
        $this->view->headTitle()->append('Contacts');
    }    

    public function getcontactsAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $aColumns = array(
            'c.id'
            ,'c.name'
            ,'c.email'
            ,'c.message'
            ,'c.create_time'
        );

        /*
         * Paging
         */
        $sLimit = "";
        if (isset($_GET['iDisplayStart']) && $_GET['iDisplayLength'] != '-1') {
            $sLimit = "LIMIT " . intval($_GET['iDisplayStart']) . ", " . intval($_GET['iDisplayLength']);
        }

        /*
         * Ordering
         */
        $sOrder = "";
        if (isset($_GET['iSortCol_0'])) {
            $sOrder = "ORDER BY  ";
            for ($i = 0; $i < intval($_GET['iSortingCols']); $i++) {
                if ($_GET['bSortable_' . intval($_GET['iSortCol_' . $i])] == "true") {
                    $sOrder .= $aColumns[intval($_GET['iSortCol_' . $i])] . " " . ($_GET['sSortDir_0'] === 'asc' ? 'ASC' : 'DESC') . ", ";
                }
            }

            $sOrder = substr_replace($sOrder, "", -2);
            if ($sOrder == "ORDER BY") {
                $sOrder = "";
            }
        }

        $sOrder .= (trim($sOrder)!="") ? $sOrder : " ORDER BY c.create_time DESC" ;

        /*
         * Filtering
         */
        $sWhere = "";
        $sWhereParams = array();
        if (isset($_GET['sSearch']) && $_GET['sSearch'] != "") {
            $like1 = $_GET['sSearch'] ;
            $sWhere = "WHERE (";
            for ( $i=0 ; $i<count($aColumns) ; $i++ )
            {
                $sWhere .= $aColumns[$i]." LIKE :like1 OR ";
            }

            $sWhereParams[":like1"] = "%".$like1."%";
        
            $sWhere = substr_replace($sWhere, "", -3);
            $sWhere .= ')';
        }

        /* Individual column filtering */
        for ( $i=0 ; $i<count($aColumns) ; $i++ )
        {
            if ( isset($_GET['bSearchable_'.$i]) && $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' )
            {
                if ( $sWhere == "" )
                {
                    $sWhere = "WHERE ";
                }
                else
                {
                    $sWhere .= " AND ";
                }

                $sWhere .= $aColumns[$i]." LIKE :like2_$i ";
                $sWhereParams[":like2_$i"] = "%".$_GET['sSearch_' . $i]."%" ;
            }
        }
        
        /*
         * SQL queries
         * Get data to display
         */
        $sQuery = "
            SELECT 
                SQL_CALC_FOUND_ROWS c.id
                ,c.name
                ,c.email
                ,c.message
                ,IF(c.create_time='0000-00-00 00:00:00' OR c.create_time IS NULL, '', DATE_FORMAT(c.create_time,'%d %b %Y %Hh %imn')) AS create_time
            FROM " . TABLE_PREFIX . "contacts c
            $sWhere
            $sOrder
            $sLimit
        ";

        $rResult        = Application_Model_Global::pquery($sQuery,$sWhereParams);
        $total          = Application_Model_Global::pquery("SELECT FOUND_ROWS()",array());
        $iFilteredTotal = $total[0]['FOUND_ROWS()'];
        $iTotal = $total[0]['FOUND_ROWS()'];

        /*
         * Output
         */
        $output = array(
            "sEcho" => intval($_GET['sEcho']),
            "iTotalRecords" => $iTotal,
            "iTotalDisplayRecords" => $iFilteredTotal,
            "aaData" => array()
        );

        if (!empty($rResult)) {
            foreach ($rResult as $k => $item) {
                $row = array();
                $id = $item['id'];

                $row[] = '<input type="checkbox" class="styled" value="'.$item['id'].'" name="checked[]" />';
                $row[] = $item['name'];
                $row[] = $item['email'];
                $row[] = $item['message'];
                $row[] = $item['create_time'];


                $actions = '<ul class="table-controls acenter">';
                $actions .= '<li><a title="" class="tip btn delete" data-resource_id="'.$item["id"].'" data-resource_type="contacts" style="cursor: pointer" data-original-title="Supprimer"><i class="icon-trash"></i></a> </li>';
                $actions .= '</ul>';

                $row[] = $actions ;

                $output['aaData'][] = $row;
            }
        }

        echo json_encode($output);
    }
}