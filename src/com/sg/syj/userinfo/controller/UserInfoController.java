package com.sg.syj.userinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.common.constant.Constants;
import com.sg.syj.entity.po.UserInfo;
import com.sg.syj.entity.vo.RegisterResult;
import com.sg.syj.userinfo.service.IUserInfoService;


/**
 * 
 * @author dzg
 *
 */
@Controller
@RequestMapping("/userinfo")
public class UserInfoController {
	
	@Autowired
	private IUserInfoService userInfoService;
	
	@RequestMapping("/toRegister")
	public ModelAndView toRegister(HttpServletRequest request) throws Exception{
		
		String selected_ids = request.getParameter("selected_id");
		RegisterResult rrt =null; 
		if("1".equals(selected_ids)){
			rrt=new RegisterResult(2,"境内企业");
		}
		if("2".equals(selected_ids)){
			rrt=new RegisterResult(1,"媒体");
		}
		if("3".equals(selected_ids)){
			rrt=new RegisterResult(4,"专业观众");
		}
		if("4".equals(selected_ids)){
			rrt=new RegisterResult(3,"境外企业");
		}
		if("5".equals(selected_ids)){
			rrt=new RegisterResult(0,"个人");
		}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("registerType",rrt);
		mv.setViewName("/userinfo/jsp/register");
		return mv;
	}
	
	
	@RequestMapping(value="/register")
	public ModelAndView register(HttpServletRequest req) throws Exception{
		ModelAndView mv=new ModelAndView();
		
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String registerType = req.getParameter("registerType");
		Integer sex=Integer.valueOf(req.getParameter("sex"));
		
		UserInfo userInfo = userInfoService.saveByFormId(username,email,password,registerType,sex);
		HttpSession session = req.getSession();
		session.setAttribute(Constants.USER_IN_SESSION, userInfo);
		//30分钟
		session.setMaxInactiveInterval(1800000);
		mv.setViewName("/userinfo/jsp/center");
		return mv;
	}
}
