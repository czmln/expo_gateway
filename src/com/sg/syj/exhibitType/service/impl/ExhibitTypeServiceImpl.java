package com.sg.syj.exhibitType.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.ExhibitType;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.exhibitType.dao.ExhibitTypeDao;
import com.sg.syj.exhibitType.service.ExhibitTypeService;

@Service
@Transactional
public class ExhibitTypeServiceImpl implements ExhibitTypeService {
	
	@Autowired
	private ExhibitTypeDao exhibitTypeDao;
	@Override
	public void saveOrUpdate(ExhibitType exhibitType) throws Exception {
		if("".equals(exhibitType.getId())){
			exhibitType.setId(null);
		}
		exhibitTypeDao.saveOrUpdate(exhibitType);
	}

	@Override
	public void del(String[] ids) throws Exception {
		exhibitTypeDao.delete(ids);
	}

	public void del(ExhibitType exhibitType) throws Exception {
		exhibitTypeDao.delete(exhibitType);
	}
	@Override
	public PagePo<ExhibitType> getExhibitTypeByPage(PagePo<ExhibitType> page,Map<String, Object> map) throws Exception {
		StringBuffer hql=new StringBuffer();
		if(map!= null){
			hql.append(" from ExhibitType o where 1=1 and typeName like '"+map.get("typeName")+"%'");
		}else{
			hql.append(" from ExhibitType o");
		}
		return exhibitTypeDao.getByPage(page, hql.toString());
	}

	@Override
	public ExhibitType getExhibitTypeById(String id) throws Exception {
		return exhibitTypeDao.get(ExhibitType.class, id);
	}

	@Override
	public List<ExhibitType> getAll() {
		return exhibitTypeDao.find("from ExhibitType type order by type.sort Desc");
	}
}
