<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%
  String root=request.getContextPath(); 
  String photo =application.getInitParameter("photo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国西部会展</title>

<style type="text/css">
body{margin:0px;font-family:Arial, Helvetica, sans-serif;}
a{text-transform:none;color:#333}
.lof-slidecontent{width:1420px;font-size:14px; font-family:"微软雅黑"; margin:0 auto;}
</style>
<link rel="stylesheet" type="text/css" href="<%=root%>/framework/desktop/css/style.css" />

<script type="text/javascript" src="<%=root%>/framework/desktop/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=root%>/framework/desktop/js/jquery.easing.js"></script>
<script type="text/javascript" src="<%=root%>/framework/desktop/js/script.js"></script>
<script type="text/javascript" src="<%=root%>/framework/desktop/js/comm.js"></script>
<script type="text/javascript">
$(document).ready( function(){	
	
	var root="<%=root%>";
	var photo="<%=photo%>";
	
	getNavListByType(0,root,photo);
	
	

	
});
</script>

</head>
<body>


<div id="lofslidecontent45" class="lof-slidecontent">

<div class="logo">
	<img src="<%=root%>/framework/desktop/images/logo.png" />
</div>

	<div class="preload"><div></div></div>

	<div class="lof-main-outer" style="width:1420px;height:500px; margin:0 auto;">
		<ul class="lof-main-wapper">
		</ul>  	
	</div>

	<div class="lof-navigator-wapper">
		<div onclick="return false" class="lof-next"></div>
		<div class="lof-navigator-outer">
			<ul class="lof-navigator"></ul>
		</div>
		<div onclick="return false" class="lof-previous"></div>
	</div> 
    <div class="c-bg">
         <div class="b-btn">
              <a href="<%=root%>/framework/desktop/index.jsp"><img src="<%=root%>/framework/desktop/images/i_07.png" /></a>
              <a href="<%=root%>/framework/desktop/exposz.jsp"><img src="<%=root%>/framework/desktop/images/i_09.png" /></a>
              <a href="<%=root%>/framework/desktop/expojq.jsp"><img src="<%=root%>/framework/desktop/images/i_04.png" /></a>
         </div>
    </div>
    <div class="botm">
         <div class="b-nr">
            <p>2015 © 四川博览事务局  地址：成都市督院街70号 邮编：610061  蜀ICP备05030067 </p>
         </div>
    </div>
</div> 


</body>
</html>

