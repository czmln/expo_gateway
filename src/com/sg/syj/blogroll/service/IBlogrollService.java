package com.sg.syj.blogroll.service;

import java.util.List;



import javax.servlet.http.HttpServletRequest;

import com.sg.syj.entity.po.Blogroll;


public interface IBlogrollService {
	
	List<Blogroll> getBlogrollByWebSite(String webSiteType,HttpServletRequest request) throws Exception;
	List<Blogroll> getBlogrollByWebSiteId(String webSiteId);
	
}
