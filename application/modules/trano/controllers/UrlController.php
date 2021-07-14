<?php

class Trano_UrlController extends Application_AbstractController {

    public function init() {
        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('geturl', 'html');
        $ajaxContext->initContext();

        $this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/url/index.js', 'text/javascript');
    }

    public function indexAction() {
        $this->view->headTitle()->append('URL');
    }    

    public function geturlAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $aColumns = array(
            'u.id'
            ,'u.resource'
            ,'u.action'
            ,'um.url'
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
        
        /* Get default id_language value */
        $sWhere .= (trim($sWhere)!="") ? " AND (um.id_language= :id_language)" : " WHERE (um.id_language= :id_language)" ;

        // /* Get default id_language value */
        $sWhereParams[":id_language"] = DEFAULT_LANG_ID ;

        /*
         * SQL queries
         * Get data to display
         */
        $sQuery = "
            SELECT 
                SQL_CALC_FOUND_ROWS u.id
                ,u.resource
                ,u.action
                ,um.url
            FROM " . TABLE_PREFIX . "url u
            INNER JOIN " . TABLE_PREFIX . "url_multilingual um ON (um.id_url = u.id)
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
                $row[] = $item['resource'];
                $row[] = $item['action'];
                $row[] = $item['url'];

                $url_edit = $this->view->baseUrl() . '/url/modify/do/edit/id/' . $id;

                $row[] = Application_Class_Forms::actions($url_edit,"url",$item["id"]) ;

                $output['aaData'][] = $row;
            }
        }

        echo json_encode($output);
    }

    public function modifyAction()
    {
        $this->view->headTitle()->append('Modify URL');

        $languages = Application_Model_Language::getLanguages();

        $this->view->do = $do = $this->view->escape($this->_getParam('do'));
        $url = array();
        $this->view->id = NULL;

        switch ($do) {
            case 'edit':
                $id = (int) $this->_getParam('id');
                $this->view->id = $id;
                $where = " id=$id ";
                $this->view->url = $url = Application_Model_Url::getUrlMultilingualById($id);

                if ($_POST) {
                    $id = (int) $_POST['Url']['id'];

                    // 1. update waiza_categories
                    $data_url = array(
                        'resource' => $_POST['Url']['resource']
                        ,'action' => $_POST['Url']['action']
                    );
                    Application_Model_Global::pupdate(TABLE_PREFIX . 'url', $data_url, " id=:id ",array(":id" => $id));

                    // 2. update waiza_categories_multilingual
                    if (!empty($languages)) {
                        foreach ($languages as $k => $item) {
                            $url = Application_Class_Utils::idml($_POST['Url'], 'url_' . $item['abbreviation'], $_POST['Url']['url_' . DEFAULT_LANG_ABBR]);

                            $id_language = $item['id'];

                            $is_exist_id_language = Application_Model_Global::pselectRow(TABLE_PREFIX . 'url_multilingual', 'id', " id_url=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
                            if (!$is_exist_id_language['id']) {
                                $data_url_multilingual = array(
                                    'id_url' => $id
                                    , 'id_language' => $id_language
                                    , 'url' => $url
                                );
                                Application_Model_Global::insert(TABLE_PREFIX . 'url_multilingual', $data_url_multilingual);
                            } 
                            else 
                            {
                                $data_url_multilingual = array(
                                     'url' => $url
                                );
                                Application_Model_Global::pupdate(TABLE_PREFIX . 'url_multilingual', $data_url_multilingual, " id_url=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
                            }
                            
                        }
                    }

                    $this->_redirect('/url');
                }

                break;

            case 'add':

                if ($_POST) {

                    // 1. insert in waiza_categories
                     $data_url = array(
                        'resource' => $_POST['Url']['resource']
                        ,'action' => $_POST['Url']['action']
                    );

                    Application_Model_Global::insert(TABLE_PREFIX . 'url', $data_url);
                    $lastId = Application_Model_Global::lastId();

                    // 2. insert waiza_categories_multilingual
                    if (!empty($languages)) {
                        foreach ($languages as $k => $item) {
                            $url = $_POST['Url']['url_' . $item['abbreviation']];

                            $data_url_multinlingual = array(
                                'id_url' => $lastId
                                , 'id_language' => $item['id']
                                , 'url' => $url
                            );
                            Application_Model_Global::insert(TABLE_PREFIX . 'url_multilingual', $data_url_multinlingual);
                        }
                    }

                    $this->_redirect('/url');
                }

                break;

            default:
                break;
        }

        $this->view->url = $url;
    }
}