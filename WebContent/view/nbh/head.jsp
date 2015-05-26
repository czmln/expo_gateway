<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<header>
<div class="header">
  <div class="container">
    <div class="row header">
      <div class="col-xs-6"><a href="<%=root+"/"+shortUrl%>" class="logo">&nbsp;</a></div>
      <div class="col-xs-6">
        <div class="swicth-link"><span><a href="<%=root+"/"+shortUrl%>">简体中文</a><em>|</em><a href="javascript:void(0);">English</a></span><span><a href="javascript:void(0);">注册</a><em>|</em><a href="javascript:void(0);">登录</a></span> </div>
        <div class="searchWarp">
          <div class="search_start">
            <div class="search_cont">
              <form action="<%=root+"/"+shortUrl%>/article/searchArticlePage.do" method="POST">
              	<input name="tag" type=hidden value="nbh">
                <input type="text" name="keyword" class="in_search" autocomplete="off" value="搜索">
                <input type="submit" class="in_submit" value="&nbsp;" onclick="sub()">
                <i class="icon-search"></i>
              </form>
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
      <!-- top-rignt end -->
    </div>
    <!-- row end --> 
  </div>
  </div>
  <!-- container end -->
  <div class="slider">
    <div class="fullwidthbanner-container slider-main">
      <div class="fullwidthabnner">
        <ul id="revolutionul" style="display:none;"></ul>
        <div class="tp-bannertimer tp-bottom"></div>
      </div>
    </div>
  </div>
  <!-- slider end -->
  <div class="navbar-wapper">
    <div class="container menu-bar">
      <ul class="nvabar">
        <li class="active"><a href="<%=root+"/"+shortUrl%>">首页</a></li>
      </ul>
    </div>
  </div>
  <div class="clearfix"></div>
</header>
<script>
$(function(){
	getMenuBarByType();
	
});

function getMenuBarByType(){
	
	$.ajax({
		url:root +"/"+shortUrl+ "/menubar/getMenubarsByType.do",
		dataType:"json",
		type:"GET",
		success:function(data){
			if(data && data!=null && data.length>0){
				$.each(data,function(i,val){
					var node1 = $('<li><a href="javascript:void(0);"></a><ul class="sub-navbar"></ul></li>');
					node1.hover(
						function(mouseover){
						$(this).find(".sub-navbar").slideDown(100);
					   },
					   function(mouseout){
						$(this).find(".sub-navbar").slideUp(100);
					   }
					).find('a').html(val.name).attr('href',root+'/'+shortUrl+'/article/main?nav_type='+val.navType+'&menuId='+val.id);
					if(val.children && val.children!=null && val.children.length>0){
						$.each(val.children,function(j,va){
							var node2 = $('<li><a href="javascript:void(0);"></a></li>');
							node2.find('a').html(va.name).attr('href',root+'/'+shortUrl+'/article/main?nav_type='+va.navType+'&currentId='+val.id+'&menuId='+va.id);;
							node1.find('.sub-navbar').append(node2);
						});
					}
					$('.nvabar').append(node1);
				});
			}
		}
	});
}
</script>