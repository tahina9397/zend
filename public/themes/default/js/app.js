function autosizeTextarea()
{
  if ( $("textarea").length ) {
    autosize(document.querySelectorAll('textarea'));
  }
}

/*pagination*/
function getProducts(page){
  var resource_type = $("input[type=hidden][name=__pagination__]").data("resource_type"),
  resource_id = $("input[type=hidden][name=__pagination__]").data("resource_id"),
  q = $("input[type=hidden][name=__pagination__]").data("search"),
  datas = 'page='+page+"&q="+q ,
  url_ajax ;

  if (resource_type == "news") {
    var url_ajax = baseUrl+'/news/get/format/html';
  }
  else if(resource_type == "comments_news") {
    var url_ajax = baseUrl+'/news/getcomments/?resource_id='+resource_id 
  }

  $.ajax({
    url : url_ajax,
    type: "POST",
    data:datas,
    dataType : 'html', // On désire recevoir du HTML
    beforeSend:function(){
       // $(".overlay").show();
    },
    success : function(code_html, statut){ // code_html contient le HTML renvoyé
      // $('.overlay').hide();
      $("#results_wrapper").html(code_html);
      $('html, body').animate({
        'scrollTop': $("#results_wrapper").offset().top-150
        }, 800,function(){
      });
      init_avatar() ;
    }
  });
}

// $(document).on("click",".__pagination__",function(e){
//   e.stopPropagation() ;

//   var resource_type = $(this).data("resource_type") ,
//   page = $(this).data("page") ,
//   datas = 'page='+page ,
//   url_ajax ;


//   if (resource_type == "news") {
//     url_ajax = baseUrl+'/news/get/format/html';
//   }
//   else if(resource_type == "comments"){
//     url_ajax = baseUrl+'/news/getcomments/format/html';
//   }

//   $.ajax({
//      url : url_ajax,
//      type: "POST",
//      data:datas,
//      dataType : 'html', // On désire recevoir du HTML
//      beforeSend:function(){
//          // $(".overlay").show();
//       },
//      success : function(code_html, statut){ // code_html contient le HTML renvoyé
//          // $('.overlay').hide();
//          $("#results_wrapper").html(code_html);
//      }
//   });

// }) ;

function et_animate_item() {
  AOS.init();
}

function init_avatar(){
  if ($(".__initial__").length) {
    $('.__initial__').initial({
      name: 'Name', // Name of the user
      charCount: 2, // Number of characherts to be shown in the picture.
      textColor: '#ffffff', // Color of the text
      seed: 0, // randomize background color
      height: 100,
      width: 100,
      fontSize: 60,
      fontWeight: 400,
      fontFamily: 'HelveticaNeue-Light,Helvetica Neue Light,Helvetica Neue,Helvetica, Arial,Lucida Grande, sans-serif',
      radius: 0
    });
  }
}

$(document).ready(function(){
	autosizeTextarea() ;
  et_animate_item() ;
  init_avatar() ;
}) ;