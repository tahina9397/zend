<?php

class Trano_SeoController extends Application_AbstractController {

    public function init() {
        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('getseo', 'html');
        $ajaxContext->addActionContext('deleteseo', 'html');
        $ajaxContext->addActionContext('massdeleteseo', 'html');
        $ajaxContext->initContext();

        $this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/seo/index.js', 'text/javascript');
    }

    public function indexAction() {
        $this->view->headTitle()->append('SEO');
    }    

    public function getseoAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $aColumns = array(
            's.id'
            ,'s.page'
            , 'sm.seo_title'
            , 'sm.seo_meta_description'
            , 'sm.seo_meta_keyword'
            , 'sm.seo_h1'
            , 'sm.seo_h2'
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
        $sWhere .= (trim($sWhere)!="") ? " AND (sm.id_language= :id_language)" : " WHERE (sm.id_language= :id_language)" ;

        // /* Get default id_language value */
        $sWhereParams[":id_language"] = DEFAULT_LANG_ID ;
        
        /*
         * SQL queries
         * Get data to display
         */
        $sQuery = "
            SELECT 
                SQL_CALC_FOUND_ROWS s.id
                ,s.page
                ,sm.seo_title
                ,sm.seo_meta_description
                ,sm.seo_meta_keyword
                ,sm.seo_h1
                ,sm.seo_h2
            FROM " . TABLE_PREFIX . "seo s
            LEFT JOIN " . TABLE_PREFIX . "seo_multilingual sm ON s.id=sm.id_seo
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

                //$row[0] = '<input type="checkbox" class="styled" value="'.$item['id'].'" name="checked[]" />';
                $id = $item['id'];

                $row[] = $id;
                $row[] = $item['page'];
                $row[] = $item['seo_title'];
                $row[] = $item['seo_meta_description'];
                $row[] = $item['seo_meta_keyword'];

                $url_edit = $this->view->baseUrl() . '/seo/modifyseo/do/edit/id/' . $id;

                $row[] = Application_Class_Forms::actions($url_edit,"seo",$item["id"]) ;

                $output['aaData'][] = $row;
            }
        }

        echo json_encode($output);
    }

    public function modifyseoAction()
    {
        $this->view->headTitle()->append('Modify SEO');

        global $params;
        global $siteconfig;
        $languages = Application_Model_Language::getLanguages();

        $this->view->do = $do = $this->view->escape($this->_getParam('do'));
        $seo = array();
        $this->view->id = NULL;

        switch ($do) {
            case 'edit':
                $id = (int) $this->_getParam('id');
                $this->view->id = $id;
                $where = " id=$id ";
                $this->view->seo = $seo = Application_Model_Seo::getSeoMultilingualById($id);

                if ($_POST) {
                    $id = (int) $_POST['Seo']['id'];

                    // 1. update waiza_categories
                    $data_seo = array(
                        'page' => $_POST['Seo']['page']
                        ,'page_notes' => $_POST['Seo']['page_notes']
                    );
                    Application_Model_Global::pupdate(TABLE_PREFIX . 'seo', $data_seo, " id=:id ",array(":id" => $id));

                    // 2. update waiza_categories_multilingual
                    if (!empty($languages)) {
                        foreach ($languages as $k => $item) {
                            $seo_title = Application_Class_Utils::idml($_POST['Seo'], 'seo_title_' . $item['abbreviation'], $_POST['Seo']['seo_title_' . DEFAULT_LANG_ABBR]);
                            $seo_meta_description = Application_Class_Utils::idml($_POST['Seo'], 'seo_meta_description_' . $item['abbreviation'], $_POST['Seo']['seo_meta_description_' . DEFAULT_LANG_ABBR]);
                            $seo_meta_keyword = Application_Class_Utils::idml($_POST['Seo'], 'seo_meta_keyword_' . $item['abbreviation'], $_POST['Seo']['seo_meta_keyword_' . DEFAULT_LANG_ABBR]);
                            $seo_h1 = Application_Class_Utils::idml($_POST['Seo'], 'seo_h1_' . $item['abbreviation'], $_POST['Seo']['seo_h1_' . DEFAULT_LANG_ABBR]);
                            $seo_h2 = Application_Class_Utils::idml($_POST['Seo'], 'seo_h2_' . $item['abbreviation'], $_POST['Seo']['seo_h2_' . DEFAULT_LANG_ABBR]);
                            

                            $id_language = $item['id'];

                            $is_exist_id_language = Application_Model_Global::pselectRow(TABLE_PREFIX . 'seo_multilingual', 'id', " id_seo=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
                            if (!$is_exist_id_language['id']) {
                                $data_seo_multilingual = array(
                                    'id_seo' => $id
                                    , 'id_language' => $id_language
                                    , 'seo_title' => $seo_title
                                    , 'seo_meta_description' => $seo_meta_description
                                    , 'seo_meta_keyword' => $seo_meta_keyword
                                    , 'seo_h1' => $seo_h1
                                    , 'seo_h2' => $seo_h2
                                );
                                Application_Model_Global::insert(TABLE_PREFIX . 'seo_multilingual', $data_seo_multilingual);
                            } 
                            else 
                            {
                                $data_seo_multilingual = array(
                                     'seo_title' => $seo_title
                                    , 'seo_meta_description' => $seo_meta_description
                                    , 'seo_meta_keyword' => $seo_meta_keyword
                                    , 'seo_h1' => $seo_h1
                                    , 'seo_h2' => $seo_h2
                                );
                                Application_Model_Global::pupdate(TABLE_PREFIX . 'seo_multilingual', $data_seo_multilingual, " id_seo=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
                            }
                            
                        }
                    }

                    // $this->_redirect('/seo/modifyseo/do/edit/id/'.$id);
                    $this->_redirect('/seo');
                }

                break;

            case 'add':

                if ($_POST) {

                    // 1. insert in waiza_categories
                     $data_seo = array(
                        'page' => $_POST['Seo']['page']
                        ,'page_notes' => $_POST['Seo']['page_notes']
                    );

                    Application_Model_Global::insert(TABLE_PREFIX . 'seo', $data_seo);
                    $lastId = Application_Model_Global::lastId();

                    // 2. insert waiza_categories_multilingual
                    if (!empty($languages)) {
                        foreach ($languages as $k => $item) {
                            $seo_title = $_POST['Seo']['seo_title_' . $item['abbreviation']];
                            $seo_meta_description = $_POST['Seo']['seo_meta_description_' . $item['abbreviation']];
                            $seo_meta_keyword = $_POST['Seo']['seo_meta_keyword_' . $item['abbreviation']];
                            $seo_h1 = $_POST['Seo']['seo_h1_' . $item['abbreviation']];
                            $seo_h2 = $_POST['Seo']['seo_h2_' . $item['abbreviation']];

                            $data_seo_multinlingual = array(
                                'id_seo' => $lastId
                                , 'id_language' => $item['id']
                                , 'seo_title' => $seo_title
                                , 'seo_meta_description' => $seo_meta_description
                                , 'seo_meta_keyword' => $seo_meta_keyword
                                , 'seo_h1' => $seo_h1
                                , 'seo_h2' => $seo_h2
                            );
                            Application_Model_Global::insert(TABLE_PREFIX . 'seo_multilingual', $data_seo_multinlingual);
                        }
                    }

                    $this->_redirect('/seo');
                }

                break;

            default:
                break;
        }

        $this->view->seo = $seo;
    }

    public function browseAction()
    {
        $this->_helper->layout->disableLayout();
        $this->view->medias = $medias = Application_Model_Media::getAll();

        $this->view->id_item = $id_item = $this->_getParam("item_id");
        $this->view->id_media = $id_media = $this->_getParam("id_media");
        $this->view->social = $social = $this->_getParam("social");
    }

    public function addcoverAction()
    {
        $this->_helper->layout->disableLayout(); 
        $this->_helper->viewRenderer->setNoRender();

        $id_media = (int)$this->_getParam("media_id");
        if($id_media){
            $id_item = (int)$this->_getParam("id_item");
            $social = $this->_getParam("social");

            Application_Model_Seo::addCover($id_item,$id_media,$social);
        }
    }

    public function getphotoinfosAction()
    {
        $this->_helper->layout->disableLayout(); 
        $this->_helper->viewRenderer->setNoRender();

        $media_id = (int)$this->_getParam("id");

        if($media_id){
            echo Zend_Json::encode($this->view->partial("seo/sidebar/media_metas.phtml", array("media_id"=>$media_id)));
        }       
    }
}