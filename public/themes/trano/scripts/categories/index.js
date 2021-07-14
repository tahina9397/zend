$(document).ready(function(){
    if ($('#data-table').length) {
        $.extend( $.fn.dataTable.defaults, {
            autoWidth: true,
            dom: '<"datatable-header"fl><"datatable-scroll"t><"datatable-footer"ip>',
            language: {
                search: "" ,
                lengthMenu: '_MENU_',
                zeroRecords : "Pas de résultats",
                emptyTable : "Aucune donnée enregistrée",
                info : "Page _PAGE_ de _PAGES_" ,
                infoEmpty : "" ,
                infoFiltered : "" ,
                loadingRecords : "Chargement des données ..." ,
                paginate: { 'first': '<<', 'last': '>>', 'next': '>', 'previous': '<' },
            },
            drawCallback: function () {
                $(this).find('tbody tr').slice(-3).find('.dropdown, .btn-group').addClass('dropup');
            },
            preDrawCallback: function() {
                $(this).find('tbody tr').slice(-3).find('.dropdown, .btn-group').removeClass('dropup');
            }
        });

        // Basic datatable
        $('#data-table').DataTable({
            ajax: {
                "url" : baseUrl+"/categories/getcategories/format/html"
            },
            aLengthMenu : [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Tous"]],
            iDisplayLength : 10,
            columnDefs: [ 
                {"targets": 0,"orderable": false}
                ,{"targets": 1,"orderable": true}
                ,{"targets": 2,"orderable": true}
                ,{"targets": 3,"orderable": true}
                ,{"targets": 4,"orderable": false}
            ],
            order: [],
            fnDrawCallback : function (oSettings) {
                $('[data-popup=tooltip]').tooltip({
                    template: '<div class="tooltip"><div class="bg-slate"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div></div>'
                });

                deleteResource() ;
                $('.styled').uniform();
            }
        });
            

        // Enable Select2 select for the length option
        $('.dataTables_length select').select2({
            minimumResultsForSearch: Infinity,
            width: 'auto'
        });

        $('.dataTables_filter input[type=search]').attr('placeholder','Votre recherche');
    }

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
}) ;

$(document).on('change',"select[name=update_logo]",function(){
   var resource_id = $(this).data('resource_id') ,
   resource_type = $(this).data('resource_type') ,
   activate = $(this).val();

   $.post(baseUrl+'/ajax/updatestate?resource_id='+resource_id+'&resource_type='+resource_type+'&activate='+activate,'json');
}); 
