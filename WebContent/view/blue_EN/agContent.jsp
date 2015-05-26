<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String photo =application.getInitParameter("photo");
String root = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国西部进口展</title>
<meta name ="keywords" content="进口展，中国西部，西部进口展">
<meta name="description" content="中国西部进口展" />
<link href="<%=root%>/view/blue_EN/css/top.css" rel="stylesheet" type="text/css">
<link href="<%=root%>/view/blue_EN/css/all page.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/jquery-1.8.3.min.js"></script>
</head>
<body class="bg">
<!-- head start-->
<%@ include file="head.jsp" %> 
<!-- head end-->

<div class="sbg">
	<h2 align="center" class="comimg">${advert.name}</h2>
	${advert.content}
</div>


<%@ include file="foot.jsp" %>
<script type="text/javascript">
	var root="<%=root%>";
	var photo="<%=photo%>";
</script>
<script type="text/javascript" src="<%=root%>/view/blue_EN/js/ag_one.js"></script> 
</body>
</html>