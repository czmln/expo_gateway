package com.sg.syj.exhibitType.controller;

import java.util.ArrayList;
import java.util.Date;
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

import com.sg.syj.common.util.JsonUtil;
import com.sg.syj.entity.po.ExhibitType;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.exhibitType.service.ExhibitTypeService;

/**
 * 展品类别管理
 */
@Controller
@RequestMapping("/exhibitType")
public class ExhibitTypeControl {
	@Autowired
	private ExhibitTypeService exhibitTypeService;
	
	/**
	 * 展示商品类别
	 * @Title: addDemo
	 * @param HttpServletRequest request
	 * @return  PagePo<ExhibitType>
	 */
	@RequestMapping(value = "/getExhibitType")
	@ResponseBody
	public PagePo<ExhibitType> getExhibitType(HttpServletRequest request){
		PagePo<ExhibitType> page = new PagePo<ExhibitType>();
		
		page.setPageNumber(Integer.parseInt(request.getParameter("page")));
		page.setPageSize(Integer.parseInt(request.getParameter("rows")));
		try {
			String typeName=request.getParameter("typeName");
			Map<String,Object> map = null ;
			if(!"".equals(typeName) && typeName != null){
				map=   new HashMap<String,Object>();
				map.put("typeName", typeName);
			}
			page = exhibitTypeService.getExhibitTypeByPage(page,map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
	}
	
	/**
	 * 保存展品类别
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveExhibitType", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveExhibitType(HttpServletRequest request) {
		String json = request.getParameter("data");
		if (StringUtils.isNotEmpty(json)){
			ExhibitType demo = new ExhibitType();
		try{
			demo = JsonUtil.jsonToObject(json, ExhibitType.class);
			demo.setRegTime(new Date());
			exhibitTypeService.saveOrUpdate(demo);
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
	 * 删除展品类别
	 * @Title: delExhibitType
	 * @param HttpServletRequest request
	 * @return boolean
	 */
	@RequestMapping(value = "/delExhibitType", method = RequestMethod.POST)
	@ResponseBody
	public boolean delExhibitType( HttpServletRequest request) {
		String strIds = request.getParameter("id");
		if (StringUtils.isNotEmpty(strIds)) {
			String[] ids = strIds.split(",");
			try {
            	exhibitTypeService.del(ids);
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
		ExhibitType demo;
		try {
			demo = exhibitTypeService.getExhibitTypeById(id);
			map.put("demo", demo);
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return new ModelAndView("exhibit/jsp/typeEdit", map);
	}
	
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Map<String, Object>> getAll(HttpServletRequest req) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		List<ExhibitType> types = exhibitTypeService.getAll();
		
		String defuat = req.getParameter("defaut");
		if("1".equals(defuat)) {
			map = new HashMap<String, Object>();
			map.put("id", "0");
			map.put("text", "全部");
			listmap.add(map);
		}
		
		for (ExhibitType type : types) {
			map = new HashMap<String, Object>();
			map.put("id", type.getId());
			map.put("text", type.getTypeName());
			listmap.add(map);
		}
		
		return listmap;
	}
	
	
	
	/**查询出所有的类别
	 * @param req
	 * @return
	 */
	@RequestMapping(value ="/getAllTypes")
	@ResponseBody
	public List<ExhibitType> getAlls(HttpServletRequest req){
		List<ExhibitType> types = exhibitTypeService.getAll();
		return types;
	}
}
