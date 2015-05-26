<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String photo =application.getInitParameter("photo");
String root=request.getContextPath();
String shortUrl=(String)request.getAttribute("shortUrl");
%>
<div class="suc-border-b suc-float-l suc-content-box" style="display:none;">
	<div class="suc-content-left">
		<img src="images/slfw_03.jpg">
	</div>
	<div class="suc-content-right">
		<h2 class="suc-describle-text suc-describle-title-l"></h2>
		<p>
			<span class="suc-describle-text">
			</span>
			<strong></strong>
		</p>
		<p>
		</p>
	</div>
</div>
<div class="suc-clearfix" style="display:none;"></div>
<div id="Pagination" class="pagination"></div>
<script type="text/javascript">
$(function() {
	members = [];
	var perPageNum = 4;
	var menuId = '${menuId}';
	var pageStr = '${current_page}';
	var current_page;
		$.ajax({
			url : root +"/<%=shortUrl%>"+"/article/getActivitysByMenubarId?menuId="+menuId,
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
					member.push(val.summary);
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
	 var current_page = 0;
     var items_per_page = 4;
     var nav_type='${nav_type}';
     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
     $('.suc-border-b:visible').remove();
     for(var i=page_index*items_per_page;i<max_elem;i++)
     {
    	 current_page = page_index;
    	 var $content = $('.suc-border-b:hidden').clone().show();
    	 if(members[i][3] != null){
    		 $content.find('.suc-content-left img').prop('src','<%=photo %>'+members[i][3]).css({'width':175,'height':131});
    	 }else{
    		 $content.find('.suc-content-left img').remove();
    	 }                                              // onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');" 
    	if(nav_type=="2"){
    	 $content.find('.suc-content-right h2').html('<a href="javascript:void(0);" >'+members[i][8]+'</a>');
    	}else if(nav_type=="10"){
    		 $content.find('.suc-content-right h2').html('<a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');" >'+members[i][8]+'</a>');	
    	}
    	 $content.find('.suc-content-right p:eq(0)').find('span').html(members[i][5]);
    	 if(members[i][10] && members[i][10]!=null && members[i][10].length > 151){
    		 $content.find('.suc-content-right p:eq(1)').html(members[i][10].substr(0,150)+'...');
    	 }else{
    		 $content.find('.suc-content-right p:eq(1)').html(members[i][10]);
    	 }
    	 $('#Pagination').before( $content);
     }
     return false;
 }
</script>
