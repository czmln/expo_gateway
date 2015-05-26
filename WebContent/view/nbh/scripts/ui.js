$(function(){
	//搜索
	$(".in_search").click(function(){
		$(".search_cont").addClass('ser').animate({
			width:200,
		},200);
		if($(this).val() == '搜索'){
			$(".in_search").val('');
		}
	})
	$(".in_search").blur(function(){
		if($(this).val() !== ''){
			return false;
		}
		$(".search_cont").removeClass('ser').animate({
			width:80,
		},200);
		$(".in_search").val('搜索');
	});
	
	//菜单
	$(".nvabar>li").hover(
	   function(mouseover){
		$(this).find(".sub-navbar").slideDown(100);
	   },
	   function(mouseout){
		$(this).find(".sub-navbar").slideUp(100);
	   }
	);
	  //活动
  $('body').delegate('.collapse-btn','click', function (){
	//event.stopPropagation();
	$(this).closest('.panel').toggleClass('active');
	
		if($(this).closest('.panel').hasClass("active")){
			
			$(this).closest('.panel').children(".panel-collapse").slideDown();
			
	    }else{
	    	
	    	$(this).closest('.panel').children(".panel-collapse").slideUp();
	    }
		
		
  });

  //$('.collapse.in').closest('.panel').addClass('active');

   $(".tab-menu li").click(function(){
   	$(this).siblings().removeClass("active");
   	$(this).addClass("active");
   });

});
	
	//幻灯片
	 jQuery(document).ready(function() {
            /*App.init();    
            App.initBxSlider();
            Index.initRevolutionSlider(); */                   
        });
		
	//新闻轮播图
	window.onload = function()
  {
		//lunbo();
  }
	
	function lunbo(){
		var oBox = document.getElementById('box');
		  var oPrev = getByClass(oBox,'prev')[0];
		  var oNext = getByClass(oBox,'next')[0];
		  var oBigUl = getByClass(oBox,'bigUl')[0];
		  var aLiBig = oBigUl.getElementsByTagName('li');
		  var oNumUl = getByClass(oBox,'numberUl')[0];
		  var aLiNumber = oNumUl.getElementsByTagName('li');
		  var oTextUl = getByClass(oBox,'textUl')[0];
		  var aLiText = oTextUl.getElementsByTagName('li');
		  var nowZindex = 1;
		  var now = 0;
		  function tab()
		  {
			   for(var i=0; i<aLiNumber.length; i++)
				  {
					  aLiNumber[i].className = '';
				  }
				  aLiNumber[now].className = 'night';
				  
			  aLiBig[now].style.zIndex = nowZindex++;
			  aLiBig[now].style.opacity = 0;
			  startMove(aLiBig[now],'opacity',100);
			  for(var i=0; i<aLiText.length; i++)
			  {
				  aLiText[i].style.display = 'none';
			  }
			  aLiText[now].style.display = 'block'
			  
		  }
		  
		  for(var i=0; i<aLiNumber.length; i++)
		  {
			  aLiNumber[i].index = i;
			  aLiNumber[i].onclick = function()
			  {
				 
				  if(this.index==now)return;
				  now = this.index;
				 
				  tab();
			  }
		  }
		  oNext.onmouseover = oPrev.onmouseover = oBigUl.onmouseover = function()
		  {
			  startMove(oPrev,'opacity',100);
			   startMove(oNext,'opacity',100)
		  }
		   oNext.onmouseout = oPrev.onmouseout = oBigUl.onmouseout = function()
		  {
			  startMove(oPrev,'opacity',0);
			  startMove(oNext,'opacity',0)
		  }
		  oPrev.onclick = function()
		  {
			  now--
			  if(now==-1)
			  {
				  now=aLiNumber.length-1;
			  }
			  tab();
		  }
		  
		    oNext.onclick = function()
		  {
			  now++
			  if(now==aLiNumber.length)
			  {
				  now=0;
			  }
			  tab();
		  }
		  
		  var timer = setInterval(oNext.onclick,3000)
		  oBox.onmouseover = function()
		  {
			  clearInterval(timer)
		  }
		  oBox.onmouseout = function()
		  {
			  timer = setInterval(oNext.onclick,3000)//改变速度修改3000 ，例如3000=3秒钟
		  }
	}