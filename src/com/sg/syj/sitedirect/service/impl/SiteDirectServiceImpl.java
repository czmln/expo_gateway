package com.sg.syj.sitedirect.service.impl;

import java.util.HashMap;
import java.util.List;




import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.sitedirect.dao.WebSiteDao;
import com.sg.syj.sitedirect.service.SiteDirectService;

@Service
@Transactional
public class SiteDirectServiceImpl implements SiteDirectService{
	
    @Autowired
	private WebSiteDao webSiteDao;
    
	//第一次获取从数据中查询，放到application范围中	
    @SuppressWarnings("unchecked")
	public Map<String,WebSite> getWesiteData(HttpServletRequest request) {
    	if(request==null) return null;    	
    	//将webSite放在应用范围如果没有则查询数据库
    	ServletContext application = request.getServletContext();    	
    	Object webSite = application.getAttribute("webSiet");   	
    	Map<String,WebSite> map=new HashMap<String,WebSite>();    	
    	if(webSite==null){
    		List<WebSite> list= this.getAllWebSite();
		 		
    		for(WebSite w:list){
    			String url = w.getLinkUrl();    			
    			if(StringUtil.isEmpty(url)) continue; 			
    			map.put(url, w);
    		}    		
    	}else{
    		map=(Map<String, WebSite>) webSite;
    	}
    	return map;
    }	
       
    public List<WebSite> getAllWebSite() {   	
    	String hql=" from WebSite o where 1=1";
    	List<WebSite> list = webSiteDao.find(hql);   	
    	return list;
    }
}
