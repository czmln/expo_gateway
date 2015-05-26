package com.sg.syj.article.controller;

import java.util.List;

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

import com.sg.syj.advert.service.AdvertService;
import com.sg.syj.article.service.ArticleService;
import com.sg.syj.common.constant.Constants;
import com.sg.syj.entity.po.Advert;
import com.sg.syj.entity.po.Article;
import com.sg.syj.entity.po.ArticleView;
import com.sg.syj.entity.po.FileInfo;
import com.sg.syj.entity.po.Menubar;
import com.sg.syj.entity.po.Template;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.fileInfo.service.FileInfoService;
import com.sg.syj.menubar.service.MenubarService;
import com.sg.syj.menubarView.service.MenubarViewService;
import com.sg.syj.sitedirect.service.SiteDirectService;

@Controller
@RequestMapping("{shortUrl}/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private FileInfoService fileInfoService;
	@Autowired
	private MenubarService menubarService;
	@Autowired
	private MenubarViewService menubarViewService;
	@Autowired
	private AdvertService advertService;
   
	@Autowired
	private SiteDirectService siteDirectService;
	
	/**
	 * 获取内容信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getActivitysByMenubarId")
	@ResponseBody
	public List<Article> getActivitysByMenubarId(HttpServletRequest request) {
		List<Article> articleList = null;
		String type = request.getParameter("type");
		try {
			articleList = articleService.getArticleByPage(this
					.getMenuId(request),type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleList;
	}

	@RequestMapping(value = "/getArticleById")
	@ResponseBody
	public Article getArticleById(HttpServletRequest request) {
		Article article = null;
		String articleId = request.getParameter("articleId");
		try {
			article = articleService.getArticleById(articleId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return article;
	}
  
	@RequestMapping(value = "/viewArticleById")
	@ResponseBody
	public ArticleView viewArticleById(HttpServletRequest request) {
		ArticleView article = null;
		String articleId = request.getParameter("articleId");
		try {
			article = articleService.updatAarticcount(articleId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return article;
	}
	/**
	 * 获取下载文件实体
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getFinleInfo")
	@ResponseBody
	public List<FileInfo> getAllFinleinfo(HttpServletRequest request,@PathVariable String shortUrl) {
		List<FileInfo> filelist = null;
		//String webtarget = (String)request.getSession().getAttribute("webtarget");
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		if(webSite==null) return filelist;
		try {
			filelist = fileInfoService.getFileInfo(webSite.getId());
			for (FileInfo fileInfo : filelist) {
				fileInfo.setWebSite(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filelist;
	}

	/**
	 * 根据menuid查询父类
	 * 
	 * @param request
	 * @param menuName
	 * @return
	 */
	@RequestMapping(value = "/getMenubarsByMenuId")
	@ResponseBody
	public List<Menubar> getMenubarsByMenuId(HttpServletRequest request) {
		List<Menubar> menubarList = null;
		try {
			menubarList = menubarService.getMenubarByMenubar_id(this
					.getMenuId(request));
			for(Menubar menubar : menubarList){
				menubar.setWebSite(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menubarList;
	}

	/**
	 * 获取参数：导航id
	 * 
	 * @param request
	 * @return
	 */
	public String getMenuId(HttpServletRequest request) {
		return request.getParameter("menuId");

	}

	/**
	 * 文章主页
	 * 
	 * @param request
	 * @param response
	 * @param mnv
	 * @return
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mnv,@PathVariable String shortUrl) {
		String menuId = this.getMenuId(request);
		if(StringUtils.isEmpty(menuId) || "undefined".equals(menuId)){
			menuId = request.getParameter("currentId");
		}
		//获取该链接的站点
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		
		if(webSite==null){
			mnv.setViewName("blue/404");
			return mnv;
		}
		//获取该站点的模版
		Template template=webSite.getTemplate();
		
		/*MenubarView m = menubarViewService.getUrlById(menuId);
		if(null != m){
			request.getSession().setAttribute("shortUrl", m.getShortUrl());
			request.getSession().setAttribute("webtarget", m.getWebSite_id());
			shortUrl = m.getShortUrl();
		}*/
		
		/*String shortUrl = (String)request.getSession().getAttribute("shortUrl");*/
		/*if(StringUtils.isEmpty(shortUrl)){
			mnv.setViewName("blue/index");
			shortUrl = "CH";
			request.getSession().setAttribute("shortUrl", shortUrl);
			return mnv;
		}*/
		
		mnv.addObject("menuId", this.getMenuId(request));
		String currentId = request.getParameter("currentId") == null ? "null"
				: request.getParameter("currentId");
		String articleId = request.getParameter("articleId") == null ? "null"
				: request.getParameter("articleId");
		
		
		
		/*if("CH".equals(shortUrl)){
			mnv.setViewName("blue/main");
		}else if("EN".equals(shortUrl)){
			mnv.setViewName("blue_EN/main");
		}*/
		mnv.setViewName(template.getUrl()+"/main");
		
		
		mnv.addObject("currentId", currentId);
		mnv.addObject("nav_type", request.getParameter("nav_type"));
		mnv.addObject("articleId", articleId);
		List<Advert> list = null;
		try {
			list = this.advertService.getNewAdver();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mnv.addObject("advertList", list);
		mnv.addObject("shortUrl", shortUrl);
		return mnv;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @param mnv
	 * @return
	 */
	@RequestMapping(value = "/totelephone")
	@ResponseBody
	public void getitelephone(HttpServletRequest request,
			HttpServletResponse response, String[] arr) {
		String[] ches = arr[0].split(",");
		if (ches.length > 0) {
			for(int i=0;i<ches.length;i++){
			}
		}
	}

	/**
	 * 根据导航类型选择内容样式
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getView")
	public ModelAndView getView(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mnv,@PathVariable String shortUrl) {
		
	    WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
	    if(webSite==null) return mnv;
	    Template template = webSite.getTemplate();
	    
		String current_page = request.getParameter("current_page");
		String nav_type = request.getParameter("nav_type");
		String menuId = this.getMenuId(request);
		String articleId = request.getParameter("articleId");
		mnv.addObject("articleId", articleId);
		mnv.addObject("menuId", menuId);
		mnv.addObject("current_page", current_page);
		if(StringUtils.isEmpty(shortUrl)){
			shortUrl = "CH";
		}
		switch (nav_type) {
		case Constants.MENUTYPE_ACTIVITY:
			mnv.setViewName(template.getUrl()+"/mainActivity");
			break;
		case Constants.MENUTYPE_SERVICE:
			mnv.setViewName(template.getUrl()+"/service");
			mnv.addObject("nav_type", nav_type);
			break;
		case Constants.MENUTYPE_MEDIA:
			mnv.addObject("nav_type", nav_type);
			mnv.setViewName(template.getUrl()+"/media");
			break;
		case Constants.MENUTYPE_BUYERS:
			mnv.setViewName(template.getUrl()+"/buyers");
			break;
		case Constants.MENUTYPE_ABOUT:
			mnv.setViewName(template.getUrl()+"/about");

			break;
		case Constants.MENUTYPE_ABOUT2:
			mnv.addObject("nav_type", nav_type);
			mnv.setViewName(template.getUrl()+"/about2");
			break;
		case Constants.MENUTYPE_CPZS:
			mnv.setViewName(template.getUrl()+"/zanszp");
			break;
		case Constants.MENUTYPE_DOMLOAD:
			mnv.setViewName(template.getUrl()+"/download");
			break;
		case Constants.MENUTYPE_CONTACT:
			mnv.setViewName(template.getUrl()+"/contact");
			break;
		case Constants.MENUTYPE_SERVICE2:
			mnv.setViewName(template.getUrl()+"/service");
			mnv.addObject("nav_type", nav_type);
			break;
		case Constants.MENUTYPE_MEDIA_CONTACT:
			mnv.addObject("nav_type", nav_type);
			mnv.setViewName(template.getUrl()+"/media");
			break;
		default:
			mnv.addObject("nav_type", nav_type);
			mnv.setViewName(template.getUrl()+"/media");
			break;
		}
		
		mnv.addObject("shortUrl", shortUrl);
		
		return mnv;
	}
	
	/**
	 * 全文搜索页面
	 * @param request
	 * @param response
	 * @param view
	 * @return
	 */
	@RequestMapping(value="searchArticlePage",method=RequestMethod.POST)
	public ModelAndView searchArticlePage(HttpServletRequest request,HttpServletResponse response,String keyword,String tag,ModelAndView view,@PathVariable String shortUrl){
		
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		
		if(webSite==null){
			view.setViewName("/blue/404");
			return view;
		}
		Template template=webSite.getTemplate();
		/*if("EN".equals(tag)){
			
			request.getSession().setAttribute("shortUrl", "EN");
			request.getSession().setAttribute("webtarget", "2c9087954c2bbc11014c2bd8cdf1000b");
			view.setViewName("blue_EN/search");
			view.addObject("tag", "EN");
		}else{
			request.getSession().setAttribute("shortUrl", "CH");
			request.getSession().setAttribute("webtarget", "2c9087ef4c019cbe014c019d50db0000");
			view.setViewName("blue/search");
			view.addObject("tag", "CH");
		}*/
		
		view.setViewName(template.getUrl()+"/search");
		
		view.addObject("keyword", keyword);
		view.addObject("shortUrl", shortUrl);
		return view;
	}

	/**
	 * 全文搜索
	 * @param request
	 * @param response
	 * @param view
	 * @param keyword
	 * @return
	 */
	@RequestMapping(value="searchArticle",method=RequestMethod.POST)
	@ResponseBody
	public List<Article> searchArticle(HttpServletRequest request,HttpServletResponse response,ModelAndView view,String keyword,@PathVariable String shortUrl){
		
		
		List<Article> list = articleService.searchArticle(keyword, shortUrl);
		
		
		return list;
	}
	/**
	 * 文章主页
	 * 
	 * @param request
	 * @param response
	 * @param mnv
	 * @return
	 */
//	@RequestMapping(value = "/download")
//	public void downloadFile(String filePath, HttpServletResponse response,
//			HttpServletRequest request) {
//		String a=request.getSession().getServletContext().getRealPath("/");
//		System.out.println(a+"11111111111");
//		//filePath=request.getContextPath()+filePath;
//		System.out.println("aaaaaa"+filePath);
//		//filePath="F:\\workspace\\expo_manage\\WebContent\\upload\\file\\20150318\\test.doc";
//		DownLoadUtil.downloadFile(a+filePath, request, response);
//	}

}
