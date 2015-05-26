<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root=request.getContextPath();
String keyword=(String)request.getAttribute("keyword");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Western China (SiChuan) Import Expo & International Investment Fair</title>
<meta name="keywords" content="进口展，中国西部，西部进口展">
<meta name="description" content="中国西部进口展" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link href="<%=root%>/view/blue_EN/css/all page.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="<%=root%>/view/blue_EN/css/nivo-slider.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="<%=root%>/view/blue_EN/css/zzsc.css"
	type="text/css" media="screen" />
<link type="text/css" href="<%=root%>/view/blue_EN/css/lunbo.css"
	rel="stylesheet">
<%@ include file="head.jsp"%>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/lunbo.js"></script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/zzsc.js"></script>
<script type="text/javascript"
	src="<%=root%>/view/blue_EN/js/smallslider.js"></script>

<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh">
</script>
<link href="<%=root%>/view/blue/css/all page.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/bshareC0.js">
</script>
	<div  class="slide slide1" style="width: 100%">
		<img id="advertImg" width="100%" src="<%=root%>/view/blue/images/search.jpg">
	</div>
	<div class="sbg">
		<div class="sbox">
			<div class="s-right" style="line-height:23px;">
				<div class="suc-tit">
					<h2 class="zt">Search List</h2>
					<div class="suc-r">
						<div id="page" style="display: none;" page=""></div>
						<span>Position：Search List&nbsp;&nbsp;<a id="goBack" style="display: none;"
							href="javascript:void(0);">Go Back></a></span>
					</div>
				</div>
				<div class="suc-nr"><div id="content"></div></div>
			</div>
		</div>
	</div>
<div id="Pagination" class="pagination" style="width:500px" align="center"></div>
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
 				 var opt = {items_per_page:perPageNum,current_page:current_page, next_text: 'next',num_display_entries:3,num_edge_entries:1,prev_text:'pre',callback: pageselectCallback};
 				 if(members.length <= perPageNum){
 		        	$("#Pagination").hide();
 		         }
 				 $("#Pagination").pagination(members.length, opt);
 				 var leftP = $(".suc-nr").position().left + $(".suc-nr").width()/2 - ($('.next').position().left - $('.prev').position().left)/2;
	 			 $("#Pagination").offset({left:leftP});
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
  		         $('#content').empty();
  		         for(var i=page_index*items_per_page;i<max_elem;i++)
  		         {
  		        	 current_page = page_index;
  		        	 newcontent += '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
  		            if(members[i][4]!=null&&members[i][4]!=""){
  		            	newcontent +='<span style="float:right">'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span>';
  		            } 
  		            newcontent +='</p>';
  		         }
  		            $('.suc-nr').html("<div id='content'></div>");
  		        	$('#content').html(newcontent);
  		        	$("#Pagination").show();
  			}
    	 });
     }
     function pageselectCallback(page_index, jq){
    	 var current_page = 0;
         var items_per_page = 10;
         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
         var newcontent = '';
         $('#content').empty();
         for(var i=page_index*items_per_page;i<max_elem;i++)
         {
        	 current_page = page_index;
        	 newcontent = '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
            if(members[i][4]!=null&&members[i][4]!=""){
            	newcontent +='<span style="float:right">'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span>';
            } 
            newcontent +='</p>';
        	 $(newcontent).appendTo($('#content'));
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
    		$('title').html('Western China (SiChuan) Import Expo & International Investment Fair');
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
    		$("#content").load("<%=root+"/"+shortUrl%>/article/getView?menuId=" + menuId + "&nav_type="
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
