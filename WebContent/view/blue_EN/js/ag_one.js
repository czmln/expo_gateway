$(function(){
	$.ajax({
		url : root + "/ag/getAgByWebSiteName.do",
		dataType : "json",
		data : {
			"webSiteName":"进口展英文网站"
		},
		type : "get",
		success : function(data) {
			$.each(data,function(i){
				var value=data[i].location
				if(value =="一级栏目头部"){
					var html ="<a hidefocus='true' href='"+data[i].url+"' target='_blank'><img width='770px' height='100px' src='"+photo+data[i].picture+"'></a>";
					$("#center").append(html);
				}else if(value =="一级栏目底部"){
					var html ="<a hidefocus='true' href='"+data[i].url+"' target='_blank'><img width='675px' height='135px' src='"+photo+data[i].picture+"'></a>";
					$("#bottom").append(html);
				}
			})
		}
	});
})