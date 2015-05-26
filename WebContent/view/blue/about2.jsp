<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
    String shortUrl=(String)request.getAttribute("shortUrl");
%>
<p class="articleContent" style="display: none;"></p>

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
		var articleId = '${articleId}';
		var menuId = '${menuId}';
		var current_page = '${current_page}';
		var type = '${nav_type}';
		$('#page').prop('page',current_page);
		if(!articleId || articleId == 'null' || articleId == null){
			$.ajax({
				url : root +"/<%=shortUrl%>" +"/article/getActivitysByMenubarId?menuId=" + menuId + "&type=" + type,
				dataType : "json",
				type : "GET",
				success : function(data) {
					$("#goBack").hide();
					$.each(data, function(i, val) {
						if(i == 0){
							var node = $(".articleContent:hidden").clone().show();
							var titlcont='<h3 style="text-align:center;font-size:24px;color:#1256B2">'+val.title+'</h3>';
							titlcont+='<p style="text-align:left;color:#996666" >来源:'+val.author+'&nbsp;&nbsp;'+'日期：'+new Date(val.issuedDate).Format("yyyy-MM-dd")+'</p>';
							titlcont+='<hr style="size:1;color:#FAF4FF" ></hr>';
							var clikrate='<h3 style="text-align:right">阅读次数：'+val.clickRate+'</h3>';
							  if(val.isSendMessage!=null&&val.isSendMessage=="1"){
								clikrate+='<div class="con-ss">';
								clikrate+='<span>描述：'+val.messageDescribe+'</span><br>';
								clikrate+='<input type="text" name="myTel" class="con-text" value="请输入手机号码">';
								clikrate+='<input type="button" class="con-btn"></div> ';			     
							  }
							node.html(titlcont+val.content+clikrate);
							node.appendTo($(".suc-nr"));
							 $('.bshare-custom').show();
						}
					});
				}
			});
		}else{
			$.ajax({
				url : root +"/<%=shortUrl%>" + "/article/viewArticleById?articleId=" + articleId,
				dataType : "json",
				type : "GET",
				success : function(data) {
					var node = $(".articleContent:hidden").clone().show();
					var titlcont='<h3 style="text-align:center;font-size:24px;color:#1256B2">'+data.title+'</h3>';
					titlcont+='<p style="text-align:left;color:#996666" >来源:'+data.author+'&nbsp;&nbsp;'+'日期：'+new Date(data.issuedDate).Format("yyyy-MM-dd")+'</p>';
					titlcont+='<hr style="size:1;color:#FAF4FF" ></hr>';
					var clikrate='<h3 style="text-align:right">阅读次数：'+data.clickRate+'</h3>';
					  if(data.isSendMessage!=null&&data.isSendMessage=="1"){
						clikrate+='<div class="con-ss">';
						clikrate+='<span>描述：'+data.messageDescribe+'</span><br>';
						clikrate+='<input type="text" name="myTel" class="con-text" value="请输入手机号码">';
						clikrate+='<input type="button" class="con-btn"></div> ';			     
					  }
					node.html(titlcont+data.content+clikrate);
					node.appendTo($(".suc-nr"));
					 $('.bshare-custom').show();
					 
					 if('新闻'==data.name1||'公告' == data.name1||'行业动态' == data.name1){
						 document.title = data.title;
					 }else{
						 document.title = '中国西部(四川)进口展及国际投资大会';
					 }
				
				}
			});
		}
		
	}
</script>
