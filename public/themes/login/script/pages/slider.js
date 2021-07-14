$(document).on("change","select#add_slider",function(){
    var resource_id = $(this).data('resource_id') ,
    page_id = $(this).data('page_id') ,
    activate = $(this).val();

    $.post('/pages/addslider?resource_id='+resource_id+'&page_id='+page_id+'&activate='+activate,'json');
});