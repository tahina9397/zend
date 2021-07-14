$(document).ready(function(){
    validateForm();
});

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

function redirection(){
  window.location.href='/';
}

function validateForm(id) {

    id = typeof id !== 'undefined' ? id : '';

    var formIdentifierInputs = (id) ? "#"+id+".validate-ajax input" : ".validate-ajax input";
    var formIdentifier = (id) ? "#"+id+".validate-ajax" : ".validate-ajax";
    var formInputBtnSubmit = 'button[type="submit"], input[type="submit"]';

    $(formIdentifierInputs).blur(function(evt) {

        var current_el = this;
        setTimeout(function(){

            // this is the element that has focus now
            var next_active = document.activeElement;

            // prevents flashing on submit
            if( !$(next_active).is(formInputBtnSubmit) ){
                doValidation($(current_el).closest('form'), $(current_el), false);
            }
        });

    });

    $(formIdentifier).submit(function(e) {
        $(formIdentifier).find('div.form-errors').remove();
        doValidation($(this), $(this).find(formInputBtnSubmit), true);
        return false;
    });
}

function doValidation(form, field, submit) {
    var data = {};

    var url = baseUrl + '/ajax/validateform/';
    var inputFields = $(form).find('input');
    var inputSelects = $(form).find('select');
    var inputTextareas = $(form).find('textarea');
    var fieldName = $(field).attr('name');
    var fieldType = $(field).attr('type');
    var formGroup = $(form).find('.form-group');
    console.log(fieldType);

    // do nothing on blur submit
    if (fieldType == 'submit' && submit == false){
        return;
    }

    $(inputFields).each(function() {
        data[$(this).attr('name')] = $(this).val();

        // checkbox fix
        if ($(this).attr('type') == 'checkbox' && $(this).attr('checked') == 'checked'){
            data[$(this).attr('name')] = 1;
        }else if ($(this).attr('type') == 'checkbox'){
            data[$(this).attr('name')] = 0;
        }

    });

    $(inputSelects).each(function() {
        data[$(this).attr('name')] = $(this).val();
    });

    $(inputTextareas).each(function() {
        data[$(this).attr('name')] = $(this).val();
    });

    $.post(url, data, function(response) {
        if (response['ajax_csrf'] != '') {
            $('#csrf').val(response['ajax_csrf']);
        }
        
        if (submit == true && response['errors'] == '') {
            // no errors, do submit!
            // jquery would loop, use dom instead
            var form_data = $("#"+form.attr('id')).serialize();

            var l = Ladda.create(document.querySelector('form#'+form.attr("id")+' button.ladda-button'));

            if(form.attr('id') == "Signin"){
                $.ajax({
                  type: "POST",
                  url:baseUrl+"/index/authenticate/format/html",
                  data: form_data,
                  dataType : "json",
                  beforeSend: function (){
                    l.start();
                    $("form#Signin input[type=submit]").attr('disabled', true);
                  },
                  success: function (d) {
                    $("form#Signin div.form-errors").html("");
                    l.stop();

                    if(d.state == "success"){
                        initToastr("success",d.msg) ;
                        setTimeout(window.location.href="/siteconfiguration",5000);
                    }
                    else{
                        initToastr("error",d.msg) ;
                    }
                  }
                });
            }
            else if(form.attr('id') == "SiteConfiguration"){
                $.ajax({
                  type: "POST",
                  url:baseUrl+"/siteConfiguration/update/format/html",
                  data: form_data,
                  dataType : "json",
                  beforeSend: function (){
                    l.start();
                    $("form#SiteConfiguration input[type=submit]").attr('disabled', true);
                  },
                  success: function (d) {
                    $("form#SiteConfiguration div.form-errors").html("");
                    l.stop();

                    initToastr("success",d.msg) ;
                  }
                });
            }
            else{
              document.getElementById(form.attr('id')).submit();
            }
        } else if (fieldType == 'submit'){
            // there are errors on submit
            
            $(inputFields).each(function() {
                var errors = getErrorHtml(response['errors'][$(this).attr('name')]);
                var s = $(this).attr('name');

                if (errors != ''){
                    if((form.attr('id')=="Request" && (s=='email' || s=='phone'))){
                        $(this).closest("div.form-group").addClass('has-error');
                    }else{
                        $(this).closest("div.form-group").append(errors);
                    }
                }
            });

            $(inputSelects).each(function() {

                // transform multi-selects i.e. birthday[day] to birthday
                var s = $(this).attr('name');
                s = s.substring(0, s.indexOf('['));
                if (s == '') s = $(this).attr('name');

                var errors = getErrorHtml(response['errors'][s]);

                if (errors != ''){
                    // find last select in the row and display errors there
                    $(this).next().append(errors);
                }
            });

            $(inputTextareas).each(function() {

                // transform multi-selects i.e. birthday[day] to birthday
                var s = $(this).attr('name');
                console.log(s);
                s = s.substring(0, s.indexOf('['));
                if (s == '') s = $(this).attr('name');

                var errors = getErrorHtml(response['errors'][s]);

                if (errors != ''){
                    // post comment form
                    if(s=='comment'){
                        $(this).closest("div.form-group").addClass('has-error');
                    }else{
                        // find last select in the row and display errors there
                        $(this).closest("div.form-group").append(errors);
                    }
                }
            });
        } else{
            if(fieldType!="file"){ // except input file using ajax upload
                var errors = getErrorHtml(response['errors'][fieldName]);
                if (errors != ''){
                    $(this).next().append(errors);
                }
            }
        }
    }, 'json'); 
}

function getErrorHtml(errors, id) {

    if(typeof(errors) === 'undefined' || errors == '') return '';

    var o = '<div class="form-errors" style="display:block;"><ul>';
    for (errorKey in errors) {
        o += '<li>' + errors[errorKey] + '</li>';
    }
    o += '</ul></div>';
    return o;
}
