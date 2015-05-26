<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
    String photoPath = application.getInitParameter("photoPath");
%>

<meta http-equiv="X-UA-Compatible" content="IE=100" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<script type="text/javascript" src="<%=path %>/framework/resources/jquery-2.0.0.min.js"></script>

<script type="text/javascript">
var baseJS = "<%=path %>";
var photoPath="<%=photoPath%>";
</script>
