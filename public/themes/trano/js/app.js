function autosizeTextarea()
{
  if ( $("textarea").length ) {
    autosize(document.querySelectorAll('textarea'));
  }
}

function deleteResource()
{
  $(document).on("click","button.delete,span.delete,a.delete",function(e){
    e.preventDefault() ;

    var resource_type = $(this).data("resource_type") ,
    resource_id = $(this).data("resource_id") ;

    /*swal2*/
    Swal.fire({
      title: SWAL_CONFIRMATION,
      text: SWAL_INFO ,
      icon: 'warning',
      confirmButtonText: "Oui",
      showCancelButton: true,
      cancelButtonText: "Non"
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        $.ajax({
          type: "POST",
          url:baseUrl+"/ajax/deleteresource/format/html",
          data: {
            "resource_type" : resource_type ,
            "resource_id" : resource_id ,
          },
          dataType: "json",
          success: function (d) {
            Swal.fire("Supprimé", d.msg, 'success') ;

            var table = $('#data-table').DataTable();
            table.ajax.reload(null,false); 
          }
        });
      } 
    })

  }) ;
}

function massDeleteResource()
{
  $(".massdelete").on("click", function(e){
    e.preventDefault();
    var massdeleteitems = $('input[name="checked[]"]').serializeArray() ,
    resource_type = $(this).data("resource_type") ;
    
    /*swal2*/
    if ( (typeof massdeleteitems === 'undefined') || (massdeleteitems === null) || ($.isEmptyObject(massdeleteitems)) ) { 
      e.preventDefault();
      Swal.fire('Veuillez séléctionner au moins un item') ;
      
    }else{ 
      Swal.fire({
        title: SWAL_CONFIRMATIONS ,
        text: SWAL_INFO ,
        icon: 'warning',
        confirmButtonText: "Oui",
        showCancelButton: true,
        cancelButtonText: "Non"
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          $.ajax({
            type: "POST",
            url:baseUrl+"/ajax/massdeleteresource/format/html",
            data: {
              "resource_type" : resource_type ,
              "massdeleteitems" : massdeleteitems ,
            },
            dataType: "json",
            success: function (d) {
              Swal.fire("Supprimé", d.msg, 'success') ;

              var table = $('#data-table').DataTable();
              table.ajax.reload(null,false); 
            }
          });
        } 
      })
    }
  });
}

function updateState()
{
  $(document).on('change',"select#statut",function(){
    var resource_id = $(this).data('resource_id') ,
    resource_type = $(this).data('resource_type') ,
    activate = $(this).val();

    $.post(baseUrl+'/ajax/updatestate?resource_id='+resource_id+'&resource_type='+resource_type+'&activate='+activate,'json');
  });
}

function checkAll()
{
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
}

$(document).on("click",".open_modal",function(e){
  e.preventDefault() ;

  var resource_type = $(this).data("resource_type") ,
  resource_id = $(this).data("resource_id"),
  url = baseUrl+'/ajax/showmodal?resource_id='+resource_id+'&resource_type='+resource_type ;

  $.post(url, 
  {
  },
  function(d){
    $('#form_modal .modal-content').html(d.modal_content);
    $('#form_modal').modal('show'); 
    validateForm("CentreFiscal") ;
  }, 'json');
    
}) ;

function initToastr($type,$msg)
{
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    if ($type == "success") {
        toastr.success($msg);
    }
    else{
        toastr.error($msg);
    }
}

/*change etate*/
$(document).on('change',"select#statut",function(){
  var resource_id = $(this).data('resource_id') ,
  resource_type = $(this).data('resource_type') ,
  activate = $(this).val();

  $.post(baseUrl+'/ajax/updatestate?resource_id='+resource_id+'&resource_type='+resource_type+'&activate='+activate,'json');
});
  
var $selection = "input[type=checkbox][name=selection]" ;
$(document).on('change',$selection,function(){
  var resource_id = $(this).data('resource_id') ,
  resource_type = $(this).data('resource_type') ,
  activate = (this.checked) ? 1 : 0 ;

  $.post(baseUrl+'/ajax/updatestate?resource_id='+resource_id+'&resource_type='+resource_type+'&activate='+activate,'json');
});

$(document).ready(function(){
	autosizeTextarea() ;
  checkAll() ;
  massDeleteResource() ;

  $("input.number").inputmask("9999999999",{"placeholder":""}) ;
}) ;