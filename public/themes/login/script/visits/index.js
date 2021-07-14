$(function(){

});

function refreshDailyVisits(year_month){
	$.post(root+"/visits/getajaxdailyvisits/format/html"
		,{ 
			"year_month" : year_month
		}, 
		function(data){}
	).done(function(data){ 
        if(data){   
	        $("table#daily tbody").empty().html(data);
        }
	});
}

function refreshMonthlyVisits(year){
	$.post(root+"/visits/getajaxmonthlyvisits/format/html"
		,{ 
			"year" : year
		}, 
		function(data){}
	).done(function(data){
        if(data){    
	        $("table#monthly tbody").empty().html(data);
        }
	});
}