package com.sg.syj.blogroll.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.blogroll.dao.IBlogrollDao;
import com.sg.syj.blogroll.service.IBlogrollService;
import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.Blogroll;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.sitedirect.service.SiteDirectService;

@Transactional
@Service
public class BlogrollServiceImpl implements IBlogrollService{

	@Autowired
	private IBlogrollDao blogrollDao;
	
	@Autowired
	private SiteDirectService siteDirectService;

	@Override
	public List<Blogroll> getBlogrollByWebSite(String webSiteType,	HttpServletRequest request) throws Exception {
		if(StringUtil.isEmpty(webSiteType)) return null;
		Map<String, WebSite> map = siteDirectService.getWesiteData(request);
		WebSite webSite = map.get(webSiteType);
		if(webSite==null) return null;
		return getBlogrollByWebSiteId(webSite.getId());
	}

	@Override
	public List<Blogroll> getBlogrollByWebSiteId(String webSiteId) {
		
		String hql=" from Blogroll o where o.status=1 and o.webSite.id=? order by o.sort asc";		
		List<Blogroll> list = blogrollDao.find(hql, new Object[]{webSiteId});
		
		return list;
	}
	
}
