$(function() {
	// Start Delete User
	$(".delete").live("click", function(e){
		e.preventDefault();

		var id = $(this).attr('id');		
		bootbox.confirm("Voulez-vous vraiment supprimer cet item?", function(confirmed) {
			if(confirmed){ 
				$.post(root+"/seo/deleteseo"
					,{ 
						"id" : id
					}, 
					function(data){
						table = $('#data-table').dataTable();
						table.fnDraw();		
					}
					,'json'
				);		 	 
			}
		});

	});
	// End Delete User

	// Check all checbboxes
	$("#checkAll").live("click", function() {
		var checkedStatus = this.checked;
		$("table#data-table tbody tr td:first-child input:checkbox").each(function() {
			this.checked = checkedStatus;
			if (checkedStatus == this.checked) {
				$(this).closest('.checker > span').removeClass('checked');
			}
			if (this.checked) {
				$(this).closest('.checker > span').addClass('checked');
			}
		});
	});	

	$(".styled").live("click", function(){
		var checkedStatus = this.checked;

		if(checkedStatus == true){
			// hack checkbox uniform problem
			var checked_length = $('table#data-table input[type=checkbox]:checked').length;
			var checkbox_length = $('table#data-table input[type=checkbox]').length;			
			if (checked_length-1 == checkbox_length-1) {
				$("#checkAll").closest('.checker > span').addClass('checked');
			}			
		}else{
			$("#checkAll").closest('.checker > span').removeClass('checked');	
		}
	});

	// Starting Mass Delete
	$(".massdelete").live("click", function(e){
		e.preventDefault();
		var massdeleteitems = $('input[name="checked[]"]').serializeArray();
		
		if ( (typeof massdeleteitems === 'undefined') || (massdeleteitems === null) || ($.isEmptyObject(massdeleteitems)) ) { 
			e.preventDefault();
			bootbox.alert("Veuillez séléctionner au moins un item?", function() {
			});
		}else{ 
			bootbox.confirm("Voulez-vous vraiment supprimer ces items?", function(confirmed) {
				if(confirmed){ 
					$.post(root+"/seo/massdeleteseo"
						,{ 
							"massdeleteitems"  : massdeleteitems
						}, 
						function(data){
							table = $('#data-table').dataTable();
							table.fnDraw();	
						}
						,'json'
					); 
				}
			});
		}
	});
	// Ending Mass Delete
});