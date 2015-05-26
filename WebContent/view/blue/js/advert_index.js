$(function(){
	$.ajax({
		url : root + "/advert/getAdvertsByWebSiteName.do",
		dataType : "json",
		data : {
			"webSiteName":"进口展中文网站" 
		},
		async:true,
		type : "post",
		success : function(data) {
			/*$(".node_id:visible").remove();*/
			var index =1;
			$.each(data,function(i,val){
				/*var value=val.location
				if(value =="首页中部"){
					var $img = $('<img/>');
					$img.attr("src",photo + val.picture).load(function() {
				        $("#center a").attr("href",val.url).empty().append($img);
				        $(this).hide();
				        $(this).fadeIn("slow");
				    });
					
				}else if(value =="首页底部"){
					var $img = $('<img/>');
					$img.addClass('bot-ad').attr("src",photo + val.picture).load(function() {
						$("#bottom li a").attr("href",val.url).empty().append($img);
						$(this).hide();
				        $(this).fadeIn("slow");
				    });
				}else if(value =="首页头部"){
					var $node = $(".node_id:hidden").clone().show();
					var $img = $('<img/>');
					$img.css({'width':'100%','height':'230px'}).attr('src',photo + val.picture).load(function(){
						 $node.attr('href',val.url).append($img).appendTo($("#slider"));
						 $(this).hide();
					     $(this).fadeIn("slow");
					});
					var html ="<a href='"+data[i].url+"' target='_blank'><img  style='width:100%' src='"+photo+data[i].picture+"' height='230px' /></a>";
					$("#slider").append(html);
				}*/
				
				
				var value=data[i].location
				if(value =="首页中部"){
					var html ="<a hidefocus='true' href='"+data[i].url+"' target='_blank'  class='b-ad'><img  src='"+photo+data[i].picture+"'></a>";
					$("#center").append(html);
				}else if(value =="首页底部"){
					var html ="<a hidefocus='true' href='"+data[i].url+"' target='_blank'><img  class='bot-ad' src='"+photo+data[i].picture+"'></a>";
					$("#bottom").append(html);
				}else if(value =="首页头部"){
					var html ="<li><a hidefocus='true' href='"+data[i].url+"' target='_blank'><img  style='width:100%' src='"+photo+data[i].picture+"' height='230px' /></a></li>";
					$("#slider").append(html);
				}
			})
			//轮播
		   $('#slider').nivoSlider({
						directionNav : false
		   });
		}
	});
})