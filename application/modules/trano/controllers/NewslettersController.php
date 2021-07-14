<?php

class Trano_NewslettersController extends Application_AbstractController {

    public function init() {
        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('getnewsletters', 'html');
        $ajaxContext->initContext();

        $this->view->inlineScript()->prependFile(THEMES_TRANO_URL . 'scripts/newsletters/index.js', 'text/javascript');
    }

    public function indexAction() {
        $this->view->headTitle()->append('Newsletter');
    }    

    public function getnewslettersAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $aColumns = array(
            'n.id'
            ,'n.email'
            ,'l.title'
            ,'n.statut'
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

        $sOrder .= (trim($sOrder)!="") ? $sOrder : " ORDER BY n.create_time DESC" ;

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
                SQL_CALC_FOUND_ROWS n.id
                ,l.title
                ,n.email
                ,n.statut
            FROM " . TABLE_PREFIX . "newsletters n
            LEFT JOIN ".TABLE_PREFIX."languages l ON (l.id = n.id_language)
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
                $row[] = $item['email'];
                $row[] = $item['title'];

                /*hidden*/
                $abonne = ($item['statut'] == 1 ) ? 'selected' : '' ;
                $non_abonne = ($item['statut'] == 0 ) ? 'selected' : '' ;

                $statut = "" ;
                $statut .= "<select class='styled' name='' id='statut' data-resource_id=".$item['id']." data-resource_type='newsletters' style='width:100px'>" ;
                $statut .= "<option value='1' ".$abonne.">Abonné</option>" ;
                $statut .= "<option value='0' ".$non_abonne.">Desabonné</option>" ;
                $statut .= "</select>" ;  

                $row[] = $statut ;

                $actions = '<ul class="table-controls acenter">';
                $actions .= '<li><a title="" class="tip btn delete" data-resource_id="'.$item["id"].'" data-resource_type="contacts" style="cursor: pointer" data-original-title="Supprimer"><i class="icon-trash"></i></a> </li>';
                $actions .= '</ul>';

                $actions = '<ul class="table-controls acenter">';
                $actions .= '<li><a title="" class="tip btn delete" data-resource_id="'.$item["id"].'" data-resource_type="newsletters" style="cursor: pointer" data-original-title="Supprimer"><i class="icon-trash"></i></a> </li>';
                $actions .= '</ul>'; 

                $row[] = $actions ;

                $output['aaData'][] = $row;
            }
        }

        echo json_encode($output);
    }

    public function templateAction() {
        $this->view->headTitle()->append('Template');

        $languages = Application_Model_Language::getLanguages();

        $template = array();
        $template = Application_Model_Multilingual::byid(TABLE_PREFIX."template", TABLE_PREFIX."template_multilingual", 'id', 'id_template', 1, 'tm.text', false); 

        if($_POST){ 
            /*
             * 2 steps :
             * 1. update Application_template
             * 2. update Application_template_multilingual
             */

            $id = (int)$_POST['Template']['id'];

            // 1. update Application_template
            $data_template = array(
                'update_time' => date('Y-m-d H:i:s')
            );
            Application_Model_Global::pupdate(TABLE_PREFIX.'template', $data_template, " id=:id ",array(":id" => $id));

            // 2. update Application_template_multilingual
            if(!empty($languages)){ 
                foreach ($languages as $k => $item) {
                    $text                 = $_POST['Template']['text_'.$item['abbreviation']];
                    $id_language = $item['id'];

                    $is_exist_id_language = Application_Model_Global::pselectRow(TABLE_PREFIX.'template_multilingual', 'id', " id_template=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
                    if(!$is_exist_id_language['id']){
                        $data_template_multilingual = array(
                            'id_template'               => $id
                            ,'id_language'          => $id_language
                            ,'text'                => $text
                        );

                        Application_Model_Global::insert(TABLE_PREFIX.'template_multilingual', $data_template_multilingual);
                    }else{
                        $data_template_multilingual = array(
                            'text'                 => $text
                        );

                        Application_Model_Global::pupdate(TABLE_PREFIX.'template_multilingual', $data_template_multilingual, " id_template=:id AND id_language=:id_language ",array(":id" => $id,":id_language" => $id_language));
                    }
                }
            }

            $this->_redirect('/newsletters/template');
        } 

        $this->view->template = $template;  
    }    

    public function sendnewsletterAction()
    {
        $this->_helper->layout->disableLayout(); 
        $this->_helper->viewRenderer->setNoRender();

        $getnl = Application_Model_Global::pselect(TABLE_PREFIX."newsletters","id,id_language,email","statut=1",array()) ;

        if (!empty($getnl)) {
            $chunked_nl = array_chunk($getnl,60) ;

            foreach ($chunked_nl as $k1 =>  $tab1) {
                foreach ($tab1 as $k2 => $t) {
                    $id_language = $t['id_language'] ;

                    $data_email=array(
                        "custom_content" => true
                        ,"phtml"     => "subscribe_newsletter.phtml"
                        ,"from"     => Zend_Registry::get('option')->get('company_email')
                        ,"to"       => $t['email']
                        // ,"addbcc"   => Zend_Registry::get('option')->get('admin_email')
                        ,"subject"  => $this->view->translate("Newsletter - Taxibrousse")
                    );

                    if (Application_Class_Email::send($data_email)) {
                        echo Zend_Json::encode(array("state" => "success","email" => $t["email"] )) ;
                    }
                    else{
                        echo Zend_Json::encode(array("state" => "error","email" => $t["email"] )) ;
                    }
                }
                sleep(50) ;
            }
        }
    }
}
