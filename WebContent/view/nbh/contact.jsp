<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<ul id="qrCode" class="contact">
	<li style="display: none">
	    <img src="images/review/slider/1429257329132.png" width="175" height="175">
		<div class="c-list">
			<div class="c-wz">友好城市馆</div>
			<div class="c-wz">联系人：王忆东</div>
			<div class="c-wz">电话：18508516199</div>
			<div class="c-wz">办公电话：028-86210533</div>
			<div class="c-wz">Email：wangyidong@wcif.cn</div>
			<div class="c-input">
				<input type="checkbox" name="tels"> <span>勾选您要发送的联系人</span>
			</div>
		</div>
	</li>
</ul>


<div class="c-phone">
   <input id="te" class="con-text" type="text" maxlength="11" value="请输入正确的手机号码" name="myTel">
   <input class="btn btn-phone" type="button" value="发送至手机">
</div>

<div id="Pagination" class="pagination" align="center"></div>

<script type="text/javascript">  
$(function() {
	$("#te").focus(function(){
		var me=$(this);
		var val=me.val().trim();
		if(val=='请输入正确的手机号码'){
			$("#te").val('');
			return;
		}
	});
	
	$("#te").blur(function(){
		var me=$(this);
		var val=me.val().trim();
		var re=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/g;
		if(!re.test(val)){
			me.val('请输入正确的手机号码');
		}	
	});
	
	members = [];
	var perPageNum = 6;
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
					member.push(val.contactsName);
					member.push(val.contactsTel?val.contactsTel:" ");
					member.push(val.qrCodeUrl);
					member.push(val.menubar.id);
					member.push(val.org?val.org:" ");
					member.push(val.workTel?val.workTel:" ");
					member.push(val.qrCodeEmail?val.qrCodeEmail:" ");
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
     var items_per_page = 6;
     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
     $('.tem-re:visible').remove();
     var nodeT = $('#qrCode li:eq(0)');
     for(var i=page_index*items_per_page;i<max_elem;i++){
    	 
    	 current_page = page_index;
    	 var $node =nodeT.clone().show(); //$('.confs-l:hidden').clone().show();
    	 $node.addClass("tem-re");
    	 var cwzs=$node.find(".c-wz");

    	 if(members[i][3]!=""&&members[i][3]!=null){
    		 $node.find('img').prop('src',members[i][3]);
    	 }else{
    		 $node.find('img').remove();
    	 }
    	 if(members[i][5] && members[i][5] != null && members[i][5].length > 0){
    		 $(cwzs[0]).text(members[i][5]);
    	 }
    	 if(members[i][1] && members[i][1] != null && members[i][1].length > 0){
    		 $(cwzs[1]).text('联系人：'+members[i][1]);
    	 }else{
    		 $(cwzs[1]).text('联系人：');
    	 }
    	 if(members[i][2] && members[i][2] != null && members[i][2].length > 0){
    		 $(cwzs[2]).text('电话：'+members[i][2]);
    	 }else{
    		 $(cwzs[2]).text.html('电话：');
    	 } 
    	 if(members[i][6] && members[i][6] != null && members[i][6].length > 0){
    		 $(cwzs[3]).text('办公电话：'+members[i][6]);
    	 }else{
    		 $(cwzs[3]).text('办公电话：');
    	 }
    	 if(members[i][7] && members[i][7] != null && members[i][7].length > 0){
    		 $(cwzs[4]).text('Email：'+members[i][7]);
    	 }else{
    		 $(cwzs[4]).text('Email：');
    	 }
    	// $node.find('.confs-r li:eq(5) input').prop('value',members[i][2]);
    	 $('#qrCode').append($node); 
     }
	return false;
}
</script>
