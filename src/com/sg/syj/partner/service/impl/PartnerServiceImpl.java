package com.sg.syj.partner.service.impl;



import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.Partner;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.partner.dao.PartnerDao;
import com.sg.syj.partner.service.PartnerService;
import com.sg.syj.sitedirect.service.SiteDirectService;

@Service
@Transactional
public class PartnerServiceImpl implements PartnerService {
	
	@Autowired
    private PartnerDao partnerDao;
	
	@Autowired
	private SiteDirectService siteDirectService;
	
	public List<Partner> getPartnerByWebSite(String webSiteType,HttpServletRequest request) throws Exception {
		if(StringUtil.isEmpty(webSiteType)) return null;
		Map<String, WebSite> map = siteDirectService.getWesiteData(request);
		WebSite webSite = map.get(webSiteType);
		if(webSite==null) return null;
		return getPartnerByWebSiteId(webSite.getId());
	}
	
	public List<Partner> getPartnerByWebSiteId(String webSiteId){
		String hql=" from Partner o where o.enable=1 and o.webSite.id=? order by o.sort asc";		
		List<Partner> list = partnerDao.find(hql, new Object[]{webSiteId});
		
		return list;
	}
}
