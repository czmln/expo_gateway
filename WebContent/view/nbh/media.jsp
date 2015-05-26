<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<ul class="meadia"></ul>
<div id="Pagination" class="pagination" align="center"></div>
<script type="text/javascript">
	$(function() {
		$('#description').hide();
		members = [];
		var menuId = '${menuId}';
		var perPageNum = 10;
		var pageStr = '${current_page}';
		var current_page;
 		$.ajax({
 			url : root +"/" + shortUrl + "/article/getActivitysByMenubarId?menuId="+menuId,
 			dataType : "json",
 			type : "GET",
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
 				//$('#page').prop('page',current_page);
 				 var opt = {items_per_page:perPageNum,current_page:current_page, next_text: '下一页',num_display_entries:3,num_edge_entries:1,prev_text:'上一页',callback: pageselectCallback};
 				 if(members.length <= perPageNum){
 		        	$("#Pagination").hide();
 		         }
 				 $("#Pagination").pagination(members.length, opt);
 			}
 		});
	});

     function pageselectCallback(page_index, jq){
    	 var type = '${nav_type}';
    	 var current_page = 0;
         var items_per_page = 10;
         var max_elem = Math.min((page_index+1) * items_per_page, members.length);
         $('.meadia').empty();
         for(var i=page_index*items_per_page;i<max_elem;i++)
         {
        	 current_page = page_index;
        	 var node;
        	 if(type == '11'){
        		 switch(members[i][8]){
        		 case '招展联系':
        			 node = $('<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="javascript:void(0);" onclick="getView(9,\'2c9087954c0d308c014c0d3d05fe0007\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a></li>');
        			 break;
        		 case '专业观众登记联系':
        			 node = $('<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="javascript:void(0);" onclick="getView(9,\'2c9087954c0d308c014c0d3e280f000b\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a></li>');
        			 break;
        		 case '活动联系':
        			 node = $('<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="javascript:void(0);" onclick="getView(9,\'2c9087954c0d308c014c0d3f288d000f\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a></li>');
        			 break;
        		 }
        	 }else if(type == '12'){
        		 node = $('<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="' + members[i][6] + '">' + members[i][8] + '</a></li>');
        	 }else{
        		 node = $('<li><span>'+new Date(members[i][4]).Format("yyyy-MM-dd")+'</span><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a></li>');
        	 }
            $('.meadia').append(node);
         }
         return false;
     }
 </script>