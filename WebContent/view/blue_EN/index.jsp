﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<%
   
	String photo =application.getInitParameter("photo");
	String root = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Western China (SiChuan) Import Expo & International Investment Fair</title>
<meta name ="keywords" content="进口展，中国西部，西部进口展">
<meta name="description" content="中国西部进口展" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<%-- <link rel="stylesheet" href="<%=root%>/view/blue_EN/css/nivo-slider.css" type="text/css" media="screen" /> --%>
<link rel="stylesheet" href="<%=root%>/view/blue_EN/css/zzsc.css" type="text/css" media="screen" />
<link type="text/css" href="<%=root%>/view/blue_EN/css/lunbo.css" rel="stylesheet"> 
<link type="text/css" href="<%=root%>/view/blue_EN/css/pic-scroll.css" rel="stylesheet"> 

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
			               <img src="<%=root%>/view/blue_EN/images/sy_10.png">
									<h3>News</h3>
									<span> • Trend</span>
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
									<a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087d84c7ddfd7014c7df3d0880001&menuId=2c9087d84c7ddfd7014c7df48bc10002">News</a>
								</h3></span> <!-- <span class="tit-bg02" data-role="notice_"><h3
									class="zt">
									<a href="#">Notice</a>
								</h3></span> <span class="tit-bg02" data-role="dynamic_"><h3
									class="zt">
									<a href="#">Trends</a>
								</h3></span> -->
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
			            <div class="b-km zt">From the opening on October 23, 2015&nbsp&nbspCountdown <b id="dayto"></b>days</div>
			            <a href="<%=root%>/view/blue_EN/404.jsp"><img src="<%=root%>/view/blue_EN/images/sy0_0.png" ></a>
			            <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=8&currentId=2c9087ef4c7e0ae8014c7e0f00510001&menuId=2c9087ef4c7e0ae8014c7e1135680004"><img src="<%=root%>/view/blue_EN/images/sy0_5.png" onmouseover="btnt(this)" onmouseout="btnt2(this)"></a>
			            <a href="<%=root%>/view/blue_EN/404.jsp"><img src="<%=root%>/view/blue_EN/images/sy0_6.png" onmouseover="btnf(this)" onmouseout="btnf2(this)"></a>
			            <a href="<%=root%>/view/blue_EN/404.jsp"><img src="<%=root%>/view/blue_EN/images/sy0_7.png" onmouseover="btns(this)" onmouseout="btns2(this)"></a>
			       </div>
			</div>
		</div>

<div class="box">
    <div class="expo-left">
    <div class="c-tit">
          <div class="ctit-l">
              <div class="new-t">
                 <img src="<%=root%>/view/blue_EN/images/sy_22.png">
                 <h3> Exhibitors</h3>
                <span> • Guide</span>
              </div>
              <span class="ctit-more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=4&menuId=2c9087ef4c7e0ae8014c7e0f00510001">more</a></span>
           </div>
         <div class="c-line">
             <div class="new-bule"></div>
         </div> 
    </div>
    <div class="c-nr">
       <ul class="expo">
           <li class="icon-venue">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=1&currentId=2c9087ef4c7e0ae8014c7e0f00510001&menuId=2c9087ef4c7e0ae8014c7e10b46d0003">
               <i></i>
               <span>Venue guide</span></a>
           </li>
            <li class="icon-ser">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087ef4c7e0ae8014c7e0f00510001&menuId=2c9087ef4c7e0ae8014c7e122f6f0005">
                <i></i>
               <span>Service </span></a>
           </li>
            <li class="icon-expo">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=7&currentId=2c9087ef4c7e0ae8014c7e0f00510001&menuId=2c9087ef4c7e0ae8014c7e12c9c40006">
               <i></i>
               <span> Exhibition Category </span></a>
           </li>
       </ul>
    </div>
    </div>
    <div class="expo-r">
        <div class="c-tit">
          <div class="ctit-l">
              <div class="new-t">
                 <img src="<%=root%>/view/blue_EN/images/sy_20.png">
                 <h3>Buyers</h3>
                <span> • Guide</span>
              </div>
              <span class="ctit-more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=5&menuId=2c9087ef4c7e0ae8014c7e1ad6e30008">more</a></span>
           </div>
         <div class="c-line">
             <div class="new-bule"></div>
         </div> 
    </div>
         <div class="c-nr">
        <ul class="expo">
           <li class="icon-light">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=1&currentId=2c9087ef4c7e0ae8014c7e1ad6e30008&menuId=2c9087ef4c7e0ae8014c7e1bf1c50009">
               <i></i>
               <span>Highlights</span>
              </a>
           </li>
            <li class="icon-guide">
               <a href="<%=root+"/"+shortUrl %>/article/main?nav_type=2&currentId=2c9087ef4c7e0ae8014c7e1ad6e30008&menuId=2c9087ef4c7e0ae8014c7e1d35f2000a">
                <i></i>
                <span>Guide </span></a>
           </li>
            <li class="icon-supp">
               <a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&currentId=2c9087ef4c7e0ae8014c7e1ad6e30008&menuId=2c9087ef4c7e0ae8014c7e206ade000b">
                <i></i>
                <span>Supporting services</span>
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
						<img src="<%=root%>/view/blue_EN/images/sy_51.png">
						<h3>Activities</h3>
						<span> • Guide</span>
					</div>
					<span class="ctit-more"><a href="<%=root %>/article/main?nav_type=0&currentId=2c9087ef4c7e0ae8014c7e237a9d000d&menuId=2c9087ef4c7e0ae8014c7e26b8de000f">more</a></span>
				</div>
				<div class="b-line">
					<div class="new-bule"></div>
				</div>
			</div>
			<div class="suc-nr">
			    <div class="activ"><h3 class="sy-h zt">Key activities</h3><a href="<%=root +"/"+shortUrl%>/article/main?nav_type=0&currentId=2c9087ef4c7e0ae8014c7e237a9d000d&menuId=2c9087ef4c7e0ae8014c7e24e63b000e"><img src="<%=root %>/view/blue_EN/images/sy4_20.png" class="sy-btn"></a></div>
				<ul class="suc-ul">
					<li class="suc-ul-header">
						<table>
							<td width="45%">Activity</td>
							<td width="20%">Date</td>
							<td width="35%">Place</td>
						</table>
					</li>
				</ul>
			</div>
		</div>

		<div class="box">
			<div class="b-tit">
				<div class="btit-l">
					<div class="new-t">
						<img src="<%=root%>/view/blue_EN/images/sy_55.png">
						<h3>Business & Travel</h3>
						<span> • Services</span>
					</div>
					<span class="ctit-more"><a href="<%=root+"/"+shortUrl%>/article/main?nav_type=3&menuId=2c9087ef4c7e0ae8014c7e36ca0b0018">more</a></span>
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
                 <img src="<%=root%>/view/blue_EN/images/sy_55.png">
                 <h3>Cooperation</h3>
                <span> • Partners</span>
              </div>
              <!-- <span class="ctit-more"><a href="#">more</a></span> -->
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
                 <img src="<%=root%>/view/blue_EN/images/sy_81.png">
                 <h3>Friendly</h3>
                <span> • Links</span>
              </div>
             <!-- <span class="ctit-more"><a href="#">more</a></span> -->
           </div>
         <div class="b-line">
             <div class="new-bule"></div>
         </div> 
    </div>
    <div class="yq-nr" id="out_link">
        

    </div>
</div>

<%@ include file="index_foot.jsp"%>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/lunbo.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/smallslider.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/ag_index.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/zzsc.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue/js/jquery.img_silder.js"></script>
<%-- <script type="text/javascript" src="<%=root%>/view/blue_EN/js/jquery.nivo.slider.js"></script> --%>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/jquery.floatDiv.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/index.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/partner.js"></script>

</body>
</html>

