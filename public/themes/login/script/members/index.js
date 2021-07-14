$(function () {
    // Start Delete User
    $(".delete").live("click", function (e) {
        e.preventDefault();

        var id = $(this).attr('id');
        bootbox.confirm("Voulez-vous vraiment supprimer cet item?", function (confirmed) {
            if (confirmed) {
                $.post(root + "/members/delete"
                        , {
                            "id": id
                        },
                function (data) {
                    table = $('#data-table').dataTable();
                    table.fnDraw();
                }
                , 'json'
                        );
            }
        });

    });
    // End Delete User

    $(".styled").live("click", function () {
        var checkedStatus = this.checked;

        if (checkedStatus == true) {
            if ($('table#data-table input[type=checkbox]:checked').length == $('table#data-table input[type=checkbox]').length - 1) {
                $("#checkAll").closest('.checker > span').addClass('checked');
            }
        } else {
            $("#checkAll").closest('.checker > span').removeClass('checked');
        }
    });
});
function toActive(id) {
    bootbox.confirm("Voulez-vous vraiment mettre l'utilisateur actif?", function (confirmed) {
        if (confirmed) {
            $.post(root + "/members/toactive"
                    , {
                        "id": id
                    },
            function (data) {
                table = $('#data-table').dataTable();
                table.fnDraw();
            }
            , 'json'
                    );
        }
    });
}

function changeEtat(val, id) {
    bootbox.confirm("Voulez-vous vraiment changer l'état de cette demande de virement?", function (confirmed) {
        if (confirmed) {
            $.post(root + "/members/changeetatvirement"
                    , {
                        "id": id,
                        "val": val
                    },
            function (data) {
                window.location.reload();
            }
            , 'json'
                    );
        }
    });
}

function validate(item){
    var resource_id = $(item).data('resource_id') ,
    resource_type = $(item).data('resource_type') ;

    $.post(root+"/ajax/validation"
    ,{ 
        "resource_id" : resource_id
        ,"resource_type" : resource_type
    }, 
    function(d){
        $('i.'+d.wrapper+'').removeClass(''+d.remove_class+'').addClass(''+d.add_class+'') ;
    }
    ,'json'
    );
}