<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<ul class="meadia"></ul>
<div id="Pagination" class="pagination" align="center"></div>
<script type="text/javascript">
	$(function() {
		members = [];
		var menuId = '${menuId}';
		var perPageNum = 10;
 		$.ajax({
 			url : root +"/" + shortUrl+ "/article/getFinleInfo",
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
 			}
 		});
	});

     function pageselectCallback(page_index, jq){
         var items_per_page = 10;
         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
         $('.meadia').empty();
         for(var i=page_index*items_per_page;i<max_elem;i++)
         {
        	 node = $('<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="'+photo+members[i][2]+'" >' + members[i][1] + '</a></li>');
        	 $('.meadia').append(node);
         }
         return false;
     }
     
 </script>