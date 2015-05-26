package com.sg.syj.partner.controller;


import java.util.List;





import javax.servlet.http.HttpServletRequest;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sg.syj.common.util.StringUtil;
import com.sg.syj.entity.po.Partner;
import com.sg.syj.partner.service.PartnerService;


/***
 * 
 * 说明:合作伙伴管理
 *
 */
@Controller
@RequestMapping("{shortUrl}/partner")
public class PartnerController {
  @Autowired
  private PartnerService partnerService;
  
  
  /***
   * 根据网站查询合作伙伴
   * @param request
   * @return
   * @throws Exception 
   */
  @RequestMapping("/getPartnerByWebSite")
  @ResponseBody
  public  List<Partner>  getPartnerByWebSite(HttpServletRequest request,@PathVariable String shortUrl) throws Exception{
	  if(StringUtil.isEmpty(shortUrl)){
			shortUrl = "CH";
	  }
	  List<Partner> list = partnerService.getPartnerByWebSite(shortUrl,request);
	  for(Partner p:list){
		  p.setWebSite(null);
	  }
	  return list;
  }

}
