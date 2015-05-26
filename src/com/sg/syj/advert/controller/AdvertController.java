package com.sg.syj.advert.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.sg.syj.advert.service.AdvertLocationService;
import com.sg.syj.advert.service.AdvertService;
import com.sg.syj.common.util.JsonUtil;
import com.sg.syj.entity.po.Advert;
import com.sg.syj.entity.po.AdvertLocation;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.entity.vo.AdvertVo;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.sitedirect.service.SiteDirectService;

@Controller
@RequestMapping(value="{shortUrl}/ag")
public class AdvertController {
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AdvertLocationService advertLocationService;
	
	@Autowired
	private SiteDirectService siteDirectService;
	
	@RequestMapping(value = "/getImg")
	@ResponseBody
	public Advert getImg(HttpServletRequest request) {
		String menubar_id = request.getParameter("menubar_id");
		Advert o = null;
		try {
			o = this.advertService.getImg(menubar_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}
	
	/**
	 * 提交demo
	 * @Title: addDemo
	 * @param HttpServletRequest request
	 * @return String
	 */
	@RequestMapping(value = "/saveAg", method = RequestMethod.POST)
	@ResponseBody
	public boolean save( HttpServletRequest request){
		String json = request.getParameter("data");
		String advertLocalId = request.getParameter("advertLocalId");
		
		if (StringUtils.isNotEmpty(json)) {
			Advert demo = new Advert();
		try{
			demo = JsonUtil.jsonToObject(json, Advert.class);
			demo.setAdvertLocation(advertLocationService.getAdvertLocationById(advertLocalId));
			advertService.saveOrUpdate(demo);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		} else {
			return false;
		}
		return false;
	}
	
	
	/**
	 * 提交demo
	 * @Title: addDemo
	 * @param HttpServletRequest request
	 * @return String
	 */
	@RequestMapping(value = "/delAg", method = RequestMethod.POST)
	@ResponseBody
	public boolean del( HttpServletRequest request) {
		String strIds = request.getParameter("id");
		if (StringUtils.isNotEmpty(strIds)) {
            String[] ids = strIds.split(",");
            try {
            	advertService.del(ids);
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
	 * 跳转修改页面
	 * @Title: goEdit
	 * @param goEdit goEdit
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit( HttpServletRequest request, HttpServletResponse response ) {
		String id = request.getParameter("id");
		Map<String, Object> map = new HashMap<String, Object>();
		Advert demo;
		try {
			demo = advertService.getAdvertById(id);
			map.put("advert", demo);
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return new ModelAndView("advert/jsp/addAdvert", map);
	}
	
    /**
	 * 提交demo
	 * @Title: addDemo
	 * @param HttpServletRequest request
	 * @return String
	 */
	@RequestMapping(value = "/getAg")
    @ResponseBody
    public PagePo<Advert> getAdvert(HttpServletRequest request) {
	
		PagePo<Advert> page=new PagePo<Advert>();
		page.setPageNumber(Integer.parseInt(request.getParameter("page")));
		page.setPageSize(Integer.parseInt(request.getParameter("rows")));
		String name = request.getParameter("name");
		Map<String,Object> map =  new HashMap<String,Object>();
		try {
			if(!"".equals(name)&& name != null){
				map.put("name",name);
			}
			page= advertService.getAdvertByPage(page,map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
    }
	
	
	
	
	/**
	 * 页面判断添加位置
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getAgLocations")
    @ResponseBody
    public List<AdvertLocation> getWebSites(HttpServletRequest request) {
		String webSiteName = request.getParameter("webSiteName");
		try {
			List<Advert> adverts =advertService.getAdvertsByWebSiteName(webSiteName);
			List<AdvertLocation> resultList =  new ArrayList<AdvertLocation>();
			List<AdvertLocation> page= advertLocationService.getAll();
			//循环得到数量和名字
			Map<String,Integer> map  = new HashMap<String,Integer>();
			for(Advert advert :adverts){
				String name = advert.getAdvertLocation().getLocaltionName();
				map.put(name, map.get(name) == null?1:map.get(name)+1);
			}
			for(AdvertLocation advertLoaction:page){
				String locationName = advertLoaction.getLocaltionName();
				int locationNumber = advertLoaction.getAdvertNumber();
				Integer i = map.get(locationName);
				if(i == null){
					i=0;
				}
				if(i<locationNumber){
						resultList.add(advertLoaction);
				}
			}
			if(resultList.size() == 0){
				AdvertLocation al =new AdvertLocation();
				al.setLocaltionName("对不起,此站点广告位已满");
				al.setId("0");
				resultList.add(al);
			}
			return resultList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
	

	/**
	 * 根据站点名称获取广告
	 * @param request
	 * @param menuName
	 * @return
	 */
	@RequestMapping(value = "/getAgByWebSiteName")
	@ResponseBody
	public List<AdvertVo> getAdvertsByWebSiteName(HttpServletRequest request,@PathVariable String shortUrl) {
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		if (webSite==null)  return null;
		try {
			List<Advert> adverts =advertService.getAdvertsByWebSiteName(webSite.getName());
			List<AdvertVo> advertVo=new ArrayList<AdvertVo>(); 
			for (Advert advert : adverts) {
				AdvertVo av =  new AdvertVo().getAdvertVo(advert); 
				if("".equals(advert.getUrl())||advert.getUrl() == null){
					av.setUrl("");//此地址为广告详情页面的广告
				}else{
					av.setUrl(advert.getUrl());
				}
				advertVo.add(av);
			}
			return advertVo;
		} catch (Exception e) {
			e.printStackTrace();
		return null;
		}
	}
	
	
	@RequestMapping(value = "/getContentPage")
	public ModelAndView getContentPage(HttpServletRequest request,String id,@PathVariable String shortUrl) {
		Map<String, Object> map = new HashMap<String, Object>();
		WebSite webSite = siteDirectService.getWesiteData(request).get(shortUrl);
		if(webSite==null) return null;
		try {
			Advert advert = advertService.getAdvertById(id);
			map.put("advert", advert);
			return new ModelAndView(webSite.getTemplate().getUrl()+"/advertContent", map);
		} catch (Exception e) {
			e.printStackTrace();
		return null;
		}
	}
	
	
}
