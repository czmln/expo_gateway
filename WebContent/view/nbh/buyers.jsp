<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<ul class="travel"></ul>
<div id="Pagination" class="pagination"></div>
<script type="text/javascript">
$(function() {
	members = [];
	var perPageNum = 12;
	var menuId = '${menuId}';
	var pageStr = '${current_page}';
	var current_page;
		$.ajax({
			url : root +"/"+ shortUrl+ "/article/getActivitysByMenubarId?menuId="+menuId,
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
	 var current_page = 0;
     var items_per_page = 12;
     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
     $('.travel').empty();
     for(var i=page_index*items_per_page;i<max_elem;i++)
     {
    	 current_page = page_index;
    	 var node = $('<li>' +
	    				'<a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');"><img width="168px" height="131px"></a>' +
	    				'<p></p>'+
    				'</li>');
    	 node.find('a img').attr('src',photo+members[i][3]);
    	 node.find('p').html(members[i][8]);
    	 $('.travel').append(node);
     }
     return false;
 }
</script>