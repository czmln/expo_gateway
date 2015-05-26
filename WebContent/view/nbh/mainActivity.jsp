<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<style type="text/css">
.panel-group .panel .panel-heading .panel-title a {  width:380px !important;}
</style>
<div class="row">
	<ul class="suc-ul">
 		<li class="suc-ul-header">
 			<table>
 				<tr>
	 				<td width="40%">活动名称</td>
	 				<td width="20%">日期</td>
	 				<td width="40%">地点</td>
 				</tr>
 			</table>
 		</li>
 	</ul>
</div>
<div id="Pagination" class="pagination"></div>
<script type="text/javascript">
$(function() {	
	members = [];
	var pageStr = '${current_page}';
	var current_page;
	var menuId = '${menuId}';
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
					member.push(val.summary);
					member.push(val.time);
					members.push(member);
				});
				current_page = pageStr != 'undefined' && pageStr !=null ? Number(pageStr) : 0;
 				//$('#page').prop('page',current_page);
				 var opt = {items_per_page:20,current_page:current_page, next_text: '下一页',num_display_entries:3,num_edge_entries:1,prev_text:'上一页',callback: pageselectCallback};
				 if(members.length <= 20){
 		        	$("#Pagination").hide();
 		         }
 				 $("#Pagination").pagination(members.length, opt);
			}
		});
});

function pageselectCallback(page_index, jq){
	 var current_page = 0;
    var items_per_page = 20;
    var max_elem = Math.min((page_index+1) * items_per_page, members.length);
    $('.activti_test').remove();
    for(var i=page_index*items_per_page;i<max_elem;i++)
    {
	   	 current_page = page_index;
		 var node = $('<li class="activti_test">'+
				 		'<table>'+
				 			'<tr>'+
				 				'<td class="suc-describle-text" width="40%"><a class="active-a-wd" href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');""></a></td>'+
				 				'<td width="20%"></td>'+
				 				'<td width="40%"><font></font><div class="t-img"><img src="'+root+'/view/blue/images/ckxq.jpg"/></div></td>'+
				 			'</tr>'+
				 		'</table>'+
				 		'<div class="tb-p">'+
				 			'<p><span class="suc-describle-title-l"></span></p>'+
				 			'<p></p>'+
				 		'</div>'+
				 	'</li>');
		 node.find('table tr td:eq(0) a').html(members[i][8]);
		 if(members[i][10] && null != members[i][10]&&'null'!= members[i][10]){
	   		 var date = new Date(members[i][10]).Format("yyyy-MM-dd");
	   		node.find('table tr td:eq(1)').html(date);
	   	 }else{
	   		node.find('table tr td:eq(1)').html('时间待定');
	   	 }
		 if(members[i][5] && null != members[i][5]&&'null'!= members[i][5]){
			 node.find('table tr td:eq(2) font').html(members[i][5]);
	   	 }else{
	   		 node.find('table tr td:eq(2) font').html('地点待定');
	   	 }
		 if(members[i][9] && null != members[i][9]&&'null'!= members[i][9]){
			 node.find('.tb-p p:eq(1)').html(members[i][9]);
		 }else{
			 node.find('.tb-p p:eq(1)').html('暂无详情');
		 }
		 node.find('table tr td:eq(2) .t-img img').click(function(){
				var $DetailDiv = $(this).parents("table").next("div");
				var isOpen = $DetailDiv.css("display") == "block";
				if (isOpen) {
					$DetailDiv.slideUp(500);
					$(this).attr("src",root+"/view/blue/images/ckxq.jpg");
				} else{
					$(this).closest(".suc-ul").find(".tb-p").slideUp(500);
					$(this).closest(".suc-ul").find("img").attr("src",root+"/view/blue/images/ckxq.jpg");
					$(this).attr("src",root+"/view/blue/images/ckxq02.jpg");
					$DetailDiv.slideDown(500);
				}
		 });
		 $('.suc-ul').append(node);
    }
    return false;
}
</script>