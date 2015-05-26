package com.sg.syj.menubar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.Menubar;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.entity.vo.TreeGridMenubar;
import com.sg.syj.menubar.service.MenubarService;
import com.sg.syj.menubarView.service.MenubarViewService;
import com.sg.syj.sitedirect.service.SiteDirectService;
import com.sg.syj.website.service.IWebSiteService;

/**
 * 导航栏
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="{shortUrl}/menubar")
public class MenubarController {
	@Autowired
	private MenubarService menubarService;
	@Autowired
	private MenubarViewService menubarViewService;
	@Autowired
	private IWebSiteService webSiteService;
	@Autowired
	private SiteDirectService siteDirectService;
	/**
	 * 
	 * @Title: 导航栏数据
	 * @param HttpServletRequest
	 *            request
	 * @return String
	 */
	@RequestMapping(value = "/getMenubarsByType")
	@ResponseBody
	public List<TreeGridMenubar> getMenubarsByType(HttpServletRequest request,@PathVariable("shortUrl")String shortUrl,@RequestParam(value="menuName",required=false)String menuName) {
		//String webtarget = (String)request.getSession().getAttribute("webtarget");
		
		//从应用中获取到所有站点数据
		Map<String, WebSite> webSites = siteDirectService.getWesiteData(request);
		//取出当前短链接所属的站点
		WebSite webSite = webSites.get(shortUrl);
		
		if(webSite==null) return null;
		
		List<TreeGridMenubar> resultList =new ArrayList<TreeGridMenubar>();
		if(!StringUtil.isEmpty(menuName)){
			Map<String,String> map = new HashMap<String,String>();
			map.put("name", menuName);
		}
		try {
			List<Menubar> lists = menubarService.getMenubarByType(webSite.getId());
			
			for(Menubar menubar:lists){
				List<TreeGridMenubar> resultList1 =new ArrayList<TreeGridMenubar>();
				TreeGridMenubar tmb = new TreeGridMenubar().getTreeGridMenubar(menubar);
				List<Menubar> list = menubarService.getMenubarByMenuId(menubar.getId());
				for(Menubar menubar1 : list){
					TreeGridMenubar tmb2 = new TreeGridMenubar().getTreeGridMenubar(menubar1);
					List<TreeGridMenubar> resultList2 =new ArrayList<TreeGridMenubar>();
					List<Menubar> list1 = menubarService.getMenubarByMenuId(menubar1.getId());
					for(Menubar menubar2:list1){
						TreeGridMenubar tmb3 = new TreeGridMenubar().getTreeGridMenubar(menubar2);
						resultList2.add(tmb3);
					}
					tmb2.setChildren(resultList2);
					resultList1.add(tmb2);
				}
				tmb.setChildren(resultList1);
				resultList.add(tmb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	/**
	 * 根据menuid查询父类
	 * @param request
	 * @param menuName
	 * @return
	 */
	@RequestMapping(value = "/getMenubarsByMenuId")
	@ResponseBody
	public List<Menubar> getMenubarsByMenuId(HttpServletRequest request,String menuId) {
		try {
			return menubarService.getMenubarByMenuId(menuId);
		} catch (Exception e) {
			e.printStackTrace();
		return null;
		}
	}
	
	/**
	 * 根据menuid查询父类
	 * @param request
	 * @param menuName
	 * @return
	 */
	@RequestMapping(value = "/getById")
	@ResponseBody
	public Menubar getById(HttpServletRequest request) {
		String menuId = request.getParameter("menuId");
		Menubar m = this.menubarService.getById(menuId);
		if(null != m){
			m.setWebSite(null);
		}
		return m;
	}
}
