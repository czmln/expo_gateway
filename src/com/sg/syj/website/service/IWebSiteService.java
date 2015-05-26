/**
* @版权所有: 四川曙光集团   
* @标题: IWebSiteService.java 
* @包路径:  com.sg.syj.website.service 
* @描述: TODO(用一句话描述该文件做什么) 
* @作者: 李平  
* @日期: 2015年3月5日 下午3:43:44 
* @version V1.0   
*/ 
package com.sg.syj.website.service;

import java.util.List;
import java.util.Map;

import com.sg.syj.entity.po.WebSite;
import com.sg.syj.entity.vo.PagePo;

/**
 *	@ClassName IWebSiteService
 *	@Description TODO
 *	@author liping liping_mail@qq.com
 *	@date 2015年3月5日
 *	@see Connection#prepareStatement
 *	@see ResultSet
 */
public interface IWebSiteService {
	/**
	 * 新增站点
	 */
	public void saveOrUpdate(WebSite site);
	/**
	 * 删除站点
	 * @param id
	 */
	public void delete(String[] id);
	
	/**
	 * 查看站点
	 */
	
	public WebSite	get(String id);	
	
	public List<WebSite> getAll();
	
	public PagePo<WebSite> getWebSiteByPage(PagePo<WebSite> page);
	
	/**
	 * 根据名称查找数据，并分页；
	 * @param page
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public PagePo<WebSite> getWebSiteByPage(PagePo<WebSite> page,Map<String, Object> map) throws Exception;
}
