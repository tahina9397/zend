$(function() {

	// Change on group select : load order item
	$("#id_category_group").live("change", function(e){
		var id_category_group = $("#id_category_group option:selected").val();

		$.post(root+"/categories/getajaxorderitem"
			,{ 
				"id_category_group" : id_category_group
			}, 
			function(data){	
				$("#order_item").html(data);	
			}
		);
	});	

});