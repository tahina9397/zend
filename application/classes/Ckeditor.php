<?php
class Application_Class_Ckeditor {

	public static function initToggleCkeditor($id)
	{ 
		$languages = Application_Model_Language::getLanguages();
		if(!empty($languages)){ 
			foreach ($languages as $key => $value) {
				$hide = ($value['id']==DEFAULT_LANG_ID) ? false : true ;
				echo Application_Class_Ckeditor::editor($id.'_'.$value['abbreviation'],'',false, 350, $hide);	 	
			} 
		} 
	}

	public static function initToggleCkeditorBasic($id)
	{ 
		$languages = Application_Model_Language::getLanguages();
		if(!empty($languages)){ 
			foreach ($languages as $key => $value) {
				$hide = ($value['id']==DEFAULT_LANG_ID) ? false : true ;
				echo Application_Class_Ckeditor::editorBasic($id.'_'.$value['abbreviation'],'',false, 150, $hide);	 	
			} 
		} 
	}
	
	public static function initToggleCkeditorForNewsletters($id)
	{ 
		echo Application_Class_Ckeditor::editorCK('news','',false, 550, false);	 	
	}

	public static function editor($id, $value = '', $edit = true, $height = 350, $hide = false)
	{
    	global $CKEditor;
		$CKEditor->returnOutput = true;
		$CKEditor->basePath     = CKEDITOR_URL;

		// $CKEditor->config['width'] = 600;
		$CKEditor->config['height']= $height;

		//Set formatting options
		// $config['toolbar'] = array(
		//     array('Source'),'/',
		//     array('Save','NewPage','Preview','Print','Templates'),'/',
		//     array('Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo'),'/',
		//     array('Find','Replace','-','SelectAll','Scayt'),'/',
		//     array('Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'),'/',
		//     array('Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','RemoveFormat'),'/',
		//     array('NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv'),'/',
		//     array('JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl'),'/',
		//     array('Link','Unlink','Anchor'),'/',
		//     array('Maximize', 'ShowBlocks'),'/',
		//     array('Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe', 'InsertPre'),'/',
		//     array('Styles', 'Format', 'Font', 'FontSize'),'/',
		//     array('TextColor', 'BGColor'),'/',
		//     array('About')
		// );

		$config['toolbar'] = array(
			array('Bold','Italic','Underline','-','RemoveFormat'),'/',
		    array('Cut','Copy','Paste','PasteText','PasteFromWord','-'),'/',
		    array('Undo','Redo'),'/',
		    array('NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote',),'/',
		    array('JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'),'/',
		    array('Link','Unlink','Anchor'),'/',
		    array('Image',),'/',
		    array('Styles'),'/',
		    array('Format'),'/',
		    array('Table'),'/',
		    array('Font'),'/',
		    array('FontSize'),'/',
		    array('Maximize'),'/',
		    array('Source')
		);

		$config['language']=DEFAULT_LANG_ABBR;
		$config['uiColor']='#D5D5D5';
		$config['removePlugins']='elementspath';
		$config['removePlugins']='resize'; //Remove resize image
		$config['resize_enabled ']=false;  //Disallow resizing
		$config['extraPlugins']='autogrow';
		$config['allowedContent']=true;
		$config['extraAllowedContent']='*(*)';
		// $config['skin']="prestige";

		$events = array();
		if($hide){ 
			$events['instanceReady'] = 'function (ev) {
		    	$("#cke_" + ev.editor.name).hide();
		    }';			 
		}

		$initialValue = $value;

		include_once(CKEDITOR_PATH.'ckfinder/ckfinder.php');
		$finder = new CKFinder();
		$finder->BasePath = CKEDITOR_PATH . 'ckfinder/';
		$finder->SetupCKEditor($CKEditor,$CKEditor->basePath.'ckfinder/');

		if($edit)
			$CKEditorOutput = $CKEditor->editor($id,$initialValue,$config,$events);
		else
			$CKEditorOutput = $CKEditor->replace($id,$config,$events);

		return $CKEditorOutput;
	}	
	
	
	public static function editorCK($id, $value = '', $edit = true, $height = 350, $hide = false)
	{
    	global $CKEditor;
		$CKEditor->returnOutput = true;
		$CKEditor->basePath     = CKEDITOR_URL;

		// $CKEditor->config['width'] = 600;
		$CKEditor->config['height']= $height;

		//Set formatting options
		$config['toolbar'] = array(
		array('Source'),'/',
		array('Save','NewPage','Preview','Print','Templates'),'/',
		array('Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo'),'/',
		array('Find','Replace','-','SelectAll','Scayt'),'/',
		array('Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'),'/',
		array('Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','RemoveFormat'),'/',
		array('NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv'),'/',
		array('JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl'),'/',
		array('Link','Unlink','Anchor'),'/',
		array('Maximize', 'ShowBlocks'),'/',
		array('Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe', 'InsertPre'),'/',
		array('Styles', 'Format', 'Font', 'FontSize'),'/',
		array('TextColor', 'BGColor'),'/',
		array('About')
		);

		
		$config['language']=DEFAULT_LANG_ABBR;
		$config['uiColor']='#D5D5D5';
		$config['removePlugins']='elementspath';
		$config['removePlugins']='resize'; //Remove resize image
		$config['resize_enabled ']=false;  //Disallow resizing
		$config['extraPlugins']='autogrow';
		$config['allowedContent']=true;
		$config['extraAllowedContent']='*(*)';

		$events = array();
		if($hide){ 
			$events['instanceReady'] = 'function (ev) {
		    	$("#cke_" + ev.editor.name).hide();
		    }';			 
		}

		$initialValue = $value;

		include_once(CKEDITOR_PATH.'ckfinder/ckfinder.php');
		$finder = new CKFinder();
		$finder->BasePath = CKEDITOR_PATH . 'ckfinder/';
		$finder->SetupCKEditor($CKEditor,$CKEditor->basePath.'ckfinder/');

		if($edit)
			$CKEditorOutput = $CKEditor->editor($id,$initialValue,$config,$events);
		else
			$CKEditorOutput = $CKEditor->replace($id,$config,$events);

		return $CKEditorOutput;
	}	

	public static function editorBasic($id, $value = '', $edit = true, $height = 150, $hide = false)
	{
    	global $CKEditor;
		$CKEditor->returnOutput = true;
		$CKEditor->basePath     = CKEDITOR_URL;

		// $CKEditor->config['width'] = 600;
		$CKEditor->config['height']= $height;

		$config['toolbar'] = array(
			array('Bold','Italic','Underline'),'/',
		    array('Cut','Copy','Paste','-'),'/',
		    array('Undo','Redo'),'/',
		    array('NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote',),'/',
		    array('JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'),'/',
		    array('Link','Unlink','Anchor'),'/'
		);

		$config['language']=DEFAULT_LANG_ABBR;
		$config['uiColor']='#D5D5D5';
		$config['removePlugins']='elementspath';
		$config['removePlugins']='resize'; //Remove resize image
		$config['resize_enabled ']=false;  //Disallow resizing
		$config['extraPlugins']='autogrow';
		$config['allowedContent']=true;
		$config['extraAllowedContent']='*(*)';

		$events = array();
		if($hide){ 
			$events['instanceReady'] = 'function (ev) {
		    	$("#cke_" + ev.editor.name).hide();
		    }';			 
		}

		$initialValue = $value;

		include_once(CKEDITOR_PATH.'ckfinder/ckfinder.php');
		$finder = new CKFinder();
		$finder->BasePath = CKEDITOR_PATH . 'ckfinder/';
		$finder->SetupCKEditor($CKEditor,$CKEditor->basePath.'ckfinder/');

		if($edit)
			$CKEditorOutput = $CKEditor->editor($id,$initialValue,$config,$events);
		else
			$CKEditorOutput = $CKEditor->replace($id,$config,$events);

		return $CKEditorOutput;
	}

}