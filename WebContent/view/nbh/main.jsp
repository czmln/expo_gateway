<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<%@ include file="constants.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- IE Hack -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<!-- 360 Hack -->
<meta name="renderer" content="webkit">
<meta charset="UTF-8">
<meta name="author" content="Double.L QQ:563147804">
<title>首页-四川农业博览会暨成都国际都市现代农业博览会</title>
<meta name="keywords" content="关键词">
<meta name="description" content="站点描述">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/reset.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/layout.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/style.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/pic-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/bootstrap.min.css" media="all">
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css"   href="<%=root%>/view/nbh/css/bootstrap-ie6.min.css" media="all">
<link rel="stylesheet" type="text/css"   href="<%=root%>/view/nbh/css/ie.css" media="all">
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/animate.min.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/slider.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/news-slider.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/back-top.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/pagination.css" media="all">
<!-- Fonts -->
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" media="all">
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="css/font-awesome-ie7.min.css" media="all">	
<![endif]-->
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/utils.js"></script>
<!--[if lt IE 9]>
   <script type="text/javascript" src="<%=root%>/view/nbh/scripts/bootstrap-ie.js"></script>
   <script type="text/javascript" src="<%=root%>/view/nbh/scripts/html5shiv.min.js"></script>
   <script type="text/javascript" src="<%=root%>/view/nbh/scripts/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.pagination.js"></script>
</head>
<body>
<header class="sub">
<div class="header">
  <div class="container">
    <div class="row header">
      <div class="col-xs-6"><a href="javascript:void(0);" class="logo">&nbsp;</a></div>
      <div class="col-xs-6">
        <div class="swicth-link"><span><a href="<%=root+"/"+shortUrl%>">简体中文</a><em>|</em><a href="javascript:void(0);">English</a></span><span><a href="javascript:void(0);">注册</a><em>|</em><a href="javascript:void(0);">登录</a></span> </div>
        <div class="searchWarp">
          <div class="search_start">
            <div class="search_cont">
              <form action="" method="get">
                <input type="text" name="key" class="in_search" autocomplete="off" value="搜索">
                <input type="submit" class="in_submit" value="&nbsp;">
                <i class="icon-search"></i>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- top-rignt end -->
      <div class="clearfix"></div>
    </div>
    <!-- row end --> 
  </div>
</div>
  <!-- container end -->
  <div class="ex-banner banner"><img id="agImg" src="<%=root%>/view/nbh/images/review/slider/exro_02.jpg"></div>
  <!-- slider end -->
  <div class="navbar-wapper">
    <div class="container menu-bar">
      <ul class="nvabar">
        <li><a href="<%=root+"/"+shortUrl%>">首页</a>
      </ul>
    </div>
  </div>
</header>
<!-- Header end -->
<!-- path end -->
<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh">
</script>
<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/bshareC0.js">
</script>
<div class="exhib-box">
	<div class="container">
	<div class="path">
		当前位置：<a href="<%=root+"/"+shortUrl%>">首页</a> > <a href="javascript:void(0);"></a> > <a href="javascript:void(0);">采访服务</a>
	</div>
	<div class="exhib">
		<div class="exhib-left">
			<div class="exhib-con">
				<div class="e-tit">
					<i class="e-icon"></i><h3></h3>
				</div>
				<div class="e-content">
					<ul>
					</ul>
				</div>
			</div>
		</div>
		<div class="exhib-right">
			<div class="r-tit">
				<h2></h2>
				<span id="description" style="display:none;">来源：<font></font>   &nbsp; &nbsp; &nbsp; &nbsp;日期：<font></font></span>
			</div>
			<div id="articleView"></div>
			<div class="bshare-custom" style="float:right;display:none;">
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
</div>
<%@ include file="foot.jsp"%>
</body>
<script type="text/javascript">
$(function(){
	// 顶部导航
	getMenuBarByType();
	// 左侧一级导航
	getMenubarById();
	// 左侧二级导航
	getMenubarsByMenuId();
	//搜索
	$(".in_search").click(function(){
		$(".search_cont").addClass('ser').animate({
			width:200,
		},200);
		if($(this).val() == '搜索'){
			$(".in_search").val('');
		}
	})
	$(".in_search").blur(function(){
		if($(this).val() !== ''){
			return false;
		}
		$(".search_cont").removeClass('ser').animate({
			width:80,
		},200);
		$(".in_search").val('搜索');
	});
});

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
			}else{
				$('#agImg').attr("src",root + '/view/nbh/images/review/slider/exro_02.jpg');
			}
		}
	});
}

function changeTitle(name){
	document.title = name + "-四川农业博览会暨成都国际都市现代农业博览会";
}

function getMenuBarByType(){
	var menuId = '${menuId}';
	var currentId = '${currentId}'; 
	if(currentId == 'null'){
		currentId = menuId;
	}
	
	$.ajax({
		url:root +"/"+shortUrl+ "/menubar/getMenubarsByType.do",
		dataType:"json",
		type:"GET",
		success:function(data){
			$('.nvabar li').removeClass('active');
			if(data && data!=null && data.length>0){
				$.each(data,function(i,val){
					var node1 = $('<li><a href="javascript:void(0);"></a><ul class="sub-navbar"></ul></li>');
					node1.hover(
						function(mouseover){
						$(this).find(".sub-navbar").slideDown(100);
					   },
					   function(mouseout){
						$(this).find(".sub-navbar").slideUp(100);
					   }
					).find('a').html(val.name).attr('href',root+'/'+shortUrl+'/article/main?nav_type='+val.navType+'&menuId='+val.id);
					if(val.id == currentId){
						node1.addClass('active');
					}
					if(val.children && val.children!=null && val.children.length>0){
						$.each(val.children,function(j,va){
							var node2 = $('<li><a href="javascript:void(0);"></a></li>');
							node2.find('a').html(va.name).attr('href',root+'/'+shortUrl+'/article/main?nav_type='+va.navType+'&currentId='+val.id+'&menuId='+va.id);
							node1.find('.sub-navbar').append(node2);
						});
					}
					$('.nvabar').append(node1);
				});
			}
		}
	});
}

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
		type:"GET",
		success:function(data){
			$(".e-content ul").empty();
		    $.each(data,function(i,val){
		    	var node = $('<li><i class="l-icon"></i><a href="javascript:void(0);"></a></li>');
		    	node.find('a').html(val.name);
				$(".e-content ul").append(node);
				if(currentId == 'null'&&i == 0){
					viewId = val.id;
					if(nav_type != '6'){
						nav_type = val.navType;
					}
					back_id = val.id;
					back_type = val.navType;
					$('.path a:eq(2)').html(val.name);
					$('.r-tit h2').html(val.name);
					node.addClass('active');
				}else if(currentId != 'null'&&val.id == menuId){
					viewId = val.id;
					if(nav_type != '6'){
						nav_type = val.navType;
					}
					back_type = val.navType;
					back_id = val.id;
					$('.path a:eq(2)').html(val.name);
					$('.r-tit h2').html(val.name);
					node.addClass('active');
				}
				node.click(function(){
					$('.path a:eq(2)').html(val.name);
					$('.r-tit h2').html(val.name);
					back_type = val.navType;
					back_id = val.id;
					$(".e-content ul li").removeClass('active');
					$(this).addClass('active');
					getView(val.navType,val.id,articleId);
				});
			});
			
			getView(nav_type,viewId,articleId);

		}
		
	}); 
}

function getMenubarById() {
	var menuId = '${menuId}';
	var currentId = '${currentId}'; 
	if(currentId == 'null'){
		currentId = menuId;
	}
	getImg(currentId);
	$.ajax({
		url:root + "/"+shortUrl+"/menubar/getById?menuId="+currentId,
		dataType:"json",
		type:"GET",
		success:function(data){
			changeTitle(data.name);
			$('.e-tit h3').html(data.name);
			$('.path a:eq(1)').html(data.name);
		}
	});
}
function getView(type,menuId,articleId,current_page) {
	if(!current_page){
		current_page = 0;
	}
	$("#articleView").load(root + '/' + shortUrl + "/article/getView?menuId=" + menuId + "&nav_type="
							+ type + "&articleId=" + articleId
							+ "&current_page=" + current_page, function() {
	     $('.bshare-custom').hide();
	});
}
</script>
</html>