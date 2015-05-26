package com.sg.syj.exhibitType.service;

import java.util.List;
import java.util.Map;

import com.sg.syj.entity.po.ExhibitType;
import com.sg.syj.entity.vo.PagePo;

public interface ExhibitTypeService {
	/**
	 * 添加或更新
	 * 
	 * @param:Exhibit Exhibit
	 */
	public void saveOrUpdate(ExhibitType exhibitType) throws Exception;

	/**
	 * 删除
	 * 
	 * @param:String[] ids
	 * 
	 */
	public void del(String[] ids) throws Exception;

	/**
	 * 功能:带条件的分页查询
	 * 
	 * @param:PagePo<Exhibit> page 分页对象
	 * @param:Map<String, Object> map 查询参数
	 * @return:PagePo<Exhibit> 分页对象
	 */
	public PagePo<ExhibitType> getExhibitTypeByPage(PagePo<ExhibitType> page, Map<String, Object> map) throws Exception;

	public ExhibitType getExhibitTypeById(String id) throws Exception;
	
	public void del(ExhibitType exhibitType) throws Exception ;
	
	/**
	 * 获取所有的数据;
	 * @return
	 */
	public List<ExhibitType> getAll() ;
	
}
