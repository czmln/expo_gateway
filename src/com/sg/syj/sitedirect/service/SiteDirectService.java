package com.sg.syj.sitedirect.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sg.syj.entity.po.WebSite;

public interface SiteDirectService {
	public Map<String,WebSite> getWesiteData(HttpServletRequest request) ;
	public List<WebSite> getAllWebSite() ;
}
