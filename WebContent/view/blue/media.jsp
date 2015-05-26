<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String root=request.getContextPath();
String shortUrl=(String)request.getAttribute("shortUrl");
%>
<div id="content"></div>
<div id="Pagination" class="pagination" align="center"></div>
<script type="text/javascript">
	$(function() {
		members = [];
		var menuId = '${menuId}';
		var perPageNum = 10;
		var pageStr = '${current_page}';
		var current_page;
 		$.ajax({
 			url : root +"/<%=shortUrl%>" + "/article/getActivitysByMenubarId?menuId="+menuId,
 			dataType : "json",
 			type : "GET",
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
 				 var leftP = $(".suc-nr").position().left + $(".suc-nr").width()/2 - ($('.next').position().left - $('.prev').position().left)/2;
	 			 $("#Pagination").offset({left:leftP});
 			}
 		});
	});

     function pageselectCallback(page_index, jq){
    	 var type = '${nav_type}';
    	 var current_page = 0;
         var items_per_page = 10;
         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
         var newcontent = '';
         $('#content').empty();
         for(var i=page_index*items_per_page;i<max_elem;i++)
         {
        	 current_page = page_index;
        	 if(type == '11'){
        		 switch(members[i][8]){
        		 case '招展联系':
        			 newcontent = '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(9,\'2c9087954c0d308c014c0d3d05fe0007\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
        			 break;
        		 case '专业观众登记联系':
        			 newcontent = '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(9,\'2c9087954c0d308c014c0d3e280f000b\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
        			 break;
        		 case '活动联系':
        			 newcontent = '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(9,\'2c9087954c0d308c014c0d3f288d000f\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
        			 break;
        		 }
        	 }else if(type == '12'){
        		 newcontent = '<p class="suc-media-focus"><a href="' + members[i][6] + '" target="_blank">' + members[i][8] + '</a>';
        	 }else{
        		 newcontent = '<p class="suc-media-focus"><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a>';
        	 }
            if(members[i][4]!=null&&members[i][4]!=""){
            	newcontent +='<span style="float:right">'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span>';
            } 
            newcontent +='</p>';
        	 $(newcontent).appendTo($('#content'));
         }
         return false;
     }
     
 </script>
