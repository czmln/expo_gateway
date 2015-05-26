<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String photo =application.getInitParameter("photo");
    String root=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    String shortUrl=(String)request.getAttribute("shortUrl");
%>
<script>
window.photo = '<%=photo%>';
window.root ='<%=root%>';
window.shortUrl = '<%=shortUrl%>';
</script>
