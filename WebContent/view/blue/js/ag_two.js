$(function(){
	$.ajax({
		url : root +"/"+shortUrl+ "/ag/getAgByWebSiteName.do",
		dataType : "json",
		data : {
			"webSiteName":"进口展中文网站"
		},
		type : "get",
		async:false,
		success : function(data) {
			if(data && data.length && data.length > 0){
				for(var i = 0;i < data.length;i ++){
					var value=data[i].location;
					if(value =="一级栏目底部" && data[i].picture){
						$("#bottomImg").prop('src',photo + data[i].picture).parent().show().prop('href',data[i].url).prop('target','_blank');
					}
					if(value =="一级栏目头部"){
						var html ="<a href='"+data[i].url+"' target='_blank'><img width='770px' height='100px' src='"+photo+data[i].picture+"'></a>";
						$("#center").append(html);
					}
				}
			}
		}
	});
})