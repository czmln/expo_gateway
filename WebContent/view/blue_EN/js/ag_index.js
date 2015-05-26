$(function(){
	$.ajax({
		url : root +"/"+shortUrl+ "/ag/getAgByWebSiteName.do",
		dataType : "json",
		type : "post",
		async:false,
		success : function(data) {
			var index =1;
			$.each(data,function(i){
				var value=data[i].location
				var adUrl=data[i].url?data[i].url:root+"/"+shortUrl+"/ag/getContentPage?id="+data[i].id;
				if(value =="首页中部"){
					var html ="<a hidefocus='true' href='"+adUrl+"' target='_blank'  class='b-ad'><img  src='"+photo+data[i].picture+"'></a>";
					$("#center").append(html);
				}else if(value =="首页底部"){
					var html ="<li><a  hidefocus='true' href='"+adUrl+"' target='_blank'><img  class='bot-ad' src='"+photo+data[i].picture+"'></a></li>";
					$("#bottom").append(html);
				}else if(value =="首页头部"){
					var head = $('<li><a target="_blank"><img border="0"/></a></li>');// 头部广告节点
					head.attr('href',adUrl).find('img').attr('src',photo+data[i].picture);
					$('#silder_list').append(head);
					/*var html ="<a  hidefocus='true' href='"+adUrl+"' target='_blank'><img  style='width:100%' src='"+photo+data[i].picture+"' height='230px' /></a>";
					$("#slider").append(html);*/
				}
			})
			$('#silder').imgSilder({
				s_width:'100%', //容器宽度
				s_height:230, //容器高度
				is_showTit:false, // 是否显示图片标题 false :不显示，true :显示
				s_times:3000, //设置滚动时间
				css_link:root + '/view/blue_EN/css/img_silder.css'
			});
			/* $('#slider').nivoSlider({
					directionNav : false
	        });*/
		}
	});
})