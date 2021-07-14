<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected $_docRoot;
    private $_option;

    protected function _initPath() {
        $this->_docRoot = realpath(APPLICATION_PATH . '/../');
        Zend_Registry::set('docRoot', $this->_docRoot);
    }

    protected function _initLoaderResource() {
        $resourceLoader = new Zend_Loader_Autoloader_Resource(array(
            'basePath' => $this->_docRoot . '/application',
            'namespace' => 'Application'
        ));

        $resourceLoader->addResourceTypes(array(
            'model' => array(
                'namespace' => 'Model',
                'path' => 'models'
            )
        ));
        $resourceLoader->addResourceTypes(array(
            'forms' => array(
                'namespace' => 'Form',
                'path' => 'forms'
            )
        ));
        $resourceLoader->addResourceTypes(array(
            'class' => array(
                'namespace' => 'Class',
                'path' => 'classes'
            )
        ));
        $resourceLoader->addResourceTypes(array(
            'plugin' => array(
                'namespace' => 'Plugin',
                'path' => 'plugins'
            )
        ));
    }

    protected function _initView() {
        $view = new Zend_View();

        $view->addHelperPath(
                APPLICATION_PATH . "/../library/Application/View/Helper", "Application_View_Helper"
        );

        $view->addHelperPath(
                APPLICATION_PATH . "/../library/ZendX/JQuery/View/Helper", "ZendX_JQuery_View_Helper"
        );

        $view->addHelperPath(
                APPLICATION_PATH . "/../library/Langs/View/Helper", "Langs_View_Helper"
        );

        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->setView($view);

        return $view;
    }

    protected function _initSetupBaseUrl() {
        $this->bootstrap('frontcontroller');
        $controller = Zend_Controller_Front::getInstance();

        // if( !Application_Class_Utils::contains('admin', $_SERVER['REQUEST_URI']) ){
        $lang = Application_Class_Utils::getCurrentLang();
        if ($lang != DEFAULT_LANG_ABBR) {
            $controller->setBaseUrl('/' . $lang);
            Zend_Registry::set("baseUrl", '/' . $lang);
        } else {
            Zend_Registry::set("baseUrl", '');
        }
        // }
    }

    protected function _initRoutes() {
        $this->bootstrap('FrontController');
        $this->_frontController = $this->getResource('FrontController');

        $router = $this->_frontController->getRouter();
        $controller = Zend_Controller_Front::getInstance();

        $lang = Application_Class_Utils::getCurrentLang();

        $langRoute = new Zend_Controller_Router_Route(
                ':lang/', array(
            'lang' => $lang
                ), array(
            'lang' => '[a-z]{0,2}'
                )
        );

        if($_SERVER['SERVER_NAME'] == "aroama.rapiera.local" || $_SERVER['SERVER_NAME'] == "aroama.rapiera.com"){
            $defaultRoute = new Zend_Controller_Router_Route(
                ':controller/:action/*',
                array(
                    'module'     => 'default',
                    'controller' => 'index',
                    'action'     => 'index'
                )
            );

            $defaultRoute = $langRoute->chain($defaultRoute);

            $router->addRoute('langRoute', $langRoute);
            $router->addRoute('defaultRoute', $defaultRoute);

            /*custom route*/
            /*ABOUT US*/
            $about_url = Application_Class_Url::getUrl("pages","about") ;

            $aboutRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "about"
                ,"formatted_link" => $about_url[0]["url"]
            )) ;

            $aboutRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "about"
                ,"formatted_link" => $about_url[1]["url"]
            )) ;

            /*END ABOUT US*/

            /*QUALITE*/
            $quality_url = Application_Class_Url::getUrl("pages","quality") ;

            $qualityRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "quality"
                ,"formatted_link" => $quality_url[0]["url"]
            )) ;

            $qualityRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "quality"
                ,"formatted_link" => $quality_url[1]["url"]
            )) ;
            /*END QUALITY*/

            /*APPROACH*/
            $approach_url = Application_Class_Url::getUrl("pages","approach") ;

            $approachRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "approach"
                ,"formatted_link" => $approach_url[0]["url"]
            )) ;

            $approachRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "approach"
                ,"formatted_link" => $approach_url[1]["url"]
            )) ;
            /*END APPROACH*/

            /*FARM*/
            $farm_url = Application_Class_Url::getUrl("pages","farm") ;

            $farmRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "farm"
                ,"formatted_link" => $farm_url[0]["url"]
            )) ;

            $farmRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "farm"
                ,"formatted_link" => $farm_url[1]["url"]
            )) ;
            /*END FARM*/

            /*PRODUCTS*/
            $products_url = Application_Class_Url::getUrl("products","all") ;

            $allProductsRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "products"
                ,"action" => "all"
                ,"formatted_link" => $products_url[0]["url"]
            )) ;

            $allProductsRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "products"
                ,"action" => "all"
                ,"formatted_link" => $products_url[1]["url"]
            )) ;

            $productsRouteFR = new Zend_Controller_Router_Route_Regex(
                'produits/([-\w]+)',
                array(
                    'module'      => 'default'
                    ,'controller' => 'products'
                    ,'action'     => 'index'
                ),
                array(
                    1 => 'category_permalink'
                ),
                'produits/%s'
            );

            $productsRouteEN = new Zend_Controller_Router_Route_Regex(
                'products/([-\w]+)',
                array(
                    'module'      => 'default'
                    ,'controller' => 'products'
                    ,'action'     => 'index'
                ),
                array(
                    1 => 'category_permalink'
                ),
                'products/%s'
            );
            /*end PRODUCTS*/

            /*PRODUCT*/
            $productRouteFR = new Zend_Controller_Router_Route_Regex(
                'produits/([-\w]+)/([-\w]+)',
                array(
                    'module'      => 'default'
                    ,'controller' => 'products'
                    ,'action'     => 'fiche'
                ),
                array(
                    1 => 'category_permalink'
                    ,2 => 'permalink'
                ),
                'produits/%s/%s'
            );

            $productRouteEN = new Zend_Controller_Router_Route_Regex(
                'products/([-\w]+)/([-\w]+)',
                array(
                    'module'      => 'default'
                    ,'controller' => 'products'
                    ,'action'     => 'fiche'
                ),
                array(
                    1 => 'category_permalink'
                    ,2 => 'permalink'
                ),
                'products/%s/%s'
            );
            /*end product*/


            /*NEWS*/
            $news_url = Application_Class_Url::getUrl("news","index") ;

            $newsRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "news"
                ,"action" => "index"
                ,"formatted_link" => $news_url[0]["url"]
            )) ;

            $newsRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "news"
                ,"action" => "index"
                ,"formatted_link" => $news_url[1]["url"]
            )) ;
            /*END NEWS*/

            /*NEWS*/
            $newsFicheRouteFR = new Zend_Controller_Router_Route_Regex(
                $news_url[0]["url"].'/([-\w]+)',
                array(
                    'module'      => 'default'
                    ,'controller' => 'news'
                    ,'action'     => 'fiche'
                ),
                array(
                    1 => 'permalink'
                ),
                $news_url[0]["url"].'/%s'
            );

            $newsFicheRouteEN = new Zend_Controller_Router_Route_Regex(
                $news_url[1]["url"].'/([-\w]+)',
                array(
                    'module'      => 'default'
                    ,'controller' => 'news'
                    ,'action'     => 'fiche'
                ),
                array(
                    1 => 'permalink'
                ),
                $news_url[1]["url"].'/%s'
            );
            /*END NEWS*/

            $notice_url = Application_Class_Url::getUrl("pages","legalnotice") ;

            $legalNoticeRouteFR = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "legalnotice"
                ,"formatted_link" => $notice_url[0]["url"]
            )) ;

            $legalNoticeRouteEN = Application_Class_Url::getBootstrapUrl(array(
                "module" => "default"
                ,"controller" => "pages"
                ,"action" => "legalnotice"
                ,"formatted_link" => $notice_url[1]["url"]
            )) ;

            switch ($lang) {
                case 'en':
                        $aboutRoute = $aboutRouteEN ;
                        $qualityRoute = $qualityRouteEN ;
                        $approachRoute = $approachRouteEN ;
                        $farmRoute = $farmRouteEN ;
                        $newsRoute = $newsRouteEN ;
                        $newsFicheRoute = $newsFicheRouteEN ;

                        $allProductsRoute = $allProductsRouteEN ;
                        $productsRoute = $productsRouteEN ;
                        $productRoute = $productRouteEN ;

                        $legalNoticeRoute = $legalNoticeRouteEN ;
                    break;
                
                default:
                        $aboutRoute = $aboutRouteFR ;
                        $qualityRoute = $qualityRouteFR ;
                        $approachRoute = $approachRouteFR ;
                        $farmRoute = $farmRouteFR ;
                        $newsRoute = $newsRouteFR ;
                        $newsFicheRoute = $newsFicheRouteFR ;

                        $allProductsRoute = $allProductsRouteFR ;
                        $productsRoute = $productsRouteFR ;
                        $productRoute = $productRouteFR ;

                        $legalNoticeRoute = $legalNoticeRouteFR ;
                    break;
            }

            $router->addRoute('aboutRoute', $aboutRoute);
            $router->addRoute('qualityRoute', $qualityRoute);
            $router->addRoute('approachRoute', $approachRoute);
            $router->addRoute('farmRoute', $farmRoute);
            $router->addRoute('newsRoute', $newsRoute);
            $router->addRoute('newsFicheRoute', $newsFicheRoute);
            $router->addRoute('allProductsRoute', $allProductsRoute);
            $router->addRoute('productsRoute', $productsRoute);
            $router->addRoute('productRoute', $productRoute);
            $router->addRoute('legalNoticeRoute', $legalNoticeRoute);
        }
        else if(Application_Class_String::contains('trano', $_SERVER['SERVER_NAME']) OR $_SERVER['SERVER_NAME'] == "trano.vuejs.pc") {
            $tranoRoute = new Zend_Controller_Router_Route(
                ':controller/:action/*', array(
                    'module' => 'trano',
                    'controller' => 'index',
                    'action' => 'index'
                )
            );

            $router->addRoute('tranoRoute', $tranoRoute);
        }
        else if(Application_Class_String::contains('api', $_SERVER['SERVER_NAME']) OR $_SERVER['SERVER_NAME'] == "api.vuejs.pc") {
            $apiRoute = new Zend_Controller_Router_Route(
                ':controller/:action/*', array(
                    'module' => 'api',
                    'controller' => 'index',
                    'action' => 'index'
                )
            );

            $router->addRoute('apiRoute', $apiRoute);
        }


        $this->_frontController->registerPlugin(new Application_Controller_Plugin_Language());
        // $this->_frontController->registerPlugin(new Application_Controller_Plugin_Compress());
    }

    protected function _initConfig() {
        $Options = new Application_Model_Options();

        try {
            $options = $Options->getAllOptions();
        } catch (Zend_Exception $e) {
            echo 'ERROR: Options cannot be loaded. Make sure your database has been imported. If you wish to run installer again please remove config.php file.<br />';
            echo $e->getMessage();
            die;
        }

        $zend_options = array();
        $option = new Zend_Config(array_merge($options, $zend_options), true);

        Zend_Registry::set('option', $option);
        $this->_option = $option;

        return;
    }

    protected function _initAutoload() {
        $controller = Zend_Controller_Front::getInstance();

        // load hooks
        $controller->registerPlugin(new Application_Plugin_Hooks());
    }

    protected function _initVisits() {
        $uri = $_SERVER["REQUEST_URI"];
        if (Application_Class_Utils::contains($uri, "/default")) {

            $ip = $_SERVER["REMOTE_ADDR"];
            $user_agent = $_SERVER["HTTP_USER_AGENT"];

            $today = date("Y-m-d");
            $sql = "SELECT id FROM " . TABLE_PREFIX . "visits_ips WHERE ip_address=:ip AND date=:today ";
            $visited = Application_Model_Global::pqueryRow($sql, array(":ip" => $ip, ":today" => $today));

            if (!$visited) {
                $data_in = array(
                    'ip_address' => $ip
                    , 'user_agent' => $user_agent
                    , 'date' => date('Y-m-d')
                    , 'create_time' => date('Y-m-d H:i:s')
                );
                Application_Model_Global::insert(TABLE_PREFIX . "visits_ips", $data_in);

                $Cronvisits = new Application_Class_Cronvisits();
                $Cronvisits->addVisitDaily("stats_visits", $today);
                $Cronvisits->incrementVisitMonthly("stats_visits", date("Y-m-01"));
                $Cronvisits->incrementVisitAnnually("stats_visits", date("Y-01-01"));
            }
        }
    }
}
