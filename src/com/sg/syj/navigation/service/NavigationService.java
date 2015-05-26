package com.sg.syj.navigation.service;

import java.util.List;

import com.sg.syj.entity.po.Navigation;
import com.sg.syj.entity.vo.PagePo;

public interface NavigationService {
	
	
	/**
	 * 保存或修改
	 * @param nav
	 * @return
	 */
	public void saveorupdate(Navigation nav) throws Exception;
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public boolean delete(String[] ids);
	
	/**
	 * 根据ID查找
	 * @param id
	 * @return
	 */
	public Navigation findById(String id);
	
	/**
	 * 根据类型获取栏目列表
	 * @param navtype
	 * @return
	 */
	public List<Navigation> getListbyType(String navtype);
	
	/**
	 * 获取栏目分页对象
	 * @param page
	 * @param map
	 * @return
	 */
	public PagePo<Navigation> getNavigationPage(PagePo<Navigation> page,String name);

}
