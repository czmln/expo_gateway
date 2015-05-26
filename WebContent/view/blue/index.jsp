<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String photo =application.getInitParameter("photo");
    String root=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国西部(四川)进口展暨国际投资大会</title>
<meta name ="keywords" content="进口展，中国西部，西部进口展">
<meta name="description" content="中国西部进口展" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<%-- <link rel="stylesheet" href="<%=root%>/view/blue/css/nivo-slider.css" type="text/css" media="screen" /> --%>
<link rel="stylesheet" href="<%=root%>/view/blue/css/zzsc.css" type="text/css" media="screen" />
<link type="text/css" href="<%=root%>/view/blue/css/lunbo.css" rel="stylesheet">
<link type="text/css" href="<%=root%>/view/blue/css/pic-scroll.css" rel="stylesheet">  

</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="silder" id="silder">
		<ul class="silder_list" id="silder_list">
		</ul>
	</div>
	<!-- <div class="slide">
			<div id="header">
			   			<div class="ribbon"></div>    
			   			<div id="slider" class="nivoSlider sliderid"  style="height:230px;"> 
			   				
			   			</div> 
			</div>
    </div> -->
    
    
		<div class="box">
			<div class="box-left">
				<div class="box-new">
				 <div class="box-l">
			        <div class="new-tit">
			           <div class="ntit-l">
			            <div class="new-t">
			               <img src="<%=root%>/view/blue/images/sy_10.png">
									<h3>新闻</h3>
									<span> • 动态</span>
							</div>
							</div>
							<div class="new-line">
								<div class="new-bule"></div>
							</div>
						</div>
					    	<div style="padding-top: 10px;margin-left: -5px;" >
					        <div id="banner"> 
							<div id="banner_bg"></div><!--标题背景-->
							<div id="banner_info"  ></div><!--标题-->
							<ul id="banner_index"></ul>
							<div id="banner_list"></div>
							</div>
					    </div>
					   
					</div>
					<div class="box-m">
						<div class="n-tit">
							<span class="tit-bg01" data-role="news_"><h3 class="zt">
									<a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=402882264c0bb593014c0bbbe80f0000&menuId=402882264c0bb593014c0bbf30b60002">新闻</a>
								</h3></span><span class="tit-bg02" data-role="notice_"><h3
									class="zt">
									<a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=402882264c0bb593014c0bbbe80f0000&menuId=2c9087954c0ce14b014c0d22b5dd0000">公告</a>
								</h3></span> <span class="tit-bg02" data-role="dynamic_"><h3
									class="zt">
									<a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=402882264c0bb593014c0bbbe80f0000&menuId=2c9087954c0ce14b014c0d23833c0002">行业动态</a>
								</h3></span>
						</div>
						<div class="n-nr">
							<ul class="news_" style="display: block;"></ul>
							<ul class="notice_" style="display: none;"></ul>
							<ul class="dynamic_" style="display: none;"></ul>
						</div>
					</div>
				</div>
				<!-- <div class="new-ad " id ="center"></div> -->
			</div>
			<div class="box-right">
       
			       <div class="box-btn">
			            <div class="b-km zt">距大会2015年10月23日开幕<br>还有<b id="dayto">205</b>天</div>
			            <a href="<%=root%>/view/blue/404.jsp"><img src="<%=root%>/view/blue/images/sy3_06.png" ></a>
			            <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=8&currentId=2c9087954c0ce14b014c0d2bd5810003&menuId=2c9087954c0d308c014c0d3c157f0004"><img src="<%=root%>/view/blue/images/sy3_09.png" onmouseover="btnt(this)" onmouseout="btnt2(this)"></a>
			            <a href="<%=root%>/view/blue/404.jsp"><img src="<%=root%>/view/blue/images/sy3_11.png" onmouseover="btnf(this)" onmouseout="btnf2(this)"></a>
			            <a href="<%=root%>/view/blue/404.jsp"><img src="<%=root%>/view/blue/images/sy3_13.png" onmouseover="btns(this)" onmouseout="btns2(this)"></a>
			       </div>
			</div>
		</div>

<div class="box">
    <div class="expo-left">
    <div class="c-tit">
          <div class="ctit-l">
              <div class="new-t">
                 <img src="<%=root%>/view/blue/images/sy_22.png">
                 <h3>参展商</h3>
                <span> • 指引</span>
              </div>
              <span class="ctit-more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=4&menuId=2c9087954c0ce14b014c0d2bd5810003">更多>></a></span>
           </div>
         <div class="c-line">
             <div class="new-bule"></div>
         </div> 
    </div>
    <div class="c-nr">
       <ul class="expo">
           <li class="icon-venue">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=1&currentId=2c9087954c0ce14b014c0d2bd5810003&menuId=2c9087954c0d308c014c0d3bb9f80003">
               <i></i>
               <span>场馆指引</span></a>
           </li>
            <li class="icon-ser">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087954c0ce14b014c0d2bd5810003&menuId=2c9087954c0d308c014c0d3c78c60005">
                <i></i>
               <span>参展服务 </span></a>
           </li>
            <li class="icon-expo">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=2&currentId=2c9087954c0ce14b014c0d2bd5810003&menuId=2c9087954c0d308c014c0d3cd3da0006">
               <i></i>
               <span> 展商展品 </span></a>
           </li>
       </ul>
    </div>
    </div>
    <div class="expo-r">
        <div class="c-tit">
          <div class="ctit-l">
              <div class="new-t">
                 <img src="<%=root%>/view/blue/images/sy_20.png">
                 <h3>采购商</h3>
                <span> • 指引</span>
              </div>
              <span class="ctit-more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=5&menuId=2c9087954c0ce14b014c0d2c2af10004">更多>></a></span>
           </div>
         <div class="c-line">
             <div class="new-bule"></div>
         </div> 
    </div>
         <div class="c-nr">
        <ul class="expo">
           <li class="icon-light">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=1&currentId=2c9087954c0ce14b014c0d2c2af10004&menuId=2c9087954c0d308c014c0d3d4a9b0008">
               <i></i>
               <span>观展理由</span>
              </a>
           </li>
            <li class="icon-guide">
               <a href="<%=root+"/"+shortUrl %>/article/main?nav_type=2&currentId=2c9087954c0ce14b014c0d2c2af10004&menuId=2c9087954c0d308c014c0d3d88290009">
                <i></i>
                <span>参观指南 </span></a>
           </li>
            <li class="icon-supp">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=6&currentId=2c9087954c0ce14b014c0d2c2af10004&menuId=53156ee04c984811014c9c13d6cc0023">
                <i></i>
                <span>配套服务</span>
               </a>
           </li>
       </ul>
    </div>
    </div>
</div>

<div class="box" id="center">
    
</div>
		<div class="box">
			<div class="b-tit">
				<div class="btit-l">
					<div class="new-t">
						<img src="<%=root%>/view/blue/images/sy_51.png">
						<h3>活动</h3>
						<span> • 指引</span>
					</div>
					<span class="ctit-more"><a href="<%=root+"/"+shortUrl %>/article/main?nav_type=0&currentId=2c9087954c0ce14b014c0d2c64940005&menuId=2c9087954c0d308c014c0d3eb54c000d">更多>></a></span>
				</div>
				<div class="b-line">
					<div class="new-bule"></div>
				</div>
			</div>
			<div class="suc-nr">
			    <div class="activ"><h3 class="sy-h zt">重大活动</h3><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=1&currentId=2c9087954c0ce14b014c0d2c64940005&menuId=2c9087954c0d308c014c0d3e7933000c"><img src="<%=root %>/view/blue/images/sy4_20.png" class="sy-btn"></a></div>
				<ul class="suc-ul">
					<li class="suc-ul-header">
						<table>
							<td width="45%">活动名称</td>
							<td width="20%">日期</td>
							<td width="35%">地点</td>
						</table>
					</li>
				</ul>
			</div>
		</div>

		<div class="box">
			<div class="b-tit">
				<div class="btit-l">
					<div class="new-t">
						<img src="<%=root%>/view/blue/images/sy_55.png">
						<h3>商旅</h3>
						<span> • 服务</span>
					</div>
					<span class="ctit-more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&menuId=2c9087954c0d308c014c0d39546b0000">更多>></a></span>
				</div>
				<div class="b-line">
					<div class="new-bule"></div>
				</div>
			</div>
			<div class="sl-nr">
				<ul id="sl-nr-id">
					<c:forEach items="${adverts}" var="val" begin="0" end="5" varStatus="s">
						<li class="sl-details">
							<div class="sl-li icon-${s.index}">
								<a href="<%=root+"/"+shortUrl%>/article/main?nav_type=${val.navType}&currentId=${val.menubar_id}&menuId=${val.id}">
									<img src="<%=photo%>${val.coverImg}" title="${val.name}" alt="${val.name}" width="70" height="95">
								</a>
							</div>
							<div class="sl-k">
								<h3 class="zt">${val.name}</h3>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>


<div class="box">
    <div class="b-tit">
          <div class="btit-l">
              <div class="new-t">
                 <img src="<%=root%>/view/blue/images/sy_55.png">
                 <h3>合作</h3>
                <span> • 伙伴</span>
              </div>
              <!-- <span class="ctit-more"><a href="#">更多>></a></span> -->
           </div>
         <div class="b-line">
             <div class="new-bule"></div>
         </div> 
    </div>
    <div id="viewer" class="pic-scroll  hz-nr" >
          <ul></ul>
    </div>
</div>

<div class="box">
    <div class="b-tit">
          <div class="btit-l">
              <div class="new-t">
                 <img src="<%=root%>/view/blue/images/sy_81.png">
                 <h3>友情</h3>
                <span> • 链接</span>
              </div>
             <!-- <span class="ctit-more"><a href="#">更多>></a></span> -->
           </div>
         <div class="b-line">
             <div class="new-bule"></div>
         </div> 
    </div>
    <div class="yq-nr" id="out_link">
        
        
    </div>
</div>

<%@ include file="index_foot.jsp"%>
<script type="text/javascript" src="<%=root%>/view/blue/js/lunbo.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/smallslider.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/ag_index.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/zzsc.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/jquery.img_silder.js"></script>
<%-- <script type="text/javascript" src="<%=root%>/view/blue/js/jquery.nivo.slider.js"></script> --%>
<script type="text/javascript" src="<%=root%>/view/blue/js/jquery.floatDiv.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/index.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/partner.js"></script>

</body>
</html>

