/**
 * @版权所有: 四川曙光集团   
 * @标题: WebSiteServiceImpl.java 
 * @包路径:  com.sg.syj.website.service.impl 
 * @描述: TODO(用一句话描述该文件做什么) 
 * @作者: 李平  
 * @日期: 2015年3月5日 下午3:49:59 
 * @version V1.0   
 */
package com.sg.syj.website.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.WebSite;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.website.dao.IWebSiteDao;
import com.sg.syj.website.service.IWebSiteService;

/**
 * @ClassName WebSiteServiceImpl
 * @Description TODO
 * @author liping liping_mail@qq.com
 * @date 2015年3月5日
 * @see Connection#prepareStatement
 * @see ResultSet
 */
@Transactional
@Service
public class WebSiteServiceImpl implements IWebSiteService {
	@Autowired
	private IWebSiteDao webSiteDao;
	
	

	public void saveOrUpdate(WebSite site) {
		webSiteDao.saveOrUpdate(site);
	}

	/**
	 * 通过ID获取指定一条信息
	 */
	public WebSite get(String id) {

		return webSiteDao.get(" FROM WebSite w where w.id=?",
				new Object[] { id });
	}

	public List<WebSite> getAll() {
		String hql = " FROM WebSite w";
		List<WebSite> lists = webSiteDao.find(hql);
		return lists;
	}

	/**
	 * 删除
	 */
	public void delete(String[] id) {
		webSiteDao.delete(id);
	}

	@Override
	public PagePo<WebSite> getWebSiteByPage(PagePo<WebSite> page){
		String hql = " FROM WebSite e";
		PagePo<WebSite> webSite = webSiteDao.getByPage(page, hql);
		return webSite;
	}

	@Override
	public PagePo<WebSite> getWebSiteByPage(PagePo<WebSite> page,Map<String, Object> map) throws Exception {
		StringBuffer sb=new StringBuffer();
		
		sb.append(" from WebSite o ");
		
		if(map!=null){
			Object obj = map.get("name");
			if( obj!=null){
				String name=obj.toString();
				sb.append(" where o.name like '%");
				sb.append(name);
				sb.append("%'");
			}
		}
		
		return webSiteDao.getByPage(page, sb.toString());
	}
}
