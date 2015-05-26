<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

String root=request.getContextPath();
String webtarget="2c9087ef4c019cbe014c019d50db0000";
String shortUrl = "CH";
session.setAttribute("webtarget", webtarget);
session.setAttribute("shortUrl", shortUrl);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>

</body>
</html>
<script type="text/javascript" src="<%=root%>/view/blue/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var root="<%=root%>";
$(function(){
	window.location=root+"/index/welcome";
	//window.location=root+"/index.html";
	
})
</script>