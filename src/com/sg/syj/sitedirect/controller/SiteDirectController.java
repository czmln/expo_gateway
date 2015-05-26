package com.sg.syj.sitedirect.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.domain.service.DomainService;
import com.sg.syj.entity.po.Domain;
import com.sg.syj.entity.po.MenubarView;
import com.sg.syj.entity.po.Template;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.menubarView.service.MenubarViewService;
import com.sg.syj.sitedirect.service.SiteDirectService;
@Controller
@RequestMapping("")
public class SiteDirectController {
 @Autowired
 private SiteDirectService siteDirectService;
 
 @Autowired
 private MenubarViewService menubarViewService;
 
 @Autowired
 private DomainService domainService;
 
 
 //根据域名跳转到该域名下默认的站点
 @RequestMapping(value="")	
 public ModelAndView directDomain(HttpServletRequest request){
	 String url = request.getScheme()+"://"+request.getServerName();
	 String path=request.getContextPath();
	 int port=request.getServerPort();
	 
	 if(port!=80){
		 url=url+":"+port;
	 }
	 
	 if(!StringUtil.isEmpty(path)&&!path.equals("/")){
		 url=url+path;
	 }
	 
	 
	 Domain domain = domainService.getByUrl(url);
	 
	 ModelAndView mal=new ModelAndView();
	 //如果该域名不存在或是没有默认的站点返回404页面
	 if(domain==null||domain.getWebSite()==null){
		 mal.setViewName("/blue/404");
		 return mal;
	 }
	 
	 //获取默认站点
	 WebSite website = domain.getWebSite();
	 
	 //重定向到默认的站点
	 return new ModelAndView("redirect:"+url+"/"+website.getLinkUrl());
	 
	  
 }
 
 @RequestMapping(value="{shortUrl}")	
 public ModelAndView direct(HttpServletRequest request,@PathVariable String shortUrl) throws Exception{
	 HttpSession session = request.getSession();
	 ModelAndView mal=new ModelAndView();

	 Map<String, WebSite> sites = siteDirectService.getWesiteData(request);	 
	 
	 WebSite site = sites.get(shortUrl);
	 
	 if(site==null){
		 mal.setViewName("/blue/404");
		 mal.addObject("shortUrl", "CH");
		 return mal;
	 }	 
	 
	 Template template =site.getTemplate();
	 String tempUrl=template.getUrl();
	 /*mal.addObject("webtarget", site.getId());*/
	 session.setAttribute("webtarget", site.getId());
	 session.setAttribute("shortUrl", shortUrl);
	 
	 String advertId=null;
	 
	 //获取英文网站的广告
	 if(shortUrl.equals("CH")){
		 advertId="2c9087954c0d308c014c0d39546b0000";
	 }else if(shortUrl.equals("EN")){
		 advertId="2c9087ef4c7e0ae8014c7e36ca0b0018";
	 }else if("agr".equals(shortUrl)){
			 advertId="2c9087c24d4bbac0014d4bc834dc000d";
		}
	 
	 if(!StringUtil.isEmpty(advertId)){
		 List<MenubarView> adverts = menubarViewService.getById(advertId, site.getId());
		 mal.addObject("adverts", adverts);
	 }
	 mal.addObject("shortUrl", shortUrl);
	 mal.setViewName(tempUrl+"/index");
	 return mal;
 }
  
 
}
