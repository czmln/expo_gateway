<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<%@ include file="constants.jsp"%>
<meta charset="UTF-8">
<meta name="author" content="Double.L QQ:563147804">
<!-- IE Hack -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<!-- 360 Hack -->
<meta name="renderer" content="webkit">
<title>首页-四川农业博览会暨成都国际都市现代农业博览会</title>
<meta name="keywords" content="农博会，农业博览会，四川农业博览会，成都国际都市现代农业博览会，第三届四川农业博览会暨成都国际都市现代农业博览会，西博会，进口展
">
<meta name="description" content="第三届四川农业博览会暨成都国际都市现代农业博览会由四川省政府主办的国家级农业博览会。由四川博览事务局承办，四川博览事务局负责中国西部国际博览会的总体策划和中国西部国际合作论坛等重大活动的组织实施。">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/reset.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/layout.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/style.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/pic-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/bootstrap.min.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/icon.css" media="all">
<!--[if lte IE 6]>
<link rel="stylesheet" type="text/css"   href="<%=root%>/view/nbh/css/bootstrap-ie6.min.css" media="all">
<link rel="stylesheet" type="text/css"   href="<%=root%>/view/nbh/css/ie.css" media="all">
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/animate.min.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/slider.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/news-slider.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/back-top.css" media="all">
<!-- Fonts -->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/font-awesome.min.css" media="all">
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="css/font-awesome-ie7.min.css" media="all">	
<![endif]-->


<!-- javascript -->
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/ui.js"></script>
<!--[if lt IE 9]>
   <script type="text/javascript" src="<%=root%>/view/nbh/scripts/bootstrap-ie.js"></script>
   <script type="text/javascript" src="<%=root%>/view/nbh/scripts/html5shiv.min.js"></script>
   <script type="text/javascript" src="<%=root%>/view/nbh/scripts/respond.min.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="head.jsp"%>
<!-- Header end -->
<div class="News">
  <div class="time-wapper">
    <div class="container">
      <div class="time">
        <h3><i class="icon-time"></i>距离大会2015年11月19日开幕还有<font id="dayto">128</font>天</h3>
      </div>
    </div>
  </div>
  <div class="container">
  	<div class="row">
    <div class="col-xs-4">
      <h2 class="module-title"><strong><i class="icons-pic-news"></i>新闻中心</strong></h2>
      <div id="box">
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="bigUl"></ul>
        <ul class="numberUl"></ul>
        <ul class="textUl"></ul>
      </div>
    </div>
    <div class="col-xs-5">
      <ul class="tab-menu">
        <li data-rule="news" class="active"><a href="javascript:void(0);">新闻</a></li>
        <li data-rule="notice" ><a href="javascript:void(0);">公告</a></li>
        <li data-rule="dynamic" ><a href="javascript:void(0);">行业动态</a></li>
      </ul>
      <div class="tab-content news"></div>
      <div class="tab-content notice" style="display:none;"></div>
      <div class="tab-content dynamic" style="display:none;"></div>
    </div>
    <div class="col-xs-3">
      <ul class="pic-button-list">
        <li><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087c24d4bbac0014d4bc5d7e00006&menuId=2c9087c24d4bbac0014d4bc7cafe000c" class="btn01"><span>我要报名</span><small>Registration</small></a></li>
        <li><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=0&menuId=2c9087c24d4bbac0014d4bcbfb920019" class="btn02"><span>下载中心</span><small>Download</small></a></li>
        <li><a href="<%=root%>/view/blue/404.jsp" class="btn03"><span>交流互动</span><small>Interaction</small></a></li>
        <li><a href="<%=root%>/view/blue/404.jsp" class="btn04"><span>志愿者服务</span><small>Volunteers</small></a></li>
      </ul>
    </div>
    <div class="clearfix"></div>
    </div>
  </div>
</div>
<!-- News end -->
<div class="pic-link">
  <div class="container topadv"> <a href="javascript:void(0);"> <img src="<%=root%>/view/nbh/images/review/test1.jpg" alt=""> </a> </div>
</div>
<!-- Pic link end -->
<div class="user-module">

  <div class="container"><div class="row">
    <div class="col-xs-6">
      <h2 class="module-title"><span class="more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=0&menuId=2c9087c24d4bbac0014d4bc5d7e00006">更多&raquo;</a></span><strong><i class="icons-pic-exhibitors"></i>参展商<small>/指引</small></strong></h2>
      <div class="list-item">
        <div class="col-xs-3"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=1&currentId=2c9087c24d4bbac0014d4bc5d7e00006&menuId=2c9087c24d4bbac0014d4bc68ac50008"> <span class="pic-icon68 icon-pic-venue"></span>
          <p>场馆指引</p>
          </a></div>
        <div class="col-xs-3"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087c24d4bbac0014d4bcbfb920019&menuId=2c9087c24d4bbac0014d4bcc6de7001a"> <span class="pic-icon68 icon-pic-guide"></span>
          <p>参展指南</p>
          </a></div>
        <div class="col-xs-3"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087c24d4bbac0014d4bc5d7e00006&menuId=2c9087c24d4bbac0014d4bc76e85000b"> <span class="pic-icon68 icon-pic-voice"></span>
          <p>参展服务</p>
          </a></div>
        <div class="col-xs-3"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087c24d4bbac0014d4bc5d7e00006&menuId=2c9087954c0d308c014c0d3c78c60005"> <span class="pic-icon68 icon-pic-product"></span>
          <p>参展商品</p>
          </a></div>
      </div>
    </div>
    <div class="col-xs-6">
      <h2 class="module-title"><span class="more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=0&menuId=2c9087c24d4bbac0014d4bcda319001e" >更多&raquo;</a></span><strong><i class="icons-pic-buyers"></i>采购商<small>/指引</small></strong></h2>
      <div class="list-item">
        <div class="col-xs-3"><a href="javascript:void(0);"> <span class="pic-icon68 icon-pic-idear"></span>
          <p>观展理由</p>
          </a></div>
        <div class="col-xs-3"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087c24d4bbac0014d4bcda319001e&menuId=2c9087c24d4bbac0014d4bcddcc5001f"> <span class="pic-icon68 icon-pic-guide"></span>
          <p>观展指南</p>
          </a></div>
        <div class="col-xs-3"><a href="javascript:void(0);"> <span class="pic-icon68 icon-pic-services"></span>
          <p>配套服务</p>
          </a></div>
        <div class="col-xs-3"><a href="javascript:void(0);"> <span class="pic-icon68 icon-pic-matching"></span>
          <p>贸易匹配</p>
          </a></div>
      </div>
    </div>
    </div>
  </div>
</div>
<!-- User end -->
<div class="pic-link">
  <div class="container middleadv"> <a href="javascript:void(0);"> <img src="<%=root%>/view/nbh/images/review/test2.jpg" alt=""> </a> </div>
</div>
<!-- Pic link end -->
<%-- <div class="activity">
  <div class="container">
    <div class="row">
      <h2 class="module-title buyers-title"><span class="more"><a href="<%=root+"/"+shortUrl %>/article/main?nav_type=0&currentId=2c9087c24d4bbac0014d4bcad2b90015&menuId=2c9087c24d4bbac0014d4bcb29f30016">更多&raquo;</a></span><strong><i class="icons-pic-activities"></i>展会活动<small>/指引</small></strong></h2>
      <ul class="suc-ul">
             		<li class="suc-ul-header">
             			<table>
             				<td width="40%">活动名称</td>
             				<td width="20%">日期</td>
             				<td width="40%">地点</td>
             			</table>
             		</li>
     </ul>
    </div>
  </div>
</div> --%>
<div class="activity">
  <div class="container">
    <div class="row panel-group">
      <h2 class="module-title"><span class="more"><a href="<%=root+"/"+shortUrl %>/article/main?nav_type=0&currentId=2c9087c24d4bbac0014d4bcad2b90015&menuId=2c9087c24d4bbac0014d4bcb29f30016">更多&raquo;</a></span><strong><i class="icon_Activities"></i>展会活动<small>/指引</small></strong></h2>
    </div>
  </div>
</div>
<!-- activity end -->
<div class="pic-link">
  <div class="container bottomadv"> <a href="javascript:void(0);"> <img src="<%=root%>/view/nbh/images/review/test2.jpg" alt=""> </a> </div>
</div>
<!-- Pic link end -->
<div class="services">
  <div class="container">
    <div class="row">
      <h2 class="module-title"><span class="more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&menuId=2c9087c24d4bbac0014d4bc834dc000d">更多&raquo;</a></span><strong><i class="icons-pic-services"></i>展会服务<small>/指引</small></strong></h2>
      <c:forEach items="${adverts}" var="val" begin="0" end="5" varStatus="s">
	       <div class="col-xs-2"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=${val.navType}&currentId=${val.menubar_id}&menuId=${val.id}"> <span class="pic-icon68 icon-pic-${s.index}"><img src="<%=photo%>${val.coverImg}"/></span>
	        <p>${val.name}</p>
	        </a>
	       </div>
       </c:forEach>
       <div class="col-md-2"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&menuId=2c9087c24d4fca6b014d515cd3c80028"> <span class="pic-icon68"><img src="/view/nbh/images/icons/icon-matching.png"/></span>
	        <p>赞助合作</p>
	        </a>
	   </div>
    </div>
  </div>
</div>
<!-- Services end -->
<div class="firend">
  <div class="container">
  		<div class="row">
    		<h2 class="module-title"><span class="more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&menuId=2c9087c24d4fca6b014d515cd3c80028">更多&raquo;</a></span><strong><i class="icons-pic-partners"></i>合作伙伴<small>/指引</small></strong></h2>
    	</div>
    <div class="row partner"></div>
  </div>
</div>
<!-- firend end -->
<div class="finrend">
  <div class="container">
  	<div class="row">
	    <h2 class="module-title2"><strong>友情链接</strong></h2>
	    <div class="link-wapper">
	    	<ul class="outlink"></ul>
    	</div>
    </div>
  </div>
</div>
<!-- Links end -->
<%@ include file="foot.jsp"%>
<!-- Footer end --> 
<!-- GO Top -->
<div id="moquu_wxin" class="moquu_wxin"><a href="javascript:void(0)">站长素材
  <div class="moquu_wxinh"></div>
  </a></div>
<div id="moquu_wshare" class="moquu_wshare"><a href="javascript:void(0)">站长素材
  <div class="moquu_wshareh"></div>
  </a></div>
<div id="moquu_wmaps"><a href="javascript:void(0)" class='moquu_wmaps'>站长素材</a></div>
<a id="moquu_top" href="javascript:void(0)"></a> 
<!-- Javascripts --> 


<!-- slider --> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.themepunch.plugins.min.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.themepunch.revolution.min.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.bxslider.min.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/app.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/index.js"></script> 
<!-- news-slider --> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/news-slider.js"></script> 
<!-- back-top --> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/back-top.js"></script>
</body>
</html>