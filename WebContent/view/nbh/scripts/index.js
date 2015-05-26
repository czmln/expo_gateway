	$(function() {
		
		Date.prototype.Format = function (fmt) { //author: meizz 
		    var o = {
		        "M+": this.getMonth() + 1, //月份 
		        "d+": this.getDate(), //日 
		        "h+": this.getHours(), //小时 
		        "m+": this.getMinutes(), //分 
		        "s+": this.getSeconds(), //秒 
		        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
		        "S": this.getMilliseconds() //毫秒 
		    };
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		    return fmt;
		};
		

		// 构造两个日期，分别是系统时间和2013/04/08 12:43:45
		var date = new Date();
		var now = new Date('2015/11/19');
		// 调用日期差方法，求得参数日期与系统时间相差的天数
		var day = parseInt((now.getTime() - date.getTime())/(24 * 60 * 60 * 1000));
		// 打印日期差
		$("#dayto").html(day);
		
		
		
		$(".tab-menu li").hover(function(){
			
			var rule = $(this).attr("data-rule");
			$(".tab-menu li").removeClass("active");
			$(this).addClass("active");
			$(".tab-content").hide();
			
			$("."+rule).show();
			
			
		});
		
		$("body").delegate(".suc-ul img","click",function() {
			var $DetailDiv = $(this).parents("table").next("div");
			var isOpen = $DetailDiv.css("display") == "block";
			if (isOpen) {
				$DetailDiv.slideUp(500);
				$(this).attr("src",root+"/view/blue/images/ckxq.jpg");
			} else{
				
				$(this).closest(".suc-ul").find(".tb-p").slideUp(500);
				$(this).closest(".suc-ul").find("img").attr("src",root+"/view/blue/images/ckxq.jpg");
				$(this).attr("src",root+"/view/blue/images/ckxq02.jpg");
				$DetailDiv.slideDown(500);
			}
		});
		
		getNewsOrNotice();
		
		getpartner();
		
		getActivity();
		
		getoutlink();
		
		advertlist();
	});
	//广告
	function advertlist(){
		$.ajax({
			url : root +"/"+shortUrl+"/ag/getAgByWebSiteName.do",
			dataType : "json",
			async:true,
			type : "post",
			success : function(data) {
				var index =0;
				var string='';
				$.each(data,function(i,val){
					var value=data[i].location
					var adUrl=data[i].url?data[i].url:root+"/"+shortUrl+"/ag/getContentPage?id="+data[i].id;
					if(value =="首页中部"){
						
						
						if(index==0){
							var str='<a href="'+adUrl+'" target="_blank"> <img width="1140px" height="80px" src="'+photo+data[i].picture+'" alt=""> </a>'; 
							$('.bottomadv').html(str);
						}else if(index==1){
							var str='<a href="'+adUrl+'" target="_blank"> <img width="1140px" height="80px" src="'+photo+data[i].picture+'" alt=""> </a>'; 
							$('.middleadv').html(str);
						}else if(index==2){
							var str='<a href="'+adUrl+'" target="_blank"> <img width="1140px" height="80px" src="'+photo+data[i].picture+'" alt=""> </a>'; 
							$('.topadv').html(str);
						}
						index++;
						
					}else if(value =="首页头部"){
						
						string+='<li data-transition="fade" data-slotamount="8" data-masterspeed="300" data-delay="6400" > <a href="'+adUrl+'" target="_blank"><img src="'+photo+data[i].picture+'" alt=""></a> </li>';
						
					}
				})
				
				$("#revolutionul").html(string);
				
				App.init();    
	            App.initBxSlider();
	            Index.initRevolutionSlider();
			}
		});
		
	}
	//友情链接
	function getoutlink(){
		
		$.ajax({
			url:root+'/'+shortUrl+'/blogroll/getBlogrollByWebSiteId.do',
			async : true,
			type:'post',
			dataType:'json',
			success:function(data){
				if(data!=null && data.length>0){
					
					var str='';
					
					for (var i = 0; i < data.length; i++) {
						var obj=data[i];
						if(obj.linkUrl) href=obj.linkUrl.indexOf("http")<0?"http://"+obj.linkUrl:obj.linkUrl;
						if(i==data.length-1){
						str+='<li><a href="'+href+'" target="_blank">'+obj.name+'</a></li>';
						}else{
						str+='<li><a href="'+href+'" target="_blank">'+obj.name+'</a><span>|</span></li>';	
						}
					}
					
					$(".outlink").html(str);
				}
			}
		});
	}
	//合作伙伴
	function getpartner(){
		$.ajax({
			url:root+'/'+shortUrl+'/partner/getPartnerByWebSite.do',
			async : true,
			type:'post',
			dataType:'json',
			success:function(data){
				if(data!=null && data.length>0){
					
					var str='';
					var endItem=data.length;
					if(data.length>10) 	endItem=10
					
					for (var i = 0; i < 10; i++) {
						var obj=data[i];
						if(obj.linkUrl) href=obj.linkUrl.indexOf("http")<0?"http://"+obj.linkUrl:obj.linkUrl;
						
						str+='<div class="col-xs-13"><a href="'+href+'" target="_blank" title='+obj.name+'><img src="'+photo+obj.coverImgUrl+'" alt='+obj.name+'></a></div>';
						
						if(i>0 && (i+1)%5==0){
							str+='<div class="clearfix"></div>';
						}
					}
					$(".partner").html(str);
				}
			}
		});
	}
	//获取活动指引
	function getActivity() {

		$.ajax({
					url : root +"/"+shortUrl+ "/index/getArticleById.do",
					dataType : "json",
					data : {
						menubarId : "2c9087c24d4bbac0014d4bcb29f30016",
						pageNo : "1",
						pageSize : "6"
					},
					type : "post",
					success : function(data) {
						var str = '';

						if (data != null && data.length > 0) {

							for (var i = 0; i < data.length; i++) {

								if(i>5){
									break;
								}
								var title = data[i].title;

//								if (title.length > 20) {
//
//									title = title.substr(0, 20) + "...";
//								}
								if(data[i].summary==null){
									
								data[i].summary="对不起！暂无摘要！";
								}
								var time = data[i].time;
								var time_="时间待定!";
								if(time!=null && time!=""){
									time_=new Date(time).Format("yyyy-MM-dd");
								}
								if(i!=0 && i%2==0){
									str +='<div class="clearfix"></div>';
								}
								str += '<div class="panel panel-default col-sm-6 wow zoomIn" data-wow-offset="40" data-wow-duration="3s" data-wow-delay="0.1s">'
									+ '<div class="panel-heading">'
									+ '<h4 class="panel-title"><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+data[i].menubar_Id+'&currentId='+data[i].parentId+'&articleId='+data[i].id+'"><strong>【'+ data[i].place+'】</strong>'+ title + '</a><span class="date">'
									+'（2015年11月）</span>'
									+'<a class="collapse-btn" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false"></a> </h4>'
									+ '</div>'
									+ '<div id="collapse'+i+'" class="panel-collapse collapse">'
									+ '<div class="panel-body">'+ data[i].summary +'</div>'
									+ '</div>'
									+ '</div>';
								
								/*str += '<li>'
									+ '<table>'
									+ '<td width="40%" class="suc-describle-text"><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+data[i].menubar_Id+'&currentId='+data[i].parentId+'&articleId='+data[i].id+'">'+ title + '</a></td>'
									+ '<td width="20%">'+ time_+'</td>'
									+ '<td width="40%">'+ data[i].place
									+ '    <div class="t-img">'
									+ '      <img src="'+root+'/view/nbh/images/icons/ckxq.jpg">'
									+ '   </div>'
									+ '</td>'
									+ '</table>'
									+ '<div class="tb-p">'
									+ '<p><span class="suc-describle-title-l">'+ data[i].summary +'</p>'
									+ '</div>'
									+ '</li>';*/
								
							}
						}
						//$(".suc-ul").append(str);
						$(".panel-group").append(str);
					}
				});

	}
	//获取新闻或公告
	function getNewsOrNotice() {

		$.ajax({
					url : root +"/"+ shortUrl+"/index/getNewsOrNotice.do",
					dataType : "json",
					data : {
						menubarId : "2c9087c24d4bbac0014d4bc2e99e0003",
						noticeId : "2c9087c24d4bbac0014d4bc39a4d0005",
						dynamicId : "2c9087c24d4bbac0014d4bc34f360004"
					},
					type : "post",
					success : function(data) {

						var newsstr = '';
						var newspicstr='';
						var newspicstr_='';
						var noticestr = '';
						var dynamicstr = '';

						if (data != null && data != "") {

							var luns=data.lun;
							var news = data.news;
							var notice = data.notice;
							var dynamic = data.dynamic;

							if (news != null && news.length > 0) {
								
								var title = news[0].title;

									
								if(title.length > 66){
									title=title.substr(0,66)+"...";
								}
								var summary =  news[0].summary;
								
								var k = summary.indexOf("</p>");
									
								newsstr +='<div class="top-news">'
									+ '<h2><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+news[0].menubar_Id+'&currentId='+news[0].parentId+'&articleId='+news[0].id+'" title="'+title+'">'+title+'</a></h2>';
								
								if(k==-1){
									
									newsstr +='<p>'+summary+'</p></div><ul class="news-list">';
								}else{
									
									newsstr +=summary+'</div><ul class="news-list">';
								}

								for (var i = 1; i < news.length; i++) {
									
									if(i>4){
										
										break;
									}

									 var title = news[i].title;
									 
									
									if(title.length > 25){
										title=title.substr(0,25)+"...";
									}

									newsstr +='<li><span class="date">'+ new Date(news[i].issuedDate).Format("yyyy-MM-dd")+'</span><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+news[i].menubar_Id+'&currentId='+news[i].parentId+'&articleId='+news[i].id+'" title="'+title+'">'+title+'</a></li>';
									}
									
								newsstr +='</ul>';	
										

								}

							//}
							var indexstr="";
							if (luns != null && luns.length > 0) {

								for (var i = 0; i < luns.length; i++) {
									
									if(i>6){
										
										break;
									}
									
									var tit = luns[i].title;
									
									if(tit.length>18){
										
										tit=tit.substr(0,18);
									}
									if(i==0){
										newspicstr_+='<li style="display:block;"><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+luns[i].menubar_Id+'&currentId='+luns[i].parentId+'&articleId='+luns[i].id+'">'+tit+'</a></li>';
										newspicstr+='<li style="z-index:1"><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+luns[i].menubar_Id+'&currentId='+luns[i].parentId+'&articleId='+luns[i].id+'"><img src="'+photo+luns[i].coverImgUrl+'" title="" alt="'+tit+'" /></a></li>';
										indexstr+='<li class="night"><a href="javascript:;">1</a></li>';
									}else{
										newspicstr_+='<li><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+luns[i].menubar_Id+'&currentId='+luns[i].parentId+'&articleId='+luns[i].id+'">'+tit+'</a></li>';
										indexstr+='<li><a href="javascript:;">'+(i+1)+'</a></li>';
										newspicstr+='<li><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+luns[i].menubar_Id+'&currentId='+luns[i].parentId+'&articleId='+luns[i].id+'"><img src="'+photo+luns[i].coverImgUrl+'" title="" alt="'+tit+'" /></a></li>';
									}
									
								}
							}
                            
							$(".news").html(newsstr);
							$(".textUl").html(newspicstr_);
							$(".numberUl").html(indexstr);
							$(".bigUl").html(newspicstr);
							
							lunbo();
							
						    //load();

							if (notice != null && notice.length > 0) {

								var title = notice[0].title;

								
								if(title.length > 66){
									title=title.substr(0,66)+"...";
								}
								
								var summary =  notice[0].summary;
								
								var k = summary.indexOf("</p>");
									
								noticestr +='<div class="top-news">'
									+ '<h2><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+notice[0].menubar_Id+'&currentId='+notice[0].parentId+'&articleId='+notice[0].id+'" title="'+title+'">'+title+'</a></h2>';
									
								if(k==-1){
									
									
									noticestr +='<p>'+summary+'</p></div><ul class="news-list">';
								}else{
									
									noticestr +=summary+'</div><ul class="news-list">';
								}

								for (var i = 1; i < notice.length; i++) {
									
									if(i>4){
										
										break;
									}	

									var title = notice[i].title;

									if(title.length > 25){
										title=title.substr(0,25)+"...";
									}

									noticestr +='<li><span class="date">'+ new Date(notice[i].issuedDate).Format("yyyy-MM-dd")+'</span><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+notice[i].menubar_Id+'&currentId='+notice[i].parentId+'&articleId='+notice[i].id+'" title="'+title+'">'+title+'</a></li>';
									}
									
								noticestr +='</ul>';	

							}

							$(".notice").html(noticestr);

							if (dynamic != null && dynamic.length > 0) {

								var title = dynamic[0].title;

								
								if(title.length > 66){
									title=title.substr(0,66)+"...";
								}
								
								var summary =  dynamic[0].summary;
								
								var k = summary.indexOf("</p>");
									
								dynamicstr +='<div class="top-news">'
									+ '<h2><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+dynamic[0].menubar_Id+'&currentId='+dynamic[0].parentId+'&articleId='+dynamic[0].id+'" title="'+title+'">'+title+'</a></h2>';
								
								if(k==-1){
									
									dynamicstr +='<p>'+summary+'</p></div><ul class="news-list">';
									
								}else{
									
									dynamicstr +=summary+'</div><ul class="news-list">';
								}

								for (var i = 1; i < dynamic.length; i++) {
									if(i>4){
										
										break;
									}

									var title = dynamic[i].title;

									if(title.length > 25){
										title=title.substr(0,25)+"...";
									}

									dynamicstr +='<li><span class="date">'+ new Date(dynamic[i].issuedDate).Format("yyyy-MM-dd")+'</span><a href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+dynamic[i].menubar_Id+'&currentId='+dynamic[i].parentId+'&articleId='+dynamic[i].id+'" title="'+title+'">'+title+'</a></li>';
									}
									
								dynamicstr +='</ul>';
							}

							$(".dynamic").html(dynamicstr);
						}

					}

				});

	}
var Index = function () {

    return {
        
        //Revolution Slider
        initRevolutionSlider: function () {
            var api;
			
				 //setTimeout("", 1000);
				 //jQuery('#revolutionul').show();
				 
api =  jQuery('.fullwidthabnner').revolution(
	                {
	                    delay:2000,
	                    startheight:380,
	                    startwidth:1150,

	                    hideThumbs:10,

	                    thumbWidth:100,                         // Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
	                    thumbHeight:50,
	                    thumbAmount:5,

	                    navigationType:"bullet",                // bullet, thumb, none
	                    navigationArrows:"solo",                // nexttobullets, solo (old name verticalcentered), none

	                    navigationStyle:"round",                // round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom


	                    navigationHAlign:"center",              // Vertical Align top,center,bottom
	                    navigationVAlign:"bottom",              // Horizontal Align left,center,right
	                    navigationHOffset:0,
	                    navigationVOffset:68,

	                    soloArrowLeftHalign:"left",
	                    soloArrowLeftValign:"center",
	                    soloArrowLeftHOffset:20,
	                    soloArrowLeftVOffset:-18,

	                    soloArrowRightHalign:"right",
	                    soloArrowRightValign:"center",
	                    soloArrowRightHOffset:20,
	                    soloArrowRightVOffset:-18,

	                    touchenabled:"on",                      // Enable Swipe Function : on/off
	                    onHoverStop:"on",                       // Stop Banner Timet at Hover on Slide on/off

	                    stopAtSlide:-1,
	                    stopAfterLoops:-1,

	                    hideCaptionAtLimit:0,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
						hideAllCaptionAtLilmit:0,				// Hide all The Captions if Width of Browser is less then this value
						hideSliderAtLimit:0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value

	                    shadow:1,                               //0 = no Shadow, 1,2,3 = 3 Different Art of Shadows  (No Shadow in Fullwidth Version !)
	                    fullWidth:"on"                          // Turns On or Off the Fullwidth Image Centering in FullWidth Modus
	                });
        }

    };
}();