package com.sg.syj.menubar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.Menubar;
import com.sg.syj.menubar.dao.MenubarDao;
import com.sg.syj.menubar.service.MenubarService;


/**
 * 导航栏前台service
 * @author Administrator
 *
 */
@Service
@Transactional
public class MenubarServiceImpl implements MenubarService{
	
	@Autowired
    private MenubarDao  menubarDao;
	
	
	/**
	 * 获取导航栏数据
	 */
	@Override
	public List<Menubar> getMenubarByType(String webtarget){
		
		String hql = "from Menubar o where 1=1  and enable=1 and menubar_id ='0' and webSite_id ='"+webtarget+"'ORDER BY ord ASC";
		
		return (List<Menubar>)menubarDao.find(hql);
	}
	
	
	@Override
	public List<Menubar> getMenubarByMenuId(String menuId){
		return (List<Menubar>)menubarDao.find("from Menubar o where 1=1 and enable=1 and menubar_id ='"+menuId+"' ORDER BY ord ASC");
	}


	@Override
	public List<Menubar> getMenubarByMenubar_id(String menuId) throws Exception{
		return menubarDao.find("from Menubar where enable=1 and menubar_id = ? order by ord",new Object[]{menuId});
	}


	@Override
	public Menubar getById(String id) {
		String hql = " from Menubar where id = ?";
		return this.menubarDao.get(hql, new Object[]{id});
	}

}
