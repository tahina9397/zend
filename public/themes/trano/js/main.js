$(function() {
	// fullview : show/hide menu
	$('.fullview').click(function(){
	    $("body").toggleClass("clean");
	    $('#sidebar').toggleClass("hide-sidebar mobile-sidebar");
	    $('#content').toggleClass("full-content");
	});

	// expandable menu
	// $('.expand').collapsible({
	// 	defaultOpen: 'current,third',
	// 	cookieName: 'navAct',
	// 	cssOpen: 'subOpened',
	// 	cssClose: 'subClosed',
	// 	speed: 200
	// });

	$('.expand').live('click', function(){ 
		$(this).next('ul').toggle(200);		 
	});

	// Popover
	$('.popover-test').popover({
		placement: 'left'
	})
	.click(function(e) {
		e.preventDefault()
	});

	$("a[rel=popover]")
		.popover()
	.click(function(e) {
		e.preventDefault()
	});

	// Tooltips
	$('.tip').tooltip();
	$('.focustip').tooltip({'trigger':'focus'});

    // Validation
    $(".form-to-validate").validationEngine({promptPosition : "topRight:-122,-5"});

    // $(".dataTables_length select, .styled").uniform({ radioClass: 'choice' });
    $(".dataTables_length select").uniform({ radioClass: 'choice' });

    // Datepicker
    $( ".datepicker" ).datepicker({
    	defaultDate: +7,
    	showOtherMonths:true,
    	autoSize: true,
    	dateFormat: 'yy-mm-dd'
    });

    $( ".datepicker-payment" ).datepicker({
    	defaultDate: +7,
    	showOtherMonths:true,
    	autoSize: true,
    	dateFormat: 'dd-mm-yy'
    });

    // tabs multilingual
    $("ul.nav-multilingual li").click(function() {
    	$(this).parent().parent().find("ul.nav-multilingual li").removeClass("active");
    	$(this).addClass("active"); 
    	
    	$(this).parent().parent().parent().find(".tab-form-content .multilingual").hide(); 

    	var activeTab = $(this).find("a").attr("abbr"); 
    	$('.'+activeTab).show(); 

    	$('.cke').hide();  
    	$('#cke_text_'+activeTab).show(); 
    	$('#cke_content_'+activeTab).show();
    	$('#cke_description_'+activeTab).show(); 
    	 
    	$('#text_'+activeTab).show(); 
    	$('#content_'+activeTab).show();
    	$('#description_'+activeTab).show(); 

    	/*only if there is lots of richtext*/
    	$("div.blockItineraire").each(function(){
    		var id_circuit_day = $(this).data("id_circuit_day") ;
    		$('#itineraire_'+id_circuit_day+'_'+activeTab).show(); 
    		$('#cke_itineraire_'+id_circuit_day+'_'+activeTab).show(); 
    	})

    	$(this).parent().parent().parent().find(".tab-form-content .ckeditor").css({'display':'none', 'visibility':'hidden'}); 
    	  
    	return false;
    });

    $(".lightbox").fancybox({
    	'padding': 2
    });

    //===== Media item hover overlay =====//
	$('.view').hover(function(){
	    $(this).children(".view-back").fadeIn(200);
	},function(){
	    $(this).children(".view-back").fadeOut(200);
	});

    medialigthbox();

    // change lang
	$('.change-lang').click(function(){
		$.post(root+"/admin/translations/changelang"
			,{ 
				"action" : 'changelang'
			}, 
			function(data){
				window.location.reload();	
			}
			,'json'
		);    
	});  

	// $(window).resize(function(){ 
		adjustContentHeight(); 
	// });

	$('.tags').tagsInput({width:'100%'});
	// $('.tags-autocomplete').tagsInput({
	//     width:'100%',
	//     autocomplete_url:'tags_autocomplete.html'
	// });

	hackCheckboxUniform();

	$(".deletecover").live("click", function(){
		var id_item = $(this).attr("data-id");
		var module = $(this).attr("data-module");
		var type = $(this).attr("data-type");
		var id_media = $(this).attr("data-id-media");

    	$.post(root + "/admin/medias/deletecover", {
			"id_item"      : id_item
			,"module_item" : module
			,"type"        : type
			,"media_id"    : id_media
		}, function(data) {
			$(".cover").html(data.add_cover);
			medialigthbox();

			$.fancybox.close();
		}, 'json');

		return false;
	});

	$("a.addTag").live("click", function(){
		var tag = $("input#tag").val();

		if(tag){
			$("input#tag").closest("div.control-group").removeClass("error");

			var id_item = $(this).attr("data-id");
			var module = $(this).attr("data-module");

	    	$.post(root + "/admin/tags/add", {
				"tag" : tag
				,"module_item" : module
				,"id_item" : id_item
			}, function(data) {
				$("input#tag").val("");
				$("div#hashtagsWrap").html(data.hashtags);
			}, 'json');
		}else{
			$("input#tag").closest("div.control-group").addClass("error");
		}
	});

	$("a.delHashtag").live("click", function(){
		var id = $(this).attr("data-id");
		var id_item = $(this).attr("data-id-item");
		var module_item = $(this).attr("data-module");

		if(id){
	    	$.post(root + "/admin/tags/delete", {
				"id" : id
				,"id_item" : id_item
				,"module_item" : module_item
			}, function(data) {
				$("div#hashtagsWrap").html(data.hashtags);
			}, 'json');
		}
	});
});

$(window).load(function(){ 
	// adjust content height
	adjustContentHeight(); 
});

function adjustContentHeight()
{ 
	
	var body_h = $("body").height();
	var content_h = body_h - 48;
	content_h = parseInt(content_h);
	$("#content").css({'min-height':content_h});

}

function hackCheckboxUniform(){
	$("#data-table_wrapper div.checker").click(function(){
		$(this).find("input").trigger("click");	
	});
}

function medialigthbox(){
	$("a.lightboxmedia").each(function() {
    	var id = $(this).attr("data-id");
    	var module = $(this).attr("data-module");
    	var type = $(this).attr("data-type");
    	var id_media = $(this).attr("data-id-media");

      	$(this).fancybox({
			padding   : 0
	        ,margin   : 0
	        ,autoSize : false
	        ,width    : '96%'
	        ,height   : '94%'
			,href     : root+'/admin/medias/browse/format/html'
	        ,type     : 'ajax'
	        ,ajax: { type: "POST", data : "item_id="+id+"&item_module="+module+"&item_type="+type+"&id_media="+id_media}         
      	});
    });
}

function updateState()
{
	$('#statut').live('change',function(){
        var resource_id = $(this).data('resource_id') ,
        resource_type = $(this).data('resource_type') ,
        activate = $(this).val();

        $.post('/admin/ajax/updatestate?resource_id='+resource_id+'&resource_type='+resource_type+'&activate='+activate,'json');
    });

}

function maskInput(){
    $(".number").mask('###', {reverse: true});
}

function maskInputPourcentage(){

	var options =  {
	  onKeyPress: function(cep, e, field, options) {
	    var masks = ['00', '###'];
	    var mask = (cep.length>2) ? masks[1] : masks[0];
	    $('.pourcentage').mask(mask, options);
	}};

	$('.pourcentage').mask('###', options);
}