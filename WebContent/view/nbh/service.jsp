<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="hotel" id="hotel-ul" >
	<li style="display: none" ><img src="images/review/slider/1427863239029053721.jpg">
		<div class="hotel-r">
			<h3>
				<a href="javascript:void(0)">成都世纪城假日酒店（东楼）</a>
			</h3>
			<p class="ctext">高新区世纪城路208号(新会展中心旁)</p>
			<p class="ctext"></p>
		</div>
	</li>
</ul>
<div id="Pagination" class="pagination" align="center"></div>


<script type="text/javascript">  
$(function() {
	
	members = [];
	var perPageNum = 4;
	var menuId = '${menuId}';
	var pageStr = '${current_page}';
	var current_page;
		$.ajax({
			url : root +"/" + shortUrl + "/article/getActivitysByMenubarId?menuId="+menuId,
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
     var items_per_page = 4;
     var nav_type='${nav_type}';
     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
     var hotelli=$("#hotel-ul  li:eq(0)");
     
     $('.hotel-re:visible').remove();
     for(var i=page_index*items_per_page;i<max_elem;i++)
     {   
    	 current_page = page_index;
    	 var $content =hotelli.clone().show();
    	 $content.addClass("hotel-re");
    	 if(members[i][3] != null){
    		 $content.find('img').prop('src',photo+members[i][3]).css({'width':175,'height':131});
    	 }else{
    		 $content.find('img').remove();
    	 }                                              // onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');" 
    	if(nav_type=="2"){
    	     $content.find('h3').html('<a href="javascript:void(0);" >'+members[i][8]+'</a>');
    	     $content.find("p:eq(0)").html(members[i][5]);
    	     if(members[i][10] && members[i][10]!=null){
    	    	 $content.find('p:eq(1)').html(members[i][10]);
    	     }
    	}else if(nav_type=="10"){
    		 $content.find('h3').html('<a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');" >'+members[i][8]+'</a>');	
    		 $content.find('h3').append('<h3 >'+members[i][5]+'</h3>');
    		 if(members[i][10] && members[i][10]!=null && members[i][10].length > 151){
        		 
        		 $content.find(".ctext").html(members[i][10].substr(0,150)+'...');
        	 }else{
        		 $content.find(".ctext").html(members[i][10]);
        	 }
    	
    	}	
    	 
    	
    	 $("#hotel-ul").append($content);
     }
     return false;
}
</script>