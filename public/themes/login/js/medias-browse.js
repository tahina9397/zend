$(function(){
	tabMulti();

    $("#saveBtn").live("click", function(){

    	var data = $("#mediaInfos").serialize();
    	$.post(root+"/medias/updatemediainfos"
    		,{ 
    			"data"  : data
    		}, 
    		function(data){
    			
    		}
    		,'json'
    	);

    	return false;
    });

	$("ul.reorder-photos-list li i").on("contextmenu",function(){
       return false;
    });

	$("ul.reorder-photos-list li").click(function(){
	    //Do something

	    $("ul.reorder-photos-list li").each(function() { $(this).removeClass('current'); });
	    $(this).addClass('current');

	    var id = $(this).attr('id');
	    $(".media-sidebar").html("");
	    // $(".loader-img").show();

    	$.post(root + "medias/getphotoinfos", {
			"id"  : id
		}, function(data) {
			// $(".loader-img").hide();
			$(".media-sidebar").html(data);

			tabMulti();
		}, 'json');

		return false;

	}).mousedown(function(e) {
	    if(e.which == 3) //1: left, 2: middle, 3: right
	    {
	        //Do something
	        //Right click
	    }
	});

	$("a#addImage").live("click", function(){
		var id_item = $("#id_item").val();
		var module = $("#module").val();
		var type = $("#type").val();
		var media_id = $("#media_id").val();

    	$.post(root + "/medias/addcover", {
			"id_item"      : id_item
			,"module_item" : module
			,"type"        : type
			,"media_id"    : media_id
		}, function(data) {
			$(".cover").html(data.cover_photo);
			medialigthbox();

			$.fancybox.close();
		}, 'json');

		return false;
	});
});

function tabMulti(){
	// tabs multilingual
	$("#mediaInfos ul.nav-multilingual li").click(function() {
		$(this).parent().parent().find("ul.nav-multilingual li").removeClass("active");
		$(this).addClass("active"); 
		
		$(this).parent().parent().parent().find(".tab-form-content .multilingual").hide(); 

		var activeTab = $(this).find("a").attr("abbr"); 
		$('#mediaInfos .'+activeTab).show(); 

		$('#mediaInfos .cke').hide();  
		$('#mediaInfos #cke_text_'+activeTab).show(); 
		$('#mediaInfos #cke_content_'+activeTab).show();
		$('#mediaInfos #cke_description_'+activeTab).show(); 
		 
		$('#mediaInfos #text_'+activeTab).show(); 
		$('#mediaInfos #content_'+activeTab).show();
		$('#mediaInfos #description_'+activeTab).show(); 

		$(this).parent().parent().parent().find(".tab-form-content .ckeditor").css({'display':'none', 'visibility':'hidden'}); 
		  
		return false;
	});
}