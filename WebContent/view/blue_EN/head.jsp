
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
String photo1 =application.getInitParameter("photo");
/* String webtarget=(String)session.getAttribute("webtarget");
if(webtarget=="" || webtarget==null){
	webtarget="2c9087ef4c019cbe014c019d50db0000";
	session.setAttribute("webtarget", webtarget);
} */
String shortUrl=(String)request.getAttribute("shortUrl");
%>
<link href="<%=path%>/view/blue_EN/css/top_.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/view/blue_EN/css/index_.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path%>/view/blue_EN/js/jquery-1.8.3.min.js"></script> 
<!-- 分页插件 start -->
<link rel="stylesheet" href="<%=path%>/view/blue_EN/css/pagination.css" />
<script type="text/javascript" src="<%=path%>/view/blue_EN/js/jquery.pagination.js"></script> 
<script type="text/javascript">
var root="<%=path%>";
var photo="<%=photo1%>";
var shortUrl="<%=shortUrl%>";
</script>
<div class="head">
  <div class="top"> <img src="<%=path%>/view/blue_EN/images/sy_03.png" class="top-l">
    <div class="top-r">
      <div class="top-qh"> <img src="<%=path%>/view/blue_EN/images/index_03.jpg"><span><a href="<%=path%>/CH">中文</a></span> <img src="<%=path%>/view/blue_EN/images/index_05.jpg"><span><a href="<%=path%>/EN">English</a></span>
        <c:if test="${sessionScope.user_in_session==null}"> 
          <!-- <%=path%>/view/userinfo/jsp/login.jsp --> 
          <span><a href="#">Login</a></span> </c:if>
        <c:if test="${!empty  sessionScope.user_in_session}"> <span><a  href="<%=path%>/view/userinfo/jsp/center.jsp">${sessionScope.user_in_session.userName}</a>,您好!<a href="<%=path%>/login/logOut.do">注销</a></span> </c:if>
      </div>
      
       <div class="search_start">
            <div class="search_cont">
               <form  action="<%=path+"/"+shortUrl%>/article/searchArticlePage.do" method="POST">
                <input name="tag" type=hidden value="EN">
                <input type="text" name="keyword" class="in_search" autocomplete="off" value="Search" style="line-height: 25px;">
                <input type="submit" class="in_submit" value="">
                <i class="icon-search"></i>
              </form>
            </div>
            <a href="#"  class="sea-a" onclick="sub()">Search</a>
            <script type="text/javascript">
              function sub(){
            	
	            	if($(".insearch").val()=="")
	            	{
	            	  return;
	            	}
	            	$('.in_submit').click();
              }
            </script>
          </div>
    </div>
  </div>
</div>
<div class="navg">
  <div class="n-wd">
    <ul class="nav">
    </ul>
  </div>
</div>
<script type="text/javascript">
$(function(){
	//搜索
	$(".in_search").click(function(){
		$(".search_cont").addClass('ser').animate({
			width:200
		},200);
		if($(this).val() == 'Search'){
			$(".in_search").val('');
		}
	})
	$(".in_search").blur(function(){
		if($(this).val() !== ''){
			return false;
		}
		$(".search_cont").removeClass('ser').animate({
			width:80
		},200);
		$(".in_search").val('Search');
	});
	
		getMenuBarByType();
		
})

/**
 * 获取导航栏数据
 */
function getMenuBarByType(){
	var menubar=null;
	$.ajax({
		
		url:root +"/"+shortUrl+  "/menubar/getMenubarsByType.do",
		dataType:"json",
		type:"GET",
		success:function(data){
			
			var str='<li class="nav-k"><a href="<%=path+"/"+shortUrl%>" hidefocus="true" class="nav-ys" >Home</a></li>';
			
			if(data!="" && data!=null && data.length>0){
				menubar=data;
				//data[i].linkUrl
				for (var i = 0; i < data.length; i++) {
					
					str+=' <li class="nav-i" onmouseover="this.className=\'nav-i nav-iover now\'" onmouseout="this.className=\'nav-i\'">'+
			        '<a class="nav-ys" hidefocus="true" href="'+root+"/"+shortUrl+'/article/main?nav_type='+data[i].navType+'&menuId='+data[i].id+'">'+data[i].name+'</a>';
			        //'<a class="nav-ys" href="'+root+'/article/main/nav_type/'+data[i].navType+'/menuId/'+data[i].id+'.html">'+data[i].name+'</a>';
			         
			         var childrens=data[i].children;
			         
			         if(childrens!=null && childrens.length>0){
			        	 str+='<div class="procon" >';
			        	 for (var j = 0; j < childrens.length; j++) {
							//childrens[j].linkUrl
			        		str+='<div class="navcpbt"><a hidefocus="true" target="_self" href="'+root+"/"+shortUrl+'/article/main?nav_type='+childrens[j].navType+'&currentId='+data[i].id+'&menuId='+childrens[j].id+'">'+childrens[j].name+'</a></div>';
			        		 //str+='<div class="navcpbt"><a target="_self" href="'+root+'/article/main/nav_type/'+childrens[j].navType+'/currentId/'+data[i].id+'/menuId/'+childrens[j].id+'.html">'+childrens[j].name+'</a></div>';
			        		 
						}
			        	 str+='</div>';
			         }
			          str+='</li>';
				}
				
			}
			
			$(".nav").html(str);
			flag = 0;
		}
		
	});
	
}

</script>