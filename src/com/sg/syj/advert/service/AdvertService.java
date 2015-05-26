package com.sg.syj.advert.service;

import java.util.List;
import java.util.Map;

import com.sg.syj.entity.po.Advert;
import com.sg.syj.entity.vo.PagePo;

public interface AdvertService {
	/**
	 * 添加或删除栏目
	 * 
	 * @param:Menubar menubar
	 */
	public void saveOrUpdate(Advert advert) throws Exception;

	/**
	 * 删除栏目
	 * 
	 * @param:String[] ids
	 * 
	 */
	public void del(String[] ids) throws Exception;

	/**
	 * 功能:带条件的分页查询
	 * 
	 * @param:PagePo<Menubar> page 分页对象
	 * @param:Map<String, Object> map 查询参数
	 * @return:PagePo<Menubar> 分页对象
	 */
	public PagePo<Advert> getAdvertByPage(PagePo<Advert> page, Map<String, Object> map) throws Exception;

	public Advert getAdvertById(String advertId) throws Exception;
	
	public List<Advert> getNewAdver() throws Exception;
	
	public List<Advert> getAdvertsById(String advertId) throws Exception;
	
	public List<Advert> getAdvertsByWebSiteName(String webSiteName) throws Exception;
	
	public Advert getImg(String menubar_id) throws Exception;

}
