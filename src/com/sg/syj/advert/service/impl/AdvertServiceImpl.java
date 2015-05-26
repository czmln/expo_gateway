package com.sg.syj.advert.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.advert.dao.AdvertDao;
import com.sg.syj.advert.service.AdvertService;
import com.sg.syj.entity.po.Advert;
import com.sg.syj.entity.vo.PagePo;

@Service
@Transactional
public class AdvertServiceImpl implements AdvertService{
	@Autowired
	private AdvertDao advertDao;
	
	@Override
	public Advert getImg(String menubar_id) throws Exception {
		String hql = " from Advert where menubar_id = ?";
		return this.advertDao.get(hql, new Object[]{menubar_id});
	}

	@Override
	public void saveOrUpdate(Advert advert) throws Exception {
		if("".equals(advert.getId())){
			advert.setId(null);
		}
		advertDao.saveOrUpdate(advert);
	}

	@Override
	public void del(String[] ids) throws Exception {
		advertDao.delete(ids);	
	}

	@Override
	public PagePo<Advert> getAdvertByPage(PagePo<Advert> page,
			Map<String, Object> map) throws Exception {
		StringBuffer hql=new StringBuffer();
		if(map!= null && map.size()!=0){
			hql.append("from Advert o where 1=1 and webSiteName like '"+map.get("name")+"%'");
		}else{
			hql.append(" from Advert o where 1=1");
		}
		return advertDao.getByPage(page, hql.toString());
	}
	
	@Override
	public Advert getAdvertById(String id) throws Exception {
		return advertDao.get(Advert.class, id);
	}

	@Override
	public List<Advert> getAdvertsById(String advertId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Advert> getAdvertsByWebSiteName(String webSiteName)
			throws Exception {
		String hql ="from Advert where 1=1 order by ord desc";
		if(!"".equals(webSiteName)){
			 hql = "from Advert where webSiteName ='"+webSiteName+"' order by ord desc";
		}
		return advertDao.find(hql);
	}

	@Override
	public List<Advert> getNewAdver() throws Exception {
		String hql = "from Advert order by id desc";
		return this.advertDao.find(hql);
	}
	
}
