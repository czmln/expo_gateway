package com.sg.syj.exhibit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.common.util.DateUtil;
import com.sg.syj.entity.po.ExhibitInfo;
import com.sg.syj.entity.po.ExhibitType;
import com.sg.syj.entity.po.UserInfo;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.exhibit.service.IExhibitService;

/***
 * 
 * 说明:展商展品模块;
 *
 */
@Controller
@RequestMapping("${shortUrl}/exhibit")
public class ExhibitControl {
	
	@Autowired
	private IExhibitService exhibitService;
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@ResponseBody
	public boolean save(HttpServletRequest req, ExhibitInfo exhibit) throws Exception {
		if(exhibit != null) {
			
			String exhibitTypeId = req.getParameter("exhibitTypeId");
			String regDate = req.getParameter("regDatime");
			String userInfoId = req.getParameter("userInfo_id");
			
			if(StringUtils.isNotEmpty(exhibitTypeId)) {
				ExhibitType type = new ExhibitType();
				type.setId(exhibitTypeId);
				exhibit.setExhibitType(type);
			}
			if(StringUtils.isNotEmpty(regDate)) {
				exhibit.setRegDate(DateUtil.parseDate(regDate, "yyyy-MM-dd"));
			}
			
			if(StringUtils.isNotEmpty(userInfoId)) {
				UserInfo userinfo = new UserInfo();
				userinfo.setId(userInfoId); //以后取session中的值
				exhibit.setUserInfo(userinfo);
			}
			
			exhibitService.saveOrUpdate(exhibit);
		}
		return true;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(HttpServletRequest req) throws Exception {
		String strIds = req.getParameter("id");
		
		if (!StringUtils.isEmpty(strIds)) {
            String[] ids = strIds.split(",");
            
            try {
				exhibitService.delete(ids);
			} catch (Exception e) {				
				e.printStackTrace();
				return false;
			}   
		}
		
		return true;
	}

	/**
	 * 编辑
	 */
	@RequestMapping("/edit")
	public ModelAndView edit(HttpServletRequest req) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		String id = req.getParameter("id");
		
		if(StringUtils.isNotEmpty(id)) {
			model.put("exhibit", exhibitService.getById(id));
		}
		
		return new ModelAndView("/exhibit/jsp/exhibitEdit", model);
	}
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PagePo<ExhibitInfo> list(HttpServletRequest req) throws Exception {
		
		PagePo<ExhibitInfo> page=new PagePo<ExhibitInfo>();
		Map<String, Object> map = new HashMap<String, Object>();
		int pagenum = Integer.parseInt(req.getParameter("page"));
		int rows = Integer.parseInt(req.getParameter("rows"));
		
		map.put("typeId", req.getParameter("typeId"));
		
		page.setPageNumber(pagenum);
		page.setPageSize(rows);
		
		return exhibitService.getByPage(page, map);
	}
	
	@RequestMapping("/lists")
	@ResponseBody
	public List<ExhibitInfo> lists(HttpServletRequest req) throws Exception {
		
		PagePo<ExhibitInfo> page=new PagePo<ExhibitInfo>();
		Map<String, Object> map = new HashMap<String, Object>();
		page.setPageNumber(req.getParameter("pageIndex") ==null?0:Integer.parseInt(req.getParameter("pageIndex")));
		page.setPageSize(req.getParameter("pageSize") == null?100:Integer.parseInt(req.getParameter("pageSize")));
		map.put("typeId", req.getParameter("typeId"));
		map.put("title", req.getParameter("title"));
		
		return exhibitService.getExhibitByWebId(page, map).getList();
	}
}
