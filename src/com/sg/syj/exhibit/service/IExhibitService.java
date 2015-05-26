package com.sg.syj.exhibit.service;

import java.util.List;
import java.util.Map;

import com.sg.syj.entity.po.ExhibitInfo;
import com.sg.syj.entity.vo.PagePo;

public interface IExhibitService {
	/**
	 * 保存,如果存在则修改
	 * @param exhibit
	 * @throws Exception
	 */
	public void saveOrUpdate(ExhibitInfo exhibit) throws Exception ;
	
	/**
	 * 根据id数组删除对应数据;
	 * @param ids
	 * @throws Exception
	 */
	public void delete(String[] ids) throws Exception;
	
	/**
	 * 通过id获取对应数据;
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public ExhibitInfo getById(String id) throws Exception;
	
	/**
	 * 根据条件进行分页查询
	 * @param page
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public PagePo<ExhibitInfo> getByPage(PagePo<ExhibitInfo> page, Map<String, Object> map) throws Exception;
	
	/**
	 * 查询所有数据;
	 * @return
	 * @throws Exception
	 */
	public List<ExhibitInfo> getAll() throws Exception;
	
	public PagePo<ExhibitInfo> getExhibitByWebId(PagePo<ExhibitInfo> page,Map<String, Object> map) throws Exception;
}
