package com.sg.syj.partner.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sg.syj.entity.po.Partner;

public interface PartnerService {
  
	List<Partner> getPartnerByWebSite(String webSiteType,HttpServletRequest request) throws Exception;
	List<Partner> getPartnerByWebSiteId(String webSiteId);
}
