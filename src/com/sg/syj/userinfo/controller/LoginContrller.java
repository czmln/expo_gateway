package com.sg.syj.userinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sg.syj.common.constant.Constants;
import com.sg.syj.common.exception.LogicException;
import com.sg.syj.entity.po.UserInfo;
import com.sg.syj.entity.vo.ResultMsg;
import com.sg.syj.userinfo.service.IUserInfoService;


@Controller
@RequestMapping(value="/login")
public class LoginContrller {
	
	@Autowired
	private IUserInfoService userInfoService;
	/**
	 * 登陆验证  普通 form 提价
	 * @author dzg
	 * @param request
	 * @return
	 */
//	@RequestMapping(value="/checklogin")
//	public ModelAndView checkLogin(HttpServletRequest request){
//		
//		ModelAndView mv= new ModelAndView();
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		HttpSession session = request.getSession();
//		try {	
//			UserInfo userInfo=null;
//			if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)){
//				 userInfo = userInfoService.checkLogin(username,password);
//				 session.setAttribute(Constants.USER_IN_SESSION, userInfo);
//				 //30分钟
//				 session.setMaxInactiveInterval(1800000);
//				 mv.setViewName("redirect:/view/userinfo/jsp/center.jsp");
//			}
//			
//		} catch (LogicException e) {
//			mv.addObject("errorMsg", e.getMessage());
//			mv.setViewName("/userinfo/jsp/login");
//		}
//		return mv;
//	}
	/**
	 *  ajax 请求 验证用户名
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/checklogin")
	@ResponseBody
	public ResultMsg checkLogin(HttpServletRequest request){
		
		ResultMsg rm= null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		try {	
			UserInfo userInfo=null;
			if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)){
				 userInfo = userInfoService.checkLogin(username,password);
				 session.setAttribute(Constants.USER_IN_SESSION, userInfo);
				 //30分钟
				 session.setMaxInactiveInterval(1800000);
				 //返回结果视图
				 rm=new ResultMsg(true, "登录成功",100);
			}
		} catch (LogicException e) {
			rm=new ResultMsg(false, e.getMessage(), e.getErrorCode());
		}
		return rm;
	}
	
	
	@RequestMapping("/checkUsername")
	@ResponseBody
	public ResultMsg checkUsername(HttpServletRequest request){
		ResultMsg msg =null;
		String username = request.getParameter("username");
		try {
			userInfoService.checkUsername(username);
		} catch (LogicException e) {
			msg=new ResultMsg(true, e.getMessage());
		}
		return msg;
	}
	
	@RequestMapping("/logOut")
	public ModelAndView logOut(HttpServletRequest req){
		req.getSession().invalidate();
		return new ModelAndView("redirect:/view/userinfo/jsp/center.jsp");
	}
}
