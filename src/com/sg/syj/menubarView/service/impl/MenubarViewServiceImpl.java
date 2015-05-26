package com.sg.syj.menubarView.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.MenubarView;
import com.sg.syj.menubarView.dao.MenubarViewDao;
import com.sg.syj.menubarView.service.MenubarViewService;

@Service
@Transactional
public class MenubarViewServiceImpl implements MenubarViewService{
	@Autowired
	private MenubarViewDao menubarViewDao;
	@Override
	public List<MenubarView> getALl() throws Exception {
		String hql = " from MenubarView where menubar_id is not null";
		return this.menubarViewDao.find(hql);
	}
	@Override
	public List<MenubarView> getById(String id, String webtarget)
			throws Exception {
		String hql = " from MenubarView where enable=1 and menubar_id ='"+id+"' and webSite_id = '"+webtarget+"' order by ord";
		return this.menubarViewDao.find(hql);
	}
	
	public MenubarView getUrlById(String id){
		String hql = " from MenubarView where id = ?";
		return this.menubarViewDao.get(hql,new Object[]{id});
	}

}
