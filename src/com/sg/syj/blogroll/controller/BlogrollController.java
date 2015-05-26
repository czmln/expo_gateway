package com.sg.syj.blogroll.controller;

import java.util.List;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sg.syj.blogroll.service.IBlogrollService;
import com.sg.syj.entity.po.Blogroll;


@Controller
@RequestMapping("{shortUrl}/blogroll")
public class BlogrollController {
	
	@Autowired
	private IBlogrollService blogrollService;
	
	
	
	//通过站点id获取对应的数据;
	@RequestMapping("getBlogrollByWebSiteId")
	@ResponseBody
	public List<Blogroll> getBlogrollByWebSiteId(HttpServletRequest request,@PathVariable String shortUrl) throws Exception {
		
		  List<Blogroll> list = blogrollService.getBlogrollByWebSite(shortUrl, request);
		  for(Blogroll b:list){
			  b.setWebSite(null);
		  }
		  return list;
	}
	
}
