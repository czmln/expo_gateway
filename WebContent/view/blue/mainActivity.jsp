<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

String root=request.getContextPath();
String shortUrl=(String)request.getAttribute("shortUrl");
%>
<p class="suc-media-focus" style="display:none;"></p>

<ul class="suc-ul"></ul>
<div id="Pagination" class="pagination"></div>

<script type="text/javascript">

$(function() {	
	$(".suc-ul img").die().live("click",function() {
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
	Date.prototype.format = function(format) {
		var o = {
			"M+" : this.getMonth() + 1, 
			"d+" : this.getDate(), 
			"h+" : this.getHours(),
			"m+" : this.getMinutes(), 
			"s+" : this.getSeconds(),
			"q+" : Math.floor((this.getMonth() + 3) / 3), 
			"S" : this.getMilliseconds() 
		}

		if (/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		}

		for ( var k in o) {
			if (new RegExp("(" + k + ")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
						: ("00" + o[k]).substr(("" + o[k]).length));
			}
		}
		return format;
	}
	members = [];
	var pageStr = '${current_page}';
	var current_page;
	var menuId = '${menuId}';
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
					member.push(val.summary);
					member.push(val.time);
					members.push(member);
				});
				current_page = pageStr != 'undefined' && pageStr !=null ? Number(pageStr) : 0;
 				$('#page').prop('page',current_page);
				 var opt = {items_per_page:10,current_page:current_page, next_text: '下一页',num_display_entries:3,num_edge_entries:1,prev_text:'上一页',callback: pageselectCallback};
				 if(members.length <= 10){
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
     var items_per_page = 10;
     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
     var newcontent = '<li class="suc-ul-header"><table>';
     newcontent += '<td width="35%">活动名称</td><td width="15%">日期</td>';
     newcontent += '<td width="40%">地点</td></table></li>';
     var content = '';
     for(var i=page_index*items_per_page;i<max_elem;i++)
     {
    	 current_page = page_index;
    	 content += members[i][8] && members[i][8].length > 20 
    	 ? '<li><table><td width="35%" class="suc-describle-text" title="'+members[i][8]+'"><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8].substring(0,20) + '…</a></td>' 
    	 : '<li><table><td width="35%" class="suc-describle-text"><a href="javascript:void(0);" onclick="getView(6,\''+null+'\',\''+members[i][0]+'\',\''+current_page+'\');">' + members[i][8] + '</a></td>';
    	 content += '<td width="15%" style="text-align:center">' + new Date(members[i][10]).format("yyyy年MM月dd日") + '</td>';
    	 content += members[i][5] && members[i][5] !=null && members[i][5].length <= 15 ? '<td width="40%">' + members[i][5] + '<div  style="padding-top:5px;width:80px;float:right;cursor:pointer;"><img onclick="detailClick(this);" src="'+root+'/view/blue/images/ckxq.jpg"/></div></td></table>' : 
    		 '<td width="40%" title="'+members[i][5]+'">' + members[i][5].substr(0,15) + '...<div  style="padding-top:5px;width:80px;float:right;cursor:pointer;"><img onclick="detailClick(this);" src="'+root+'/view/blue/images/ckxq.jpg"/></div></td></table>';
   		 if(members[i][9]!=null&&members[i][9].length > 0){
   			content += '<div class="tb-p tb-h">' + members[i][9] + '</div></li>';
   		 }else{
   			content += '<div class="tb-p">对不起，暂无摘要</div></li>';
   		 }
     }
     if(content != ''){
    	 $('.suc-ul').html(newcontent + content);
     }
     return false;
 }
</script>

