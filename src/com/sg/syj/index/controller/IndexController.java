package com.sg.syj.index.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.ArticleView;
import com.sg.syj.entity.po.MenubarView;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.index.service.IndexService;
import com.sg.syj.menubarView.service.MenubarViewService;
import com.sg.syj.sitedirect.service.SiteDirectService;


@Controller
@RequestMapping("{shortUrl}/index")
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	 @Autowired
	 private MenubarViewService menubarViewService;
	 
	 @Autowired
	 private SiteDirectService siteDirectService;
	/**
	 * 初始页
	 * @param request
	 * @param response
	 * @param view
	 * @return
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="/welcome",method=RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request ,HttpServletResponse response,ModelAndView view){
		String shortUrl = (String)request.getSession().getAttribute("shortUrl");
		String advertId=null;
		Map<String, WebSite> webSites=null;
		try {
			webSites = siteDirectService.getWesiteData(request);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    WebSite webSite=null;
		if(StringUtils.isEmpty(shortUrl)){
			shortUrl = "CH";
			request.getSession().setAttribute("shortUrl", shortUrl);
		}
		if("CH".equals(shortUrl)){
			view.setViewName("blue/index");
			advertId="2c9087954c0d308c014c0d39546b0000";
			webSite=webSites.get(shortUrl);
		}else if("EN".equals(shortUrl)){
			 view.setViewName("blue_EN/index");
			 advertId="2c9087ef4c7e0ae8014c7e36ca0b0018";
			 webSite=webSites.get(shortUrl);
		}else if("agr".equals(shortUrl)){
			view.setViewName("nbh/index");
			 advertId="2c9087c24d4bbac0014d4bc834dc000d";
			 webSite=webSites.get(shortUrl);
		}
		
		 
		 if(!StringUtil.isEmpty(advertId)){
			 List<MenubarView> adverts=null;
			try {
				adverts = menubarViewService.getById(advertId, webSite.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 view.addObject("adverts", adverts);
		 }
		 
		return view;
	}
	/**
	 * 获取新闻动态/公告
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/getNewsOrNotice",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getNewsOrNotice(HttpServletRequest request ,HttpServletResponse response,String menubarId,String noticeId,String dynamicId,@PathVariable String shortUrl){
		
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		if(webSite==null) return null;
		return indexService.getNewsOrNotice(menubarId, noticeId, dynamicId,webSite.getId());
	}
	
	/**
	 * 通过ID获取文章列表
	 * @param request
	 * @param response
	 * @param menubarId
	 * @return
	 */
	@RequestMapping(value="/getArticleById",method=RequestMethod.POST)
	@ResponseBody
	public List<ArticleView> getArticleById(HttpServletRequest request ,HttpServletResponse response,String menubarId,Integer pageNo,Integer pageSize,@PathVariable String shortUrl){
		
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		if(webSite==null) return null;
		return indexService.getArticleById(menubarId,pageNo,pageSize,webSite.getId());
	}

}
