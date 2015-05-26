<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String photo =application.getInitParameter("photo");
	
	String root = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国西部(四川)进口展暨国际投资大会</title>
<meta name="keywords" content="进口展，中国西部，西部进口展">
<meta name="description" content="中国西部进口展" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link href="<%=root%>/view/blue/css/all page.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=root%>/view/blue/css/nivo-slider.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="<%=root%>/view/blue/css/zzsc.css"
	type="text/css" media="screen" />
<link type="text/css" href="<%=root%>/view/blue/css/lunbo.css"
	rel="stylesheet">
<script type="text/javascript">
var root="<%=root%>";
var photo="<%=photo%>";
    if(!window.slider) {
		var slider={};
	}
	slider.data= [
    {
        "id":"slide-img-1", 
        "client":"",
        "desc":""
    },
    {
        "id":"slide-img-2",
        "client":"",
        "desc":""
    },
    {
        "id":"slide-img-3",
        "client":"",
        "desc":""
    },
    {
        "id":"slide-img-4",
        "client":"",
        "desc":""
    }
    ]
	
</script>
</head>
<body>

<%@ include file="head.jsp"%>

<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh">
</script>
<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/bshareC0.js">
</script>
	<div  class="slide slide1" style="width: 100%">
		<img id="agImg" width="100%" src="<%=root%>/view/blue/images/default.png">
	</div>
	<div class="sbg">
		<div class="sbox">
			<div class="s-left">
				<ul class="s-fl" id="left-menu"></ul>
			</div>
			<div class="s-right">
				<div class="suc-tit">
					<h2 class="zt"></h2>
					<div class="suc-r">
						<div id="page" style="display: none;" page=""></div>
						<span>当前位置：<a id="goBack" style="display: none;"
							href="javascript:void(0);">返回上一级 > </a><font></font></span>
					</div>
				</div>
				<div class="suc-nr"></div>
				<div class="bshare-custom" style="float:right;">
                <a title="分享到QQ空间" class="bshare-qzone"></a>
                <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
                <a title="分享到人人网" class="bshare-renren"></a>
                <a title="分享到腾讯微博" class="bshare-qqmb"></a>
                <a title="分享到网易微博" class="bshare-neteasemb"></a>
               <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
              <span class="BSHARE_COUNT bshare-share-count">0</span>
             </div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	};
var members = [];
$(function(){
	getMenubarsByMenuId();
});


function getMenubarsByMenuId () {
	var currentId = '${currentId}'; 
	var menuId = '${menuId}'; 
	var tempId = currentId == 'null' ? menuId : currentId;
	var viewId;
	var nav_type = '${nav_type}';
	var articleId = '${articleId}';	
	var back_type = '${nav_type}';
	var back_id = '${menuId}';
    $.ajax({
		url:root + "/"+shortUrl+"/article/getMenubarsByMenuId?menuId="+tempId,
		dataType:"json",
		async : true,
		type:"post",
		success:function(data){
			$(".s-fl").empty("li");
		    $.each(data,function(i,val){
				var node =$('<li ><a href="javascript:void(0);" hidefocus="true" ></a><img src="<%=root%>/view/blue/images/icon_03.jpg"></li>').clone();
				if(i==(data.length-1)){
					node.css("border-bottom","none");
				}
				$("#left-menu").append(node);
				node.find("a").html(val.name);
				if(currentId == 'null'&&i == 0){
					viewId = val.id;
					if(nav_type != '6'){
						nav_type = val.navType;
					}
					back_id = val.id;
					back_type = val.navType;
					node.addClass("sk").find("img").attr("src","<%=root%>/view/blue/images/icon_06.jpg");
					$(".suc-tit .zt").html(val.name);
					$(".suc-r").find("span font").html(val.name);
				}else if(currentId != 'null'&&val.id == menuId){
					viewId = val.id;
					if(nav_type != '6'){
						nav_type = val.navType;
					}
					back_type = val.navType;
					back_id = val.id;
					node.addClass("sk").find("img").attr("src","<%=root%>/view/blue/images/icon_06.jpg");
					$(".suc-tit .zt").html(val.name);
					$(".suc-r").find("span font").html(val.name);
				}else{
					node.find("img").attr("src","<%=root%>/view/blue/images/icon_03.jpg");
				}
				node.click(function(){
					$(".s-fl li").removeClass("sk").children().attr("src","<%=root%>/view/blue/images/icon_03.jpg");
					node.addClass("sk").find("img").attr("src","<%=root%>/view/blue/images/icon_06.jpg");
					$(".suc-tit .zt").html(val.name);
					$(".suc-r").find("span font").html(val.name);
					back_type = val.navType;
					back_id = val.id;
					getView(val.navType,val.id,articleId);
				});
				
				//node.appendTo($(".s-fl"));
			});
			
			getView(nav_type,viewId,articleId);

						$("#goBack").click(function(){
							var pageStr = $('#page').prop('page');
							var current_page = pageStr && pageStr != null ? Number(pageStr) : 0;
							getView(back_type,back_id,null,current_page);
						});
		}
		
	}); 
}

function getImg(id){
	var url = root +"/"+shortUrl+ "/ag/getImg?menubar_id=" + id;
	$.ajax({
		url:url,
		dataType:"json",
		type:"GET",
		async : false, 
		success:function(data){
			if(data && data.picture){
				$('#agImg').attr("src",photo+data.picture);
			}
			/* if(data && data.picture){
				$('#advertImg').attr("src",photo+data.picture);
				
			}else{
				$('#advertImg').attr("src",root+"/view/blue/images/default.png");
			} */
		}
	});
}

function changeTitle(){
	document.title = "中国西部(四川)进口展及国际投资大会";
}

function getView(type,menuId,articleId,current_page) {
	if(!current_page){
		current_page = 0;
	}
	getImg(menuId);
	changeTitle();
	/* if(!articleId || articleId == null){
		getImg(menuId);
	} */
	$(".suc-nr").load("<%=root+"/"+shortUrl%>/article/getView?menuId=" + menuId + "&nav_type="
							+ type + "&articleId=" + articleId
							+ "&current_page=" + current_page, function() {
		     $('.bshare-custom').hide();
						if ((type == "5" || type == "6")) {
							$("#goBack").show();
						} else {
							$("#goBack").hide();
						}
					});
		}
	</script>
	<%@ include file="foot.jsp"%>

	<div class="cenav">
		<ul></ul>
	</div>
	<div id="kk-div"
		style="display: none; top: 72%; position: fixed; right: 11%;">
		<div class="cenav">
			<ul>
				<li class="ce-o ce-li2"><img
					src="<%=root%>/view/blue/images/kk.jpg"></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="<%=root%>/view/blue/js/lunbo.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/zzsc.js"></script>
<script type="text/javascript"
	src="<%=root%>/view/blue/js/smallslider.js"></script>
<script type="text/javascript"
	src="<%=root%>/view/blue/js/jquery.nivo.slider.js"></script>
<script type="text/javascript"
	src="<%=root%>/view/blue/js/jquery.floatDiv.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/ag_two.js"></script>
</body>
</html>

