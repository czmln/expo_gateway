<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root= request.getContextPath();
String photo = application.getInitParameter("photo");
String shortUrl=(String)request.getAttribute("shortUrl"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>展商展品</title>
<link href="css/all page.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=root%>/view/blue_EN/css/pagination.css" />
<script type="text/javascript"
	src="<%=root%>/view/blue_EN/js/jquery.pagination.js"></script>
</head>

<body class="bg">

<div class="sbg">
    <div class="sbox">
         <div class="s-right">
             <div class="suc-nr">
                 <div class="down-lb">
                     <h3>类别</h3>
                     <div class="down-list">
                     </div>
                 </div>
                 <div class="down-nr">
                      <div class="d-tit">
                          <h3>展商展品</h3>
                      </div>
                      <div class="dnr">
                         
                      </div>
                      
					<div class="suc-nr">
						<div id="content"></div>
						<div id="Pagination" class="pagination"></div>
					</div>	
                 </div>
             </div>
         </div>
    </div>
</div>
</body>
<script type="text/javascript">
	var root="<%=root%>";
	var pageIndex =0;   
	var photoPath = "<%=photo%>";
	
	$(function(){
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
		
		$.ajax({
			url : root +"/<%=shortUrl%>"+"/exhibitType/getAllTypes.do",
			type : "GET",
			async:false,
			data : {},
			dataType : "json",
			success : function(data) {	
				$.each(data,function(i){
					var html= "<a href='javascript:void(0);' onclick=changeContent(0,'"+data[i].id+"')>"+data[i].typeName+"</a>";
					$(".down-list").append(html);
				});
				changeContent(0,0);
			}
		});
	})
	
	function changeContent(pageIndex,id){
		$("#content").html("");
		members = [];
		$(".dnr").empty();
		$.ajax({
			url : root +"/<%=shortUrl%>"+ "/exhibit/lists?typeId="+id,
			dataType : "json",
			type : "GET",
			success : function(data) {
				$.each(data,function(i,val){
					var member = [];
					member.push(val.id);
					member.push(val.imgUrl);
					member.push(val.title);
					member.push(val.regDate);
					member.push(val.place);
					member.push(val.intro);
					member.push(val.company);
					members.push(member);
				});
				var opt = {items_per_page:5, next_text: '下一页',num_display_entries:3,num_edge_entries:2,prev_text:'上一页',callback: pageselectCallback};
				 if(members.length <= 5){
	 		        	$("#Pagination").hide();
	 		         }
		        $("#Pagination").pagination(members.length, opt);
		        var leftP = $("#content").position().left + $("#content").width()/2 - ($('.next').position().left - $('.prev').position().left)/2;
	 			$("#Pagination").offset({left:leftP});   
			}
		});
	}
	  
	  function pageselectCallback(page_index, jq){
		     var items_per_page = 5;
		     var max_elem = Math.min((page_index+1) * items_per_page, members.length);
		     var newcontent = '';
		     for(var i=page_index*items_per_page;i<max_elem;i++)
		     {
		     newcontent += "<div class='zs-list'>" + 
		     			"<a href='' id="+members[i][0]+">" + 
		     			"<img width='152px' height='99px' src=" + photoPath + members[i][1] + "></a>" +
		     			"<div class='zs-right'>" + 
		     			"<h3><a href='#'>"+members[i][2]+"</a></h3>" + 
		     			"<p><span>[参展时间]：</span>"+new Date(members[i][3]).format("yyyy年MM月dd日")+"<span> " + 
		     			"[展会地点]：</span>"+members[i][4]+"</p>" + 
		     			"<p><span>[主办单位]：</span>"+members[i][6]+"</p>" + 
		     			"<p><span>[展品概况]：</span>"+members[i][5]+"</p>" +
		     			"</div></div>";
		     }

		     $('#content').html(newcontent).after($("<div class='suc-clearfix'></div>"));
		     return false;
		 }
	  
</script>
</html>
