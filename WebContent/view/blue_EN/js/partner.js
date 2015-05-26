(function(){
	jQuery.fn.extend({
        pic_scroll:function (speed){
            $(this).each(function(){
                var _this=$(this);//存储对象
                var ul=_this.find("ul");//获取ul对象
                var li=ul.find("li");//获取所有图片所有的li
                var w=li.size()*li.width();//统计图片的长度
                li.clone().prependTo(ul);//克隆图片一份放入ul里
                ul.width(2*w);//设置ul的长度，使所有图片排成一排
                var i=1,l;
                _this.hover(function(){i=0},function(){i=1});//鼠标经过时设置i=0达到鼠标经过停止效果
                setInterval(function(){
                    //定时滚动函数
                    l = _this.scrollLeft();
                    if (l < w) {
                        _this.scrollLeft(l+i);
                    } else {
                        _this.scrollLeft(0);
                    }
                },speed);
            })
        }
    });
})();


//合作伙伴数据添加
function Parnner(elJq){
	this.data=[];
	this.appendObj=elJq.find("ul");
	this.getPartner=function(){
		var me=this;
		$.ajax({
			url:root+"/"+shortUrl+'/partner/getPartnerByWebSite.do',
			async : true,
			type:'post',
			dataType:'json',
			success:function(data){
				this.data=data;
				me.appenParnerHtml(data);
			}
		});
	};
	
	this.appenParnerHtml=function(data){
		if(!data) return ;
		for(i=0;i<data.length;i++){
			var obj=data[i];
			var href="javascript:";
			if(obj.linkUrl) href=obj.linkUrl.indexOf("http")<0?"http://"+obj.linkUrl:obj.linkUrl;		
			var li='<li><a  hidefocus="true" href="'+href+'"  target="_blank" title="'+obj.name+'" > <img src="'+photo+obj['coverImgUrl']+'" height="59" width="177" alt="'+obj.name+'" /></a></li>';
			this.appendObj.append(li);
		}
		elJq.pic_scroll(10);
	}
}

//友情链接
function OutLink(elJq){
	this.data=[];
	this.appendObj=elJq;
	this.getOutLink=function(){
		var me=this;
		$.ajax({
			url:root+"/"+shortUrl+'/blogroll/getBlogrollByWebSiteId.do',
			async : true,
			type:'post',
			dataType:'json',
			success:function(data){
				this.data=data;
				me.appenParnerHtml(data);
			}
		});
	};
	//
	this.appenParnerHtml=function(data){
		if(!data) return ;
		for(i=0;i<data.length;i++){
			var obj=data[i];
			var href="javascript:";
			var namestr=obj.name.length>12?obj.name.substring(0,11)+"...":obj.name;
			if(obj.linkUrl) href=obj.linkUrl.indexOf("http")<0?"http://"+obj.linkUrl:obj.linkUrl;		
			var at='<a hidefocus="true" href="'+href+'"  target="_blank" title="'+obj.name+'" >'+namestr+'</a>';
			this.appendObj.append(at);
		};
	}
}
$(function(){
	
	new Parnner($("#viewer")).getPartner();
	
	new OutLink($("#out_link")).getOutLink();
})