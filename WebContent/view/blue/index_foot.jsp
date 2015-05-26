<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String base = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath();
%>
<style type="text/css">
.banner1 {
	height: 112px;
	margin-top: 12px;
	overflow: hidden;
	padding-left: 40px
}

.banner1 img {
	width: 589px;
}

.banner1 .smallslider {
	width: 589px;
	height: 112px;
	position: relative;
	padding: 0;
	margin: 0;
	overflow: hidden;
}

.banner1 .smallslider ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	position: absolute;
	width: 589px;
	height: 112px;
}

.banner1 .smallslider li {
	margin: 0;
	padding: 0;
}

.banner1 .smallslider li a {
	margin: 0;
	padding: 0;
}

.banner1 .smallslider li a img {
	
}

.banner1 .smallslider li.current-li {
	
}

.banner1 .smallslider-btns {
	position: absolute;
	z-index: 103;
}

.banner1 .smallslider-btns span {
	background-color: #FFFFFF;
	border: 1px solid #DCDCDC;
	color: #9F9F9F;
	cursor: pointer;
	float: left;
	font-size: 12px;
	height: 16px;
	line-height: 16px;
	text-align: center;
	width: 16px;
}

.banner1 .smallslider-btns span.current-btn {
	background-color: #008c61;
	border: 1px solid #008c61;
	color: white;
	font-size: 13px;
	font-weight: bold;
}

.banner1 .smallslider-lay {
	position: absolute;
	height: 30px;
	width: 100%;
	z-index: 101;
}

.banner1 .smallslider h3 {
	position: absolute;
	font-weight: bold;
	font-size: 12px;
	margin: 0;
	padding: 0 0 0 5px;
	line-height: 30px;
	z-index: 102;
	width: 275px;
	color: #CCC;
	display: none;
}

.banner1 .smallslider h3 a {
	padding: 0;
	margin: 0;
	text-indent: 0;
}

.banner1 .smallslider h3 a:link, .banner1 .smallslider h3 a:visited {
	text-decoration: none;
	color: #FFFFFF;
}

.banner1 .smallslider h3 a:hover {
	text-decoration: underline;
	color: #ff3600;
}
</style>

<script type="text/javascript"
	src="<%=base%>/view/blue/js/smallslider.js"></script>
<div class="bottom">
	<div class="bot-l">
		<img src="<%=base%>/view/blue/images/weixinerweima.jpg"
			class="bot-img">
		<h3 class="zt">
			“扫一扫”<br>掌握大会最新资讯
		</h3>
		<img src="<%=base%>/view/blue/images/line_07.jpg" class="bot-line">
		<div class="banner1">
			<div class="bot-ad smallslider" id="bannerslider1">
				<ul id="bottom">
					<!-- <li><a target='_blank'></a></li> -->
				</ul>
			</div>
		</div>
	</div>

</div>
<div class="bom">
	<div class="bot">
		<span class="s-l">版权所有：四川博览事务局 邮编：610016</span>
		&nbsp;&nbsp;&nbsp;&nbsp; <span> <script type="text/javascript">
			var cnzz_protocol = (("https:" == document.location.protocol) ? " https://"
					: " http://");
			document
					.write(unescape("%3Cspan id='cnzz_stat_icon_1254731069'%3E%3C/span%3E%3Cscript src='"
							+ cnzz_protocol
							+ "s4.cnzz.com/z_stat.php%3Fid%3D1254731069%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
		</script>
		</span> <span class="s-r">经营许可证编号：蜀ICP备05030067</span>
	</div>
</div>