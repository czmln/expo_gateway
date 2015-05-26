	$(function() {
		

		// 构造两个日期，分别是系统时间和2013/04/08 12:43:45
		var date = new Date();
		var now = new Date('2015/10/23');
		// 调用日期差方法，求得参数日期与系统时间相差的天数
		var day = parseInt((now.getTime() - date.getTime())/(24 * 60 * 60 * 1000));
		// 打印日期差
		$("#dayto").html(day);

			
		$(".suc-detail-btn-close").click(function () { 
			var $DetailDiv = $(this).parents("table").next("div");
			 var isOpen = $DetailDiv.css("display") == "block";
			if (isOpen) { 
				$DetailDiv.hide();
			} else $DetailDiv.show();
		});
		
		$(".lbtn").click(function(){
			if($("#username").val() == null || $("#password").val() == null || $("#username").val() == "" || $("#password").val() == ""||$("#username").val()=="请输入用户名"|| $("#password").val()=="请输入密码"){
				$("#msg").html("&emsp;&emsp;请输入账号或密码");
				$("#username").focus();
				return false;
			}else{
				var username=$("#username").val();
				var datas={"username":username,"password":$("#password").val()};
				$.post(
						root+"/login/checklogin.do",
						datas,
						function(data){
							if(data.rs){
								window.location.href=root+"/view/userinfo/jsp/center.jsp"	;							
							}else{
								if(101==data.errorCode){
									$("#username").val(username);
									$("#password").val("");
									$("#username").focus();
									$("#msg").html("&emsp;&emsp;"+data.msg);
								}else if(102==data.errorCode){
									$("#username").val(username);
									$("#password").val("");
									$("#password").focus();
									$("#msg").html("&emsp;&emsp;"+data.msg);
								}
							}
				},"json");
			}
		});
		
		
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
		
		//对主页进行所有回城登陆控制 
		$("body").keydown(function(event){
			if(event.keyCode==13){
				$(".lbtn").click();
			}
		});
		
		$("#username").focus(function(){
			if($("#username").val()=="请输入用户名"){
				$("#username").val("");
			}
		});
		$("#username").blur(function(){
			if($("#username").val()==""){
				$("#username").val("请输入用户名");
			}
		});
		$("#password").focus(function(){
			if($("#password").val()=="请输入密码"){
				this.type='password';
				$("#password").val("");
			}
		});
		$("#password").blur(function(){
			if($("#password").val()==""){
				this.type='text';
				$("#password").val("请输入密码");
			}
		});
		
		$("#rt-div").floatdiv({right:"10%",top:"48.5%"});//设置浮动层靠右距离为0，靠上距离50px 根据需求调整
		//轮播
		/*$('#slider').nivoSlider({
			directionNav:false
			
		});*/
		
		$(".suc-ul img").live("click",function() {
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

		//鼠标移动事件注册
		$(".n-tit span").mouseover(function() {

			$(".n-tit span").removeClass("tit-bg01");
			$(".n-tit span").addClass("tit-bg02");
			$(this).removeClass("tit-bg02").addClass("tit-bg01");
			$(".n-nr ul").hide();
			var role = $(this).attr("data-role");
			$("." + role).show();
		})

		//获取新闻或公告
		getNewsOrNotice();
		//获取活动指引
		getActivity();
		/*//获取商旅
		getTravel();*/
	});
	/*//获取商旅
	function getTravel() {

		$.ajax({
			url : root + "/menubar/getById.do",
			dataType : "json",
			async:false,
			data : {
				menuId : "2c9087954c0d308c014c0d39546b0000"
			},
			success : function(data) {
				$('.sl-details:visible').remove();
				if(data && data.length && data.length > 0){
					$.each(data,function(i,val){
						if(i < 6){
							var $node = $('.sl-details:hidden').clone().show();
							var url = root + '/article/main?nav_type=' + val.navType + '&currentId=' + val.menubar_id + '&menuId=' + val.id;
							$node.find('.sl-li a').attr('href',url).find('img').attr('src',photo + val.coverImg);
							$node.find('.sl-k .zt').html(val.name);
							$node.appendTo($(".sl-nr ul"));
						}
					});
				}
				
				var slNr=$("#sl-nr-id");
				var imgUrls=[];
				if (data != null && data.length > 0) {
					for ( j= 0; j< 6; j++) {	
						var lis=$( '<li>' + '<a style="display: inline-block;" class="sl-li icon-'+j+'" href="'+root+'/article/main?nav_type='+data[j].navType+'&currentId='+data[j].menubar_id+'&menuId='+data[j].id+'">'
								+ '<img id="imgli'+j+'" src="'+photo+data[j].coverImg+'" /></a>'
								+ '<div class="sl-k"><h3 class="zt">'
								+ data[j].name + '</h3></div>' + '</a>'
								+ '</li>');						
						slNr.append(lis);
						imgUrls.push(photo+data[j].coverImg);
					}
				}
				for(n=0;n<imgUrls.length;n++){
					setTimeout(function(){
					}, 10);
					$("#imgli"+n).attr("src",imgUrls[n]+"?a=1245");
				}
			}
		});
	}*/
	//获取活动指引
	function getActivity() {

		$.ajax({
					url : root +"/"+shortUrl+ "/index/getArticleById.do",
					dataType : "json",
					data : {
						menubarId : "2c9087954c0d308c014c0d3eb54c000d",
						pageNo : "1",
						pageSize : "6"
					},
					type : "post",
					success : function(data) {
						var str = '';

						if (data != null && data.length > 0) {

							for (var i = 0; i < data.length; i++) {

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
								str += '<li>'
										+ '<table>'
										+ '<td width="45%" class="suc-describle-text"><a hidefocus="true" target="_blank" style="color:#169fe7;" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+data[i].menubar_Id+'&currentId='+data[i].parentId+'&articleId='+data[i].id+'">'
										+ title
										+ '</a></td>'
										+ '<td width="20%">'
										+ time_
										+ '</td>'
										+ '<td width="35%" align="center">'
										+ '<p class="t-p">'
										+ data[i].place
										+ '</p>'
										+ '<div  class="t-img"><img src="'+root+'/view/blue/images/ckxq.jpg"/></div>'
										+ '</td>' + '</table>'
										+ '<div class="tb-p" style="height:200px;overflow:hidden; display: none;">'
										+ data[i].summary + '</div></li>';
							}
						}
						$(".suc-ul").append(str);
					}
				});

	}
	
	//获取新闻或公告
	function getNewsOrNotice() {

		$.ajax({
					url : root +"/"+ shortUrl+"/index/getNewsOrNotice.do",
					dataType : "json",
					data : {
						menubarId : "402882264c0bb593014c0bbf30b60002",
						noticeId : "2c9087954c0ce14b014c0d22b5dd0000",
						dynamicId : "2c9087954c0ce14b014c0d23833c0002"
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

								for (var i = 0; i < news.length; i++) {

									var title = news[i].title;

//									if (title.length > 20) {
//
//										title = title.substr(0, 20) + "...";
//									}

									if (i < 3) {

										newsstr += '<li>'
												+ '<span>'
												+ new Date(news[i].issuedDate).Format("yyyy-MM-dd")
												+ '</span>'
												+'<a target="_blank" hidefocus="true" title="'+title+'" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+news[i].menubar_Id+'&currentId='+news[i].parentId+'&articleId='+news[i].id+'" class="hot">'
												+ title+'</a></li>';
									} else {
										newsstr += '<li>'
												+ '<span>'
												+ new Date(news[i].issuedDate).Format("yyyy-MM-dd")
												+ '</span>'
											    +'<a target="_blank" hidefocus="true" title="'+title+'" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+news[i].menubar_Id+'&currentId='+news[i].parentId+'&articleId='+news[i].id+'">'
												+ title+'</a></li>';
									}
									
										
										

								}

							}
							
							if (luns != null && luns.length > 0) {

								for (var i = 0; i < luns.length; i++) {
									
									if(i==0){
										newspicstr_+='<li class="on">'+(i+1)+'</li>';
									}else{
										newspicstr_+='<li>'+(i+1)+'</li>';
									}
									var tit = luns[i].title;
//									if (tit.length > 18) {
//
//										tit = tit.substr(0, 18);
//									}
									newspicstr+='<a target="_blank" hidefocus="true" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+luns[i].menubar_Id+'&currentId='+luns[i].parentId+'&articleId='+luns[i].id+'" target="_blank"><img src="'+photo+luns[i].coverImgUrl+'" title="" alt="'+tit+'" height="180" width="280" /></a>';
								}
							}
                            
							$(".box-m .news_").html(newsstr);
							$("#banner_index").html(newspicstr_);
							$("#banner_list").html(newspicstr);
							
						    load();

							if (notice != null && notice.length > 0) {

								for (var i = 0; i < notice.length; i++) {

									var title = notice[i].title;

//									if (title.length > 20) {
//
//										title = title.substr(0, 20) + "...";
//									}

									if (i < 3) {

										noticestr += '<li>'
													+ '<span>'
													+ new Date(notice[i].issuedDate).Format("yyyy-MM-dd")
													+ '</span>'
											    +'<a target="_blank" hidefocus="true" title="'+title+'" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+notice[i].menubar_Id+'&currentId='+notice[i].parentId+'&articleId='+notice[i].id+'" class="hot">'
											    + title+'</a></li>';
									} else {

										noticestr += '<li>'
											+ '<span>'
											+ new Date(notice[i].issuedDate).Format("yyyy-MM-dd")
											+ '</span>'
											    +'<a target="_blank" hidefocus="true" title="'+title+'" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+notice[i].menubar_Id+'&currentId='+notice[i].parentId+'&articleId='+notice[i].id+'">'
											    + title+'</a></li>';
									}

								}

							}

							$(".box-m .notice_").html(noticestr);

							if (dynamic != null && dynamic.length > 0) {

								for (var i = 0; i < dynamic.length; i++) {

									var title = dynamic[i].title;

//									if (title.length > 20) {
//
//										title = title.substr(0, 20) + "...";
//									}

									if (i < 3) {

										dynamicstr += '<li>'
											+ '<span>'
											+ new Date(dynamic[i].issuedDate).Format("yyyy-MM-dd")
											+ '</span>'
											    +'<a target="_blank" hidefocus="true" title="'+title+'" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+dynamic[i].menubar_Id+'&currentId='+dynamic[i].parentId+'&articleId='+dynamic[i].id+'" class="hot">'
											    + title	+'</a></li>';
									} else {

										dynamicstr += '<li>'
											+ '<span>'
											+ new Date(dynamic[i].issuedDate).Format("yyyy-MM-dd")
											+ '</span>'
											    +'<a target="_blank" hidefocus="true" title="'+title+'" href="'+root+"/"+shortUrl+'/article/main?nav_type=6&menuId='+dynamic[i].menubar_Id+'&currentId='+dynamic[i].parentId+'&articleId='+dynamic[i].id+'">'
											    + title+'</a></li>';
									}

								}

							}

							$(".box-m .dynamic_").html(dynamicstr);
						}

					}

				});

	}
function btnt(test){
		
		test.setAttribute("src",root+"/view/blue/images/sy3_07.png");
	}
	
	function btnt2(test){
		test.setAttribute("src",root+"/view/blue/images/sy3_09.png");
	}
	
	
	function btnf(test){
		
		test.setAttribute("src",root+"/view/blue/images/sy3_08.png");
	}
	
	function btnf2(test){
		test.setAttribute("src",root+"/view/blue/images/sy3_11.png");
	}
	
	
	function btns(test){
		
		test.setAttribute("src",root+"/view/blue/images/sy3_10.png");
	}
	
	function btns2(test){
		test.setAttribute("src",root+"/view/blue/images/sy3_13.png");
	}
	
	
	
	function pico(test){
		
		test.setAttribute("src",root+"/view/blue/images/pic_06.png");
	}
	
	function pico2(test){
		test.setAttribute("src",root+"/view/blue/images/sy_58.png");
	}