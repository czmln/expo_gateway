package com.sg.syj.navigation.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.Navigation;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.navigation.dao.NavigationDao;
import com.sg.syj.navigation.service.NavigationService;

@Service
@Transactional
public class NavigationServiceImpl implements NavigationService {

	@Autowired
	private NavigationDao navigationDao;

	@Override
	public void saveorupdate(Navigation nav) throws Exception{
		// TODO Auto-generated method stub
		
		navigationDao.saveOrUpdate(nav);
	}

	@Override
	public boolean delete(String[] ids) {
		// TODO Auto-generated method stub
		int i = navigationDao.delete(ids);
		
		if(i>0){
			
			return true;
		}
		return false;
	}

	@Override
	public List<Navigation> getListbyType(String navtype) {
		// TODO Auto-generated method stub
		return navigationDao.find("from Navigation where navtype="+navtype+" order by sort desc");
	}

	@Override
	public PagePo<Navigation> getNavigationPage(PagePo<Navigation> page,String name) {
		// TODO Auto-generated method stub
		String hql="from Navigation where 1=1 ";
		if(!StringUtils.isBlank(name)){
			hql+=" and name like '%"+name+"%'";
		}
		return navigationDao.getByPage(page, hql, null);
	}

	@Override
	public Navigation findById(String id) {
		// TODO Auto-generated method stub
		return navigationDao.get(Navigation.class, id);
	}
}
