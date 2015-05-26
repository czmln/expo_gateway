<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String keyword=(String)request.getAttribute("keyword");
%>
<!doctype html>
<html>
<head>
<%@ include file="constants.jsp"%>
<meta charset="UTF-8">
<meta name="author" content="Double.L">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- IE Hack -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<!-- 360 Hack -->
<meta name="renderer" content="webkit">
<title>搜索结果-四川农业博览会暨成都国际都市现代农业博览会</title>
<meta name="keywords" content="关键词">
<meta name="description" content="站点描述">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/reset.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/layout.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/style.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/pic-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/bootstrap.min.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/animate.min.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/slider.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/news-slider.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/back-top.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/pagination.css" media="all">
<!-- Fonts -->
<link rel="stylesheet" type="text/css" href="<%=root%>/view/nbh/css/font-awesome.min.css" media="all">
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="css/font-awesome-ie7.min.css" media="all">	
<![endif]-->
<!-- javascript -->
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.themepunch.plugins.min.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.themepunch.revolution.min.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/jquery.bxslider.min.js"></script> 
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/app.js"></script>
<script type="text/javascript" src="<%=root%>/view/nbh/scripts/ui.js"></script>
<header>
<div class="header">
  <div class="container">
    <div class="row header">
      <div class="col-md-6"><a href="<%=root+"/"+shortUrl%>" class="logo">&nbsp;</a></div>
      <div class="col-md-4">
        <div class="swicth-link"><span><a href="<%=root+"/"+shortUrl%>">简体中文</a><em>|</em><a href="javascript:void(0);">English</a></span><span><a href="javascript:void(0);">注册</a><em>|</em><a href="javascript:void(0);">登录</a></span> </div>
        <div class="searchWarp">
          <div class="search_start">
            <div class="search_cont">
              <form action="<%=root+"/"+shortUrl%>/article/searchArticlePage.do" method="POST">
              	<input name="tag" type=hidden value="nbh">
                <input type="text" name="keyword" class="in_search" autocomplete="off" value="搜索">
                <input type="submit" class="in_submit" onclick="sub()">
                <i class="icon-search"></i>
              </form>
              <script type="text/javascript">
              	function sub(){
            	
	            	if($(".insearch").val()=="")
	            	{
	            	  return;
	            	}
	            	$('.in_submit').click();
              }
            </script>
            </div>
          </div>
        </div>
      </div>
      <!-- top-rignt end -->
      
    </div>
    <!-- row end --> 
  </div>
  </div>
  <!-- container end -->
   <div class="slider">
    <div class="fullwidthbanner-container slider-main">
      <div class="fullwidthabnner">
        <ul id="revolutionul" style="display:none;"></ul>
        <div class="tp-bannertimer tp-bottom"></div>
      </div>
    </div>
  </div>
  <!-- slider end -->
  <div class="navbar-wapper">
    <div class="container menu-bar">
      <ul class="nvabar">
        <li class="active"><a href="<%=root+"/"+shortUrl%>">首页</a></li>
      </ul>
    </div>
  </div>
  <div class="clearfix"></div>
</header>
<script>
var Index = function () {

    return {
        
        //Revolution Slider
        initRevolutionSlider: function () {
            var api;
			
				 //setTimeout("", 1000);
				 //jQuery('#revolutionul').show();
				 
		api =  $('.fullwidthabnner').revolution(
	                {
	                    delay:2000,
	                    startheight:380,
	                    startwidth:1150,

	                    hideThumbs:10,

	                    thumbWidth:100,                         // Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
	                    thumbHeight:50,
	                    thumbAmount:5,

	                    navigationType:"bullet",                // bullet, thumb, none
	                    navigationArrows:"solo",                // nexttobullets, solo (old name verticalcentered), none

	                    navigationStyle:"round",                // round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom


	                    navigationHAlign:"center",              // Vertical Align top,center,bottom
	                    navigationVAlign:"bottom",              // Horizontal Align left,center,right
	                    navigationHOffset:0,
	                    navigationVOffset:68,

	                    soloArrowLeftHalign:"left",
	                    soloArrowLeftValign:"center",
	                    soloArrowLeftHOffset:20,
	                    soloArrowLeftVOffset:-18,

	                    soloArrowRightHalign:"right",
	                    soloArrowRightValign:"center",
	                    soloArrowRightHOffset:20,
	                    soloArrowRightVOffset:-18,

	                    touchenabled:"on",                      // Enable Swipe Function : on/off
	                    onHoverStop:"on",                       // Stop Banner Timet at Hover on Slide on/off

	                    stopAtSlide:-1,
	                    stopAfterLoops:-1,

	                    hideCaptionAtLimit:0,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
						hideAllCaptionAtLilmit:0,				// Hide all The Captions if Width of Browser is less then this value
						hideSliderAtLimit:0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value

	                    shadow:1,                               //0 = no Shadow, 1,2,3 = 3 Different Art of Shadows  (No Shadow in Fullwidth Version !)
	                    fullWidth:"on"                          // Turns On or Off the Fullwidth Image Centering in FullWidth Modus
	                });
        }

    };
}();    
$(function(){
	getMenuBarByType();
	
	advertlist();
	
});

//广告
function advertlist(){
	$.ajax({
		url : root +"/"+shortUrl+"/ag/getAgByWebSiteName.do",
		dataType : "json",
		async:true,
		type : "post",
		success : function(data) {
			var index =0;
			var string='';
			$.each(data,function(i,val){
				var value=data[i].location
				var adUrl=data[i].url?data[i].url:root+"/"+shortUrl+"/ag/getContentPage?id="+data[i].id;
				if(value =="首页头部"){
					
					string+='<li data-transition="fade" data-slotamount="8" data-masterspeed="300" data-delay="6400" > <a href="'+adUrl+'" target="_blank"><img src="'+photo+data[i].picture+'" alt=""></a> </li>';
					
				}
			})
			
			$("#revolutionul").html(string);
			
			App.init();    
            App.initBxSlider();
            Index.initRevolutionSlider();
		}
	});
	
}

function getMenuBarByType(){
	
	$.ajax({
		url:root +"/"+shortUrl+ "/menubar/getMenubarsByType.do",
		dataType:"json",
		type:"GET",
		success:function(data){
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
					if(val.children && val.children!=null && val.children.length>0){
						$.each(val.children,function(j,va){
							var node2 = $('<li><a href="javascript:void(0);"></a></li>');
							node2.find('a').html(va.name).attr('href',root+'/'+shortUrl+'/article/main?nav_type='+va.navType+'&currentId='+val.id+'&menuId='+va.id);;
							node1.find('.sub-navbar').append(node2);
						});
					}
					$('.nvabar').append(node1);
				});
			}
		}
	});
}
</script>
	<%-- <div  class="slide slide1" style="width: 100%">
		<img id="advertImg" width="100%" src="<%=root%>/view/blue/images/search.jpg">
	</div> --%>
<!-- 	<div class="sbg">
		<div class="sbox">
			<div class="s-right" style="line-height:23px;">
				<div class="suc-tit">
					<h2 class="zt">搜索列表</h2>
					<div class="suc-r">
						<div id="page" style="display: none;" page=""></div>
						<span>当前位置：搜索列表&nbsp;&nbsp;<a id="goBack" style="display: none;"
							href="javascript:void(0);">返回上一级 ></a></span>
					</div>
				</div>
				<div class="suc-nr"><div id="content"></div></div>
			</div>
		</div>
	</div> -->
	<section class="exhib-box">
	<div class="container">
	 <div class="path">
		当前位置：<a href="<%=root+"/"+shortUrl%>">首页</a> >  搜索列表<a id="goBack" style="display: none;"
							href="javascript:void(0);">&nbsp;&nbsp;返回上一级 ></a>
	</div> 
	<div class="exhib">
	<div class="exhib-left">
			<div class="exhib-con">
				<div class="e-tit">
					<i class="e-icon"></i><h3>搜索列表</h3>
				</div>
				<div class="e-content">
					<ul>
					<li class="active"><i class="l-icon"></i><a href="javascript:void(0);">搜索列表</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="exhib-right">
			<div class="r-tit">
				<h2>搜索列表</h2>
				<!-- <span id="description" style="display:none;">来源：<font></font>   &nbsp; &nbsp; &nbsp; &nbsp;日期：<font></font></span> -->
			</div>
			<div id="articleView">
				<ul class="meadia"></ul>
<div id="Pagination" class="pagination" style="width:500px" align="center"></div>
			</div>
		</div>
   </div>
   </div>
</section>
<%@ include file="foot.jsp"%>
<script type="text/javascript">
var keyword="<%=keyword%>";

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
	$(function() {
		$("#goBack").click(function(){
			var pageStr = $('#page').prop('page');
			var current_page = pageStr && pageStr != null ? Number(pageStr) : 0;
			getSearchResult(current_page);
		});
		
		members = [];
		var perPageNum = 10;
		var pageStr = '${current_page}';
		var current_page;
 		$.ajax({
 			url : root+"/"+shortUrl+"/article/searchArticle.do",
 			dataType : "json",
 			data:{keyword:keyword},
 			type : "POST",
 			async:false,
 			success : function(data) {
 				$.each(data,function(i,val){
 					var member = [];
 					member.push(val.id);
 					member.push(val.author);
 					member.push(val.content);
 					member.push(val.coverImgUrl);
 					member.push(val.issuedDate);
 					member.push(val.place);
 					member.push(val.source);
 					member.push(val.time);
 					member.push(val.title);
 					member.push(val.menubar.id);
 					members.push(member);
 				});
 				current_page = pageStr != 'undefined' && pageStr !=null ? Number(pageStr) : 0;
 				$('#page').prop('page',current_page);
 				 var opt = {items_per_page:perPageNum,current_page:current_page, next_text: '下一页',num_display_entries:3,num_edge_entries:1,prev_text:'上一页',callback: pageselectCallback};
 				 if(members.length <= perPageNum){
 		        	$("#Pagination").hide();
 		         }
 				 $("#Pagination").pagination(members.length, opt);
 				 //var leftP = $(".suc-nr").position().left + $(".suc-nr").width()/2 - ($('.next').position().left - $('.prev').position().left)/2;
	 			 //$("#Pagination").offset({left:leftP});
 			}
 		});
	});
     function getSearchResult(current_page){
    	 
    	 $.ajax({
  			url : root +"/"+shortUrl+ "/article/searchArticle.do",
  			dataType : "json",
  			data:{keyword:keyword},
  			type : "POST",
  			async:false,
  			success : function(data) {
  				$.each(data,function(i,val){
  					var member = [];
  					member.push(val.id);
  					member.push(val.author);
  					member.push(val.content);
  					member.push(val.coverImgUrl);
  					member.push(val.issuedDate);
  					member.push(val.place);
  					member.push(val.source);
  					member.push(val.time);
  					member.push(val.title);
  					member.push(val.menubar.id);
  					members.push(member);
  				});
  				$("#goBack").hide();
  				
  				 var page_index = current_page;
  		         var items_per_page = 10;
  		         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
  		         var newcontent = '';
  		         $('.meadia').empty();
  		         for(var i=page_index*items_per_page;i<max_elem;i++)
  		         {
  		        	 current_page = page_index;
  		            newcontent +='<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a></li>';
  		         }
  		            //$('.suc-nr').html("<div id='content'></div>");
  		        	$('.meadia').html(newcontent);
  		        	$("#Pagination").show();
  			}
    	 });
     }
     function pageselectCallback(page_index, jq){
    	 var current_page = 0;
         var items_per_page = 10;
         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
         var newcontent = '';
         $('.meadia').empty();
         for(var i=page_index*items_per_page;i<max_elem;i++)
         {
        	 current_page = page_index;
        	 newcontent = '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
            if(members[i][4]!=null&&members[i][4]!=""){
            	newcontent +='<span style="float:right">'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span>';
            } 
            newcontent +='</p>';
        	 $(newcontent).appendTo($('.meadia'));
         }
         return false;
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
    		$('title').html('四川农业博览会暨成都国际都市现代农业博览会');
    	}
     function getView(type,menuId,articleId,current_page) {
    		if(!current_page){
    			current_page = 0;
    		}
    		//getImg(menuId);
    		changeTitle();
    		/* if(!articleId || articleId == null){
    			getImg(menuId);
    		} */
    		$(".meadia").load("<%=root+"/"+shortUrl%>/article/getView?menuId=" + menuId + "&nav_type="
    								+ type + "&articleId=" + articleId
    								+ "&current_page=" + current_page, function() {
    			     $('.bshare-custom').hide();
    			    $("#Pagination").hide();
    							if ((type == "5" || type == "6")) {
    								$("#goBack").show();
    							} else {
    								$("#goBack").hide();
    							}
    						});
    			}

 </script>
