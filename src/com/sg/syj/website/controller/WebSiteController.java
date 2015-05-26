/**
* @版权所有: 四川曙光集团   
* @标题: WebSiteController.java 
* @包路径:  com.sg.syj.website.controller 
* @描述: TODO(用一句话描述该文件做什么) 
* @作者: 李平  
* @日期: 2015年3月5日 下午4:24:47 
* @version V1.0   
*/ 
package com.sg.syj.website.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.Template;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.website.service.IWebSiteService;


/**
 *	@ClassName WebSiteController
 *	@Description TODO
 *	@author liping liping_mail@qq.com
 *	@date 2015年3月5日
 *	@see Connection#prepareStatement
 *	@see ResultSet
 */
@Controller
@RequestMapping("/webSite")
public class WebSiteController {
	@Autowired
	private IWebSiteService webSiteService;
	
	
	/**
	 * 
	 * @param request
	 * 保存
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public boolean saveWebSite(HttpServletRequest request, WebSite webSite) throws Exception {
		String tempId = request.getParameter("tempId");
		if(StringUtils.isNotEmpty(tempId)){
			Template template = new Template();
			template.setId(tempId);
			webSite.setTemplate(template);
			if(webSite.getId()==null || "".equals(webSite.getId())) {
				webSite.setId(null);
			}
			webSiteService.saveOrUpdate(webSite);
		} else {
			return false;
		}
		
		return true;
	}
	
	/**
	 * 列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getWebSite")
    @ResponseBody
    public PagePo<WebSite> getWebSite(HttpServletRequest request) {
    	
		String name = request.getParameter("name");
		Map<String,Object> map = new HashMap<String, Object>();
		if(!StringUtil.isEmpty(name)){
			map.put("name", name);
		}
		
		PagePo<WebSite> page=new PagePo<WebSite>();
		page.setPageNumber(Integer.parseInt(request.getParameter("page")));
		page.setPageSize(Integer.parseInt(request.getParameter("rows")));
		
		try {
			page= webSiteService.getWebSiteByPage(page, map);
			List<WebSite> webs = page.getList();
			for (WebSite webSite : webs) {
				webSite.setMenubars(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
    }
	
	/**
	 * 更新
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView editWebSite( HttpServletRequest request, HttpServletResponse response ) throws Exception {
		String id = request.getParameter("id");
		Map<String, Object> model = new HashMap<String, Object>();
		if(id != null && !"".equals(id)) {
			WebSite webSite = null;
			webSite = webSiteService.get(id);
			model.put("webSite", webSite);			
		}
		return new ModelAndView("website/jsp/addWebSite", model);
	}
	
	/**
	 * 删除
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/deleteWebSite", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteWebSite( HttpServletRequest request) {
		String strIds = request.getParameter("id");
		if (StringUtils.isNotEmpty(strIds)) {
            String[] ids = strIds.split(",");
            try {
            	webSiteService.delete(ids);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
            return true; 
		} else {
			return false;
		}
	}
	/**
	 * 列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getWebSites")
    @ResponseBody
    public List<WebSite> getWebSites(HttpServletRequest request) {
		
		List<WebSite> page = webSiteService.getAll();
		try {
			for (WebSite webSite : page) {
				webSite.setMenubars(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
    }
	
	/**
	 * ajax获取下拉框comboboxList
	 */
	@RequestMapping(value = "/comboboxList")
    @ResponseBody
	public List<Map<String, String>> comboboxList() throws Exception {
		List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		List<WebSite> page = webSiteService.getAll();
		for (WebSite webSite : page) {
			map = new HashMap<String, String>();
			map.put("id", webSite.getId());
			map.put("text", webSite.getName());
			listMap.add(map);
		}
		return listMap;
	}
	
}
