function getNavListByType(type,root,photo){
	
	
	$.ajax({
		 url:root+"/nav/getListByType.do",
	     data:{"navtype":type},
	     dataType:"json",
	     type:"POST",
	     success:function(data){
	    	 var str="";
	    	 var istr="";
	    	 if(data!=null && data!=""){
	    		 
	    		 for (var i = 0; i < data.length; i++) {
	    			str+='<li><img src="'+photo+data[i].logo+'" /><h3>'+data[i].name+'</h3></li>';
	    			
	    			istr+='<li>'+
	    			'<a href="http://'+data[i].url+'"><img src="'+photo+data[i].imageUrl+'" /></a>'+           
	    			'<div class="lof-main-item-desc">'+
	    			'</div>'+
	    		'</li>'; 
	    		}
	    	 }
	    	 $(".lof-main-wapper").html(istr);
	    	 $(".lof-navigator").html(str);
	    	 
	    	 
	    		var buttons = {
	    				previous:$('#lofslidecontent45 .lof-next'),
	    				next:$('#lofslidecontent45 .lof-previous')
	    			};

	    			$obj = $('#lofslidecontent45').lofJSidernews({
	    				interval : 4000,
	    				direction		: 'opacitys',	
	    				easing			: 'easeInOutExpo',
	    				duration		: 1200,
	    				auto		 	: false,
	    				maxItemDisplay  : 5,
	    				navPosition     : 'horizontal', // horizontal , vertical ������ˮƽ�ʹ�ֱ��ʽ
	    				navigatorHeight : 180,
	    				navigatorWidth  : 135,
	    				mainWidth:1420,
	    				buttons			: buttons
	    			});	
	     }
		 
	 });
	
}