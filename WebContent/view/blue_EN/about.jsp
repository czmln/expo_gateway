<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
    String shortUrl=(String)request.getAttribute("shortUrl");
%>

<p class="articleContent" style="display: none;"></p>
<div class="con-ss" style="display:none;">
     <input type="text" name="myTel" class="con-text" value="请输入手机号码">
     <input type="button" class="con-btn" onclick="alert('对不起，该功能暂未开放');">
</div>

<script type="text/javascript">
	$(function() {
		getArticle();
		Date.prototype.Format = function (fmt) { 
		    var o = {
		        "M+": this.getMonth() + 1, 
		        "d+": this.getDate(), 
		        "h+": this.getHours(),
		        "m+": this.getMinutes(), 
		        "s+": this.getSeconds(), 
		        "q+": Math.floor((this.getMonth() + 3) / 3), 
		        "S": this.getMilliseconds() 
		    };
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		    return fmt;
		}
	});
	
	function getArticle() {
		var menuId = '${menuId}';
		var current_page = '${current_page}';
		$('#page').prop('page',current_page);
		$.ajax({
			url : root +"/<%=shortUrl%>" +"/article/getActivitysByMenubarId?menuId=" + menuId,
			dataType : "json",
			type : "GET",
			success : function(data) {
				$.each(data, function(i, val) {
					val.isSendMessage && data.isSendMessage == 1 
					? $('.con-ss').show()
					: $('.con-ss').hide();
					var node = $(".articleContent:hidden").clone().show();
					var titlcont='<h3 style="text-align:center;font-size:24px;color:#1256B2">'+data.title+'</h3>';
					titlcont+='<p style="text-align:left">Source:'+data.author+'&nbsp;&nbsp;'+'Date：'+new Date(data.issuedDate).Format("yyyy-MM-dd")+'</p>';
					titlcont+='<hr style="size:1;color:#FAF4FF" ></hr>';
					node.html(titlcont+data.content);
					node.appendTo($(".suc-nr"));
					$("#fx").show();
				});
			}
		});
		
	}
</script>
