package com.sg.syj.menubarView.service;

import java.util.List;

import com.sg.syj.entity.po.MenubarView;

public interface MenubarViewService {
	public List<MenubarView> getALl() throws Exception;
	
	public List<MenubarView> getById(String id,String webtarget) throws Exception;
	
	public MenubarView getUrlById(String id);
}
