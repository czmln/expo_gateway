package com.sg.syj.menubar.service;

import java.util.List;

import com.sg.syj.entity.po.Menubar;


/**
 * 导航栏
 * @author Administrator
 *
 */
public interface MenubarService {
	
	
	/**
	 * 导航栏
	 * @return
	 */
	public List<Menubar> getMenubarByType(String webtarget);
	
	
	public List<Menubar> getMenubarByMenuId(String menuId);

	public List<Menubar> getMenubarByMenubar_id(String menuId) throws Exception;
	
	public Menubar getById(String id);
	
}
