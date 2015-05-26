<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String root=request.getContextPath();
String photo =application.getInitParameter("photo");
String shortUrl=(String)request.getAttribute("shortUrl"); 
%>

<link rel="stylesheet" href="<%=root%>/view/blue/css/pagination.css" />
<script type="text/javascript" src="<%=root%>/view/blue/js/jquery.pagination.js"></script>
<script type="text/javascript">
var photo = '<%=photo%>';
</script>
<div id="content"></div>
<div id="Pagination" class="pagination" align="center"></div>
<script type="text/javascript">
	$(function() {
		members = [];
		var menuId = '${menuId}';
		var perPageNum = 10;
 		$.ajax({
 			url : root +"/<%=shortUrl%>"+ "/article/getFinleInfo",
 			dataType : "json",
 			type : "GET",
 			async:false,
 			success : function(data) {
 				$.each(data,function(i,val){
 					var member = [];
 					member.push(val.id);	
 					member.push(val.name);
 					member.push(val.url);
 					member.push(val.description);
 					member.push(val.issuedDate);
 					members.push(member);					
 				});
 				 var opt = {items_per_page:perPageNum, next_text: '下一页',num_display_entries:3,num_edge_entries:1,prev_text:'上一页',callback: pageselectCallback};
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
         var items_per_page = 10;
         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
         $('#content').empty();
         $(".suc-border-b").remove();
         for(var i=page_index*items_per_page;i<max_elem;i++)
         {
        	 var newcontent = '<p class="suc-media-focus"><a  href="'+photo+members[i][2]+'">' + members[i][3] + '</a>';
            if(members[i][4]!=null&&members[i][4]!=""){
            	newcontent+='<span style="float:right">'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span>';
            }
            newcontent+='</p>';
        	 $(newcontent).appendTo($('#content'));
         }
         $('#content').after('<div class="suc-border-b"></div>');
         return false;
     }
     
 </script>
