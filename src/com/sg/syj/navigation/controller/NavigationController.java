package com.sg.syj.navigation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.entity.po.Navigation;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.navigation.service.NavigationService;

/**
 * 网站导航Controller
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/nav")
public class NavigationController {

	@Autowired
	private NavigationService navigationService;

	/**
	 * 初始页
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response, ModelAndView modelAndView) {
		
		modelAndView.setViewName("/nav/jsp/navlist");
		
		return modelAndView;
	}
	/**
	 * 新增或修改
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/insertupdate", method = RequestMethod.GET)
	public ModelAndView insertupdate(HttpServletRequest request,
			HttpServletResponse response, ModelAndView modelAndView,String id){

		if(!StringUtils.isBlank(id)){
			
			Navigation nav = navigationService.findById(id);
			
			modelAndView.addObject("nav", nav);
			modelAndView.setViewName("/nav/jsp/editnav");
			
		}else{
			
		modelAndView.setViewName("/nav/jsp/addnav");
		
		}
		return modelAndView;
	}

	/**
	 * 保存或修改栏目
	 * 
	 * @param request
	 * @param response
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/saveorupdate", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveorupdate(HttpServletRequest request,
			HttpServletResponse response, Navigation nav) {

		try {
			if (nav != null) {

				navigationService.saveorupdate(nav);

				return true;
			} else {

				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();

			return false;
		}

	}

	/**
	 * 删除栏目
	 * 
	 * @param request
	 * @param response
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean delete(HttpServletRequest request,
			HttpServletResponse response, String ids) {
		
		String[] i=null;
		if(!StringUtils.isBlank(ids)){
			
			i = ids.split(",");
		}
		return navigationService.delete(i);
	}

	/**
	 * 根据类型获取栏目列表
	 * 
	 * @param request
	 * @param response
	 * @param navtype
	 * @return
	 */
	@RequestMapping(value = "/getListByType", method = RequestMethod.POST)
	@ResponseBody
	public List<Navigation> getListByType(HttpServletRequest request,
			HttpServletResponse response, String navtype) {

		return navigationService.getListbyType(navtype);
	}

	/**
	 * 获取栏目分页列表
	 * 
	 * @param request
	 * @param response
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/getNavigationPage", method = RequestMethod.POST)
	@ResponseBody
	public PagePo<Navigation> getNavigationPage(HttpServletRequest request,
			HttpServletResponse response, String name,int page,int rows) {
         PagePo<Navigation> pg=new PagePo<Navigation>();
         pg.setPageNumber(page);
         pg.setPageSize(rows);
		return navigationService.getNavigationPage(pg, name);
	}

}
