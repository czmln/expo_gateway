<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String photo =application.getInitParameter("photo");
String root=request.getContextPath();
String shortUrl=(String)request.getAttribute("shortUrl"); 
%>
<div class="confs-l" style="display:none;">
    <img src="images/contact_03.jpg">
    <ul class="confs-r">
    	<li><b></b></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li><input type="checkbox" name="tels"><span>Check the contacts to send</span></li>
    </ul>
</div>
<form id="contactForm" action="" method="post">
	 <div class="confs">
	     <p>To sweep, you can save the way to contact me.</p>
	</div>
	<div class="con-ss">
	     <input id="te" type="text" name="myTel" class="con-text" value="Please enter your mobile phone number" maxlength="11">
	     <input type="button" class="con-btn">
	</div> 
	<div id="Pagination" class="pagination"></div>
</form>
<script type="text/javascript">
$(function() {
	$("#te").focus(function(){
		var me=$(this);
		var val=me.val().trim();
		if(val=='Please enter your mobile phone number'){
			$("#te").val('');
			return;
		}
	});
	
	$("#te").blur(function(){
		var me=$(this);
		var val=me.val().trim();
		var re=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/g;
		if(!re.test(val)){
			me.val('Please enter your mobile phone number');
		}	
	});
	
	members = [];
	var perPageNum = 6;
	var menuId = '${menuId}';
	var pageStr = '${current_page}';
	var current_page;
		$.ajax({
			url : root +"/<%=shortUrl%>"+ "/article/getActivitysByMenubarId?menuId="+menuId,
			dataType : "json",
			type : "GET",
			async:false,
			success : function(data) {
				$.each(data,function(i,val){
					var member = [];
					member.push(val.id);
					member.push(val.contactsName);
					member.push(val.contactsTel);
					member.push(val.qrCodeUrl);
					member.push(val.menubar.id);
					member.push(val.org);
					member.push(val.workTel);
					member.push(val.qrCodeEmail);
					members.push(member);
				});
				current_page = pageStr != 'undefined' && pageStr !=null ? Number(pageStr) : 0;
 				$('#page').prop('page',current_page);
				 var opt = {items_per_page:perPageNum,current_page:current_page,num_display_entries:3,num_edge_entries:1,callback: pageselectCallback};
		         if(members.length <= perPageNum){
 		        	$("#Pagination").hide();
 		         }
		         $("#Pagination").pagination(members.length, opt);
		         var leftP = $(".suc-nr").position().left + $(".suc-nr").width()/2 - ($('.next').position().left - $('.prev').position().left)/2;
	 			 $("#Pagination").offset({left:leftP});
			}
		});
		
		$('.con-btn').click(function(){
			alert("This function has not yet opened");
		});
});

 function pageselectCallback(page_index, jq){
	 var current_page = 0;
     var items_per_page = 6;
     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
     $('.confs-l:visible').remove();
     for(var i=page_index*items_per_page;i<max_elem;i++){
    	 current_page = page_index;
    	 var $node = $('.confs-l:hidden').clone().show();
    	 if(members[i][3]!=""&&members[i][3]!=null){
    		 $node.find('img').prop('src',members[i][3]);
    	 }else{
    		 $node.find('img').remove();
    	 }
    	 if(members[i][5] && members[i][5] != null && members[i][5].length > 0){
    		 $node.find('.confs-r li:eq(0) b').html(members[i][5]);
    	 }
    	 if(members[i][1] && members[i][1] != null && members[i][1].length > 0){
    		 $node.find('.confs-r li:eq(1)').html('Contact：'+members[i][1]);
    	 }else{
    		 $node.find('.confs-r li:eq(1)').html('Contact：');
    	 }
    	 if(members[i][2] && members[i][2] != null && members[i][2].length > 0){
    		 $node.find('.confs-r li:eq(2)').html('Phone number：'+members[i][2]);
    	 }else{
    		 $node.find('.confs-r li:eq(2)').html('Phone number：');
    	 }
    	 if(members[i][6] && members[i][6] != null && members[i][6].length > 0){
    		 $node.find('.confs-r li:eq(3)').html('Office phone：'+members[i][6]);
    	 }else{
    		 $node.find('.confs-r li:eq(3)').html('Office phone：');
    	 }
    	 if(members[i][7] && members[i][7] != null && members[i][7].length > 0){
    		 $node.find('.confs-r li:eq(4)').html('Email：'+members[i][7]);
    	 }else{
    		 $node.find('.confs-r li:eq(4)').html('Email：');
    	 }
    	 $node.find('.confs-r li:eq(5) input').prop('value',members[i][2]);
    	 $node.appendTo($('.confs'));
     }
	return false;
}
</script>
