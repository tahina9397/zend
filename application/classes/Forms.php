<?php
class Application_Class_Forms {
	
	public static function options($options, $echo = true)  
	{
		$return = '';
		$return .= '<option value="'.$options['default']['value'].'">'.$options['default']['title'].'</option>';
		    
	    if(!empty($options['options'])):
	        foreach ($options['options'] as $k => $item) {
	        	$selected = ($options['selected']!="" AND $options['selected']==$item['id']) ? 'selected="selected"' : '' ;
	            $return .= '<option '.$selected.' value="'.$item['id'].'">'.$item['title'].'</option>';
	        }
	    endif;

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;
	}	

	public static function optionsOrderItem($options, $echo = true)
	{ 
		$atend_value = Application_Model_Global::getMaxOrderItem($options['tablename']) + 1;

		$return = '';
		$return .= '<option value="">Ne pas changer</option>';
		$return .= '<option value="'.$options['atfirst']['value'].'">'.$options['atfirst']['title'].'</option>';
		$return .= '<option value="'.$atend_value.'">'.$options['atend']['title'].'</option>';
		$return .= '<optgroup label="'.$options['optgrouplabel'].'">';

		if(!empty($options['options'])):
			foreach ($options['options'] as $k => $item) {
			    $return .= '<option class="pl10" value="'.($item['order_item']+1).'">'.$item['title'].'</option>';
			}	
		endif;

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;
	}

	public static function optionsOrderItemImage($options, $echo = true)
	{ 
		$atend_value = Application_Model_Global::getMaxOrderItemImage($options['id_item'])+1;

		$return = '';
		$return .= '<option value="">Ne pas changer</option>';
		$return .= '<option value="'.$options['atfirst']['value'].'">'.$options['atfirst']['title'].'</option>';
		$return .= '<option value="'.$atend_value.'">'.$options['atend']['title'].'</option>';
		$return .= '<optgroup label="'.$options['optgrouplabel'].'">';

		if(!empty($options['options'])):
			foreach ($options['options'] as $k => $item) {
			    $return .= '<option class="pl10" value="'.($item['order_item']+1).'">'.$item['title'].'</option>';
			}	
		endif;

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;
	}

	public static function optionsOrderItemCategory($options, $echo = true)
	{
		if($options['id_category_group']) 
			$atend_value = Application_Model_Global::getMaxOrderItemCategory($options['tablename'], $options['id_category_group']) + 1;
		else
			$atend_value = Application_Model_Global::getMaxOrderItem($options['tablename']) + 1;

		$return = '';
		$return .= '<option value="">Ne pas changer</option>';
		$return .= '<option value="'.$options['atfirst']['value'].'">'.$options['atfirst']['title'].'</option>';
		$return .= '<option value="'.$atend_value.'">'.$options['atend']['title'].'</option>';
		$return .= '<optgroup label="'.$options['optgrouplabel'].'">';

		if(!empty($options['options'])):
			foreach ($options['options'] as $k => $item) {
			    $return .= '<option class="pl10" value="'.($item['order_item']+1).'">'.$item['title'].'</option>';
			}	
		endif;

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;
	}

	public static function optionsModulesGroups($options, $echo = true)
	{ 
		$return = '';

		$return .= '<option value="">Choose a group</option>';
		if(!empty($options['options'])):
			foreach ($options['options'] as $k => $item) {
			    $return .= '<optgroup label="'.$item['title'].'"></optgroup>';
			    if(!empty($item['categories_groups'])):
			    	foreach ($item['categories_groups'] as $key => $value) {
			    		$selected = ($options['selected']!="" AND $options['selected']==$value['id_category_group']) ? 'selected="selected"' : '' ;
			    		$return .= '<option class="pl10" '.$selected.' value="'.$value['id_category_group'].'">'.$value['title'].'</option>';
			    	}
			    endif;
			}
		endif;

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;                     
	}

	public static function textMultilingual($attributes, $echo = true)
	{ 
		$languages = Application_Model_Language::getLanguages();
	 	$return = '';

	 	if(!empty($attributes)){ 
	 		$classic = '';
	 		foreach ($attributes['classic'] as $key => $value) {
	 			$classic .=  ' '.$key.'="'.$value.'" ';	 		 		
	 		} 	 

	 		if(!empty($languages)){ 
	 		 	foreach ($languages as $k => $item) {
	 		 		$value = "";
	 		 		$display = ($k>0) ? 'display: none' : '' ;

	 		 		$name_abbr = $attributes['custom']['name']."_".$item['abbreviation'];
	 		 		if(isset($attributes['custom']['placeholder'])){
	 		 			$placeholder_abbr = $attributes['custom']['placeholder']."_".$item['abbreviation'];
	 		 			$placeholder = Application_Class_Utils::idx($attributes['custom']['data'], $placeholder_abbr, '');
	 		 		}else{
	 		 			$placeholder = "";
	 		 		}

	 		 		$class = $attributes['custom']['class']." ".$item['abbreviation'];
	 		 		$name  = $attributes['custom']['module']."[".$name_abbr."]";
	 		 		$value = Application_Class_Utils::idx($attributes['custom']['data'], $name_abbr, '');
	 		 		
	 		 		$return .= '<input type="text" '.$classic.' class="'.$class.'"  name="'.$name.'" value="'.$value.'" placeholder="'.$placeholder.'" style="'.$display.'" />';
	 		 	} 
	 		}
	 	}

	    if($echo) 
	    	echo $return;
	    else
	   		return $return;
	}

	public static function textareaMultilingual($attributes, $echo = true)
	{ 
		$languages = Application_Model_Language::getLanguages();
	 	$return = '';

	 	if(!empty($attributes)){ 
	 		$classic = '';
	 		foreach ($attributes['classic'] as $key => $value) {
	 			$classic .=  ' '.$key.'="'.$value.'" ';	 		 		
	 		} 	 

	 		if(!empty($languages)){ 
	 		 	foreach ($languages as $k => $item) {
	 		 		$display = ($k>0) ? 'display: none' : '' ;

	 		 		$name_abbr = $attributes['custom']['name']."_".$item['abbreviation'];
	 		 		$placeholder_abbr = $attributes['custom']['name']."_".$item['abbreviation'];

	 		 		if(isset($attributes['custom']['placeholder'])){
	 		 			$placeholder_abbr = $attributes['custom']['placeholder']."_".$item['abbreviation'];
	 		 			$placeholder = Application_Class_Utils::idx($attributes['custom']['data'], $placeholder_abbr, '');

	 		 			$value = Application_Class_Utils::idx($attributes['custom']['data'], $name_abbr, '');

	 		 			if(!$value){
	 		 				$value = $placeholder;
	 		 			}
	 		 		}else{
	 		 			$value = Application_Class_Utils::idx($attributes['custom']['data'], $name_abbr, '');
	 		 		}

	 		 		$id = $attributes['custom']['id']."_".$item['abbreviation'];
	 		 		$class = $attributes['custom']['class']." ".$item['abbreviation'];
	 		 		$name  = $attributes['custom']['module']."[".$name_abbr."]";
	 		 		
	 		 		$return .= '<textarea '.$classic.' id="'.$id.'" class="'.$class.'"  name="'.$name.'" style="'.$display.'">'.$value.'</textarea>';
	 		 	} 
	 		}
	 	}

	    if($echo) 
	    	echo $return;	
	    else
	   		return $return;
	}

	public static function editableMultilingual($attributes, $echo = true)
	{ 
		$languages = Application_Model_Language::getLanguages();
	 	$return = '';

	 	if(!empty($attributes)){ 
	 		$classic = '';
	 		foreach ($attributes['classic'] as $key => $value) {
	 			$classic .=  ' '.$key.'="'.$value.'" ';	 		 		
	 		} 	 

	 		if(!empty($languages)){ 
	 		 	foreach ($languages as $k => $item) {
	 		 		$display = ($k>0) ? 'display: none' : '' ;

	 		 		$name_abbr = $attributes['custom']['name']."_".$item['abbreviation'];

	 		 		$id = $attributes['custom']['id']."_".$item['abbreviation'];
	 		 		$class = $attributes['custom']['class']." ".$item['abbreviation'];
	 		 		$name  = $attributes['custom']['module']."[".$name_abbr."]";
	 		 		$value = Application_Class_Utils::idx($attributes['custom']['data'], $name_abbr, '');

	 		 		$return .= '<div '.$classic.' id="'.$id.'" class="'.$class.'"  name="'.$name.'" style="'.$display.'" />'.$value.'</div>';
	 		 	} 
	 		}
	 	}

	    if($echo) 
	    	echo $return;	
	    else
	   		return $return;
	}

	public static function boxSeo($module, $data, $echo = true)
	{ 
		// meta title
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		    )
		    ,'custom' => array(
		        'id'            => 'seo_h1'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => 'seo_h1'
		        ,'data'        => $data
		        ,'placeholder' => 'placeholder_seo_h1'
		    )
		);
		$seo_h1 = Application_Class_Forms::textMultilingual($attributes, false);

		// meta title
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		    )
		    ,'custom' => array(
		        'id'            => 'seo_h2'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => 'seo_h2'
		        ,'data'        => $data
		        ,'placeholder' => 'placeholder_seo_h2'
		    )
		);
		$seo_h2 = Application_Class_Forms::textMultilingual($attributes, false);

		// meta title
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		    )
		    ,'custom' => array(
		        'id'            => 'seo_title'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => 'seo_title'
		        ,'data'        => $data
		        ,'placeholder' => 'placeholder_seo_title'
		    )
		);
		$meta_title = Application_Class_Forms::textMultilingual($attributes, false);

		// meta description
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		        ,'rows'         => 4
		    )
		    ,'custom' => array(
		    	'id'            => 'seo_meta_description'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => 'seo_meta_description'
		        ,'data'        => $data
		        ,'placeholder' => 'placeholder_seo_meta_description'
		    )
		);
		$meta_description = Application_Class_Forms::textMultilingual($attributes, false);

		// meta keyword
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		        ,'rows'         => 4
		    )
		    ,'custom' => array(
		    	'id'            => 'seo_meta_keyword'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => 'seo_meta_keyword'
		        ,'data'        => $data
		    )
		);
		$meta_keyword = Application_Class_Forms::textareaMultilingual($attributes, false);

		$return = '';
		$return .='
			<div class="well">
				<div class="box mt30">
				    <div class="navbar">
				        <div class="navbar-inner">
				            <h6><i class="icon-cog"></i>Search Engine Optimization (SEO)</h6>
				        </div>
				    </div>
				    
				    <div class="well tab-form-content">
					    <div class="control-group">
					        <label class="control-label" for="seo_title"> H1:</label>
					        <div class="controls">'.$seo_h1.'</div>
					    </div>
					    
					    <div class="control-group">
					        <label class="control-label" for="seo_title"> H2:</label>
					        <div class="controls">'.$seo_h2.'</div>
					    </div>

				        <div class="control-group">
				            <label class="control-label" for="seo_title"> Meta Title:</label>
				            <div class="controls">'.$meta_title.'</div>
				        </div>

				        <div class="control-group">
				            <label class="control-label" for="seo_meta_description"> Meta Description:</label>
				            <div class="controls">'.$meta_description.'</div>
				        </div>

				        <div class="control-group">
				            <label class="control-label" for="seo_meta_keyword"> Meta Keyword:</label>
				            <div class="controls">'.$meta_keyword.'</div>
				        </div>
				    </div>
				</div>
			</div>
		';

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;
	}

	public static function boxSocialsNetwork($seo_id,$type,$module, $data, $echo = true)
	{
		$getIdMedia = Application_Model_Global::pselectRow(TABLE_PREFIX.'seo','media_id_facebook,media_id_twitter','id=:seo_id',array(":seo_id" => $seo_id));

		if (!empty($getIdMedia)) {
			$media_id = ($type == 'facebook') ? $getIdMedia['media_id_facebook'] : $getIdMedia['media_id_twitter'] ;
			if ($media_id) {
				$url = Application_Model_Media::getUrlById($media_id,'source');
				$image_cover = "<div id=".$type.">" ;
				$image_cover .= "<img src='".$url."' width='100' height='100' style='margin-bottom:10px;'>" ;
				$image_cover .= "<span class='delete_image' data-seo_id='".$seo_id."' data-social='".$type."' data-id-media='".$media_id."' style='margin-left:15px;cursor:pointer'>Supprimer l'image</span>" ;
				$image_cover .= "</div>" ;
			}
			else{
				$media_id = "" ;
				$image_cover = "";
			}
		}

		// $type titre
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		    )
		    ,'custom' => array(
		        'id'            => $type.'_title'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => $type.'_title'
		        ,'data'        => $data
		        ,'placeholder' => 'placeholder_'.$type.'_title'
		    )
		);
		$title = Application_Class_Forms::textMultilingual($attributes, false);

		// $type desciption
		$attributes = array(
		    'classic' => array(
		        'autocomplete' => 'off'
		        ,'rows'         => 4
		    )
		    ,'custom' => array(
		    	'id'            => $type.'_description'
		        ,'class'        => 'span12 multilingual'
		        ,'module'      => $module
		        ,'name'        => $type.'_description'
		        ,'data'        => $data
		    )
		);
		$description = Application_Class_Forms::textareaMultilingual($attributes, false);

		$return = '';
		$return .="
			<div class='box mt30'>
			    <div class='navbar'>
			        <div class='navbar-inner'>
			            <h6><i class='icon-".$type."'></i>".ucfirst($type)."</h6>
			        </div>
			    </div>
			    
			    <div class='well tab-form-content'>
				    <div class='control-group'>
				        <label class='control-label' for='seo_title'>".ucfirst($type)." title:</label>
				        <div class='controls'>".$title."</div>
				        <div class='controls'>
				        	<span>Si vous ne souhaitez pas utiliser le titre de l'article sur ".ucfirst($type)." mais voulez au contraire un autre titre, enregistrez-le ici</span>
				        </div>
				    </div>

			        <div class='control-group'>
			            <label class='control-label' for='seo_meta_keyword'>".ucfirst($type)." description:</label>
			            <div class='controls'>".$description."</div>
			            <div class='controls'>
			            	<spam>Si vous ne souhaitez pas utiliser la méta description pour partager l'article sur ".ucfirst($type)." mais voulez une autre description, enregistrez-la ici</span>
			            </div>
			        </div>

			        <div class='control-group'>
			            <label class='control-label' for='seo_meta_keyword'>".ucfirst($type)." image:</label>
			            <div class='controls'>
			            	".$image_cover."
			            	<span>Si vous voulez remplacer l'image utilisée pour cet article sur ".ucfirst($type).", <span class='lightboxmedia_seo'  style='cursor:pointer;color:red;' data-social='".$type."' data-id='".$seo_id."' data-module='module' data-type='type' data-id-media='".$media_id."' >choisissez une image</span></span>
			            </div>
			        </div>
			    </div>
			</div>
		";

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;
	}

	public static function boxCategory($module_slug, $data, $tc, $fk, $echo = true)
	{
		$tr = Zend_Registry::get('Zend_Translate');

		$return = '';

		$module_id = Application_Model_Module::getModuleIdBySlug($module_slug);
		$id_category_group = Application_Model_Module::getIdCategoryGroupByModule($module_id);

    	if(!empty($id_category_group)){ 
    		foreach ($id_category_group as $key => $value) {
				$categories = Application_Model_Category::getCategoryBox($value);
				$checkedcat = Application_Model_Category::getCheckedCategories($value, Application_Class_Utils::idx($data, 'id', 0), $tc, $fk);

			    $return .= '<div class="well mt-25px">';
			    $return .= '	<div class="navbar">';
				$return .= '        <div class="navbar-inner">';
				$return .= '            <h6>'.$tr->translate("Catégories")." > ".$categories['categories_name'].'</h6>';
				$return .= '        </div>';
				$return .= '    </div>';

                $return .= '        <div class="control-group">';
                $return .= '            <div>';
                            	 
		                            		if(!empty($categories)){ 
		                            			foreach ($categories['categories_list'] as $k => $item) {
		                            				$checked = (in_array($item['id_category'], $checkedcat)) ? 'checked="checked"' : '' ;

                $return .= 								'<label class="checkbox" style="cursor: pointer">';
                $return .= 								'<span class="checked">';
                $return .= 								'<input type="radio" name="'.$module_slug.'[categories]" id="'.$module_slug.'_categories_'.$item['id_category'].'" value="'.$item['id_category'].'" class="styled validate[required]" '.$checked.'>&nbsp;';
                $return .=								$item['title'];
                $return .= 								'</span>';
                $return .= 								'</label>';
                            					} 
                            				}
                            	
                $return .= '            </div>';
                $return .= '       	</div>';
			   	$return .= '</div>';

			} // endforeach
		} // endif

	    if($echo)
	   	 	echo $return;
	   	else
	   		return $return;		 
	}

	public static function multipleUpload($id, $upload_params)
	{ 
		$tr = Zend_Registry::get('Zend_Translate');

		$return = '';
		$return .= '<div class="widget row-fluid">';
		$return .= '	<div class="navbar"><div class="navbar-inner"><h6>'.$tr->translate("Outil pour télécharger des fichiers").'</h6></div></div>';
		$return .= '	<div id="'.$id.'" class="well"></div>';
		$return .= '</div>';


		$return .= '<script>'; 
		$return .= '$(function(){'; 	
		$return .= '	$("#'.$id.'").pluploadQueue({';
		$return .= '		runtimes : "html5,html4",';
		$return .= '		url : "'.BASE_URL.'/upload/multipleupload/format/html?'.$upload_params.'",';
		$return .= '		max_file_size : "2mb",';
		$return .= '		unique_names : true,';
		$return .= '		filters : [';
		$return .= '			{title : "Image files", extensions : "jpg,jpeg,gif,png"}';
		$return .= '		]';
		$return .= '	});';

		$return .= '	var uploader = $("#'.$id.'").pluploadQueue();';
		$return .= '	uploader.bind("FileUploaded", function(Up, File, Response) {';
		$return .= '		var table = $("#data-table").dataTable();';
		$return .= '		table.fnDraw();';
		$return .= '	});';
		$return .= '});';
		$return .= '</script>';

		echo $return;	                
	}

	public static function mediamultipleUpload($id, $upload_params)
	{ 
		$tr = Zend_Registry::get('Zend_Translate');

		$return = '';
		$return .= '<div class="widget row-fluid">';
		$return .= '	<div class="navbar"><div class="navbar-inner"><h6>'.$tr->translate("Outil pour télécharger des fichiers").'</h6></div></div>';
		$return .= '	<div id="'.$id.'" class="well"></div>';
		$return .= '</div>';


		$return .= '<script>'; 
		$return .= '$(function(){'; 	
		$return .= '	$("#'.$id.'").pluploadQueue({';
		$return .= '		runtimes : "html5,html4",';
		$return .= '		url : "'.BASE_URL.'/medias/multipleupload/format/html?'.$upload_params.'",';
		$return .= '		max_file_size : "2mb",';
		$return .= '		unique_names : true,';
		$return .= '        multiple_queues: true,';
		$return .= '		filters : [';
		$return .= '			{title : "Image files", extensions : "jpg,jpeg,gif,png"}';
		$return .= '		]';
		$return .= '	});';

		// $return .= '	var uploader = $("#'.$id.'").pluploadQueue();';
		// $return .= '	uploader.bind("FileUploaded", function(Up, File, Response) {';
		// $return .= '        uploader.splice();';
		// $return .= '		var table = $("#data-table-medias").dataTable();';
		// $return .= '		table.fnDraw();';
		// $return .= '	});';
		
		$return .= '});';
		$return .= '</script>';

		echo $return;	                
	}

	public static function actions($url_edit,$resource_type,$resource_id,$extras = NULL)
	{
 	 	$actions = '<ul class="table-controls acenter">';
    	$actions .= '<li><a title="" class="tip btn" href="'.$url_edit.'" data-original-title="Modifier"><i class="icon-pencil"></i></a> </li>';
    	$actions .= '<li><a title="" class="tip btn delete" data-resource_id="'.$resource_id.'" data-resource_type="'.$resource_type.'" style="cursor: pointer" data-original-title="Supprimer"><i class="icon-trash"></i></a> </li>';

    	if (!is_null($extras)) {
    		$actions .= $extras ;
    	}

        $actions .= '</ul>'; 

        return $actions ;
	}
}