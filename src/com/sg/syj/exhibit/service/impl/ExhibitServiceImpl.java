package com.sg.syj.exhibit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.ExhibitInfo;
import com.sg.syj.entity.po.ExhibitType;
import com.sg.syj.entity.vo.PagePo;
import com.sg.syj.exhibit.dao.IExhibitDao;
import com.sg.syj.exhibit.service.IExhibitService;

@Transactional
@Service
public class ExhibitServiceImpl implements IExhibitService {
	@Autowired
	private IExhibitDao exhibitDao;

	@Override
	public void saveOrUpdate(ExhibitInfo exhibit) throws Exception {
		if("".equals(exhibit.getId())) {
			exhibit.setId(null);
			exhibit.setHitNum(0); //点击量默认为0;
		}
		exhibitDao.saveOrUpdate(exhibit);
	}

	@Override
	public void delete(String[] ids) throws Exception {
		if(ids != null) {
			for (String id : ids) {
				ExhibitInfo info = new ExhibitInfo();
				info.setId(id);
				exhibitDao.delete(info);
			}
		}
	}

	@Override
	public ExhibitInfo getById(String id) throws Exception {
		return exhibitDao.get(ExhibitInfo.class, id);
	}

	@Override
	public PagePo<ExhibitInfo> getByPage(PagePo<ExhibitInfo> page,
			Map<String, Object> map) throws Exception {
		StringBuilder sbHql = new StringBuilder("from ExhibitInfo info where 1=1 ");
		Object[] objs = null;
		
		if(map != null) {
			Object obj_title = map.get("title");
			
			if(obj_title != null) {
				sbHql.append(" and info.title like '%")
				.append(obj_title.toString())
				.append("%'");
			}
			
			Object obj_typeId = map.get("typeId");
			if(obj_typeId != null && !"0".equals(obj_typeId)) {
				sbHql.append(" and info.exhibitType=?");
				ExhibitType type = new ExhibitType();
				type.setId(obj_typeId.toString());
				objs = new Object[]{type};
			}
			
		}
		
		sbHql.append(" order by info.hitNum, info.regDate desc");
		
		return exhibitDao.getByPage(page, sbHql.toString(), objs);
	}

	@Override
	public List<ExhibitInfo> getAll() throws Exception {
		return exhibitDao.find("from ExhibitInfo o ");
	}
	
	@Override
	public PagePo<ExhibitInfo> getExhibitByWebId(PagePo<ExhibitInfo> page,Map<String, Object> map) throws Exception {
		StringBuffer sb=new StringBuffer();
		sb.append(" from ExhibitInfo o ");
		if(map!=null){
			String  typeId= (String)map.get("typeId");
			if(!"0".equals(typeId)){
				sb.append(" where o.exhibitType ='"+typeId+"'");
			}else{
				sb.append(" where 1=1");
			}
		}
		return exhibitDao.getByPage(page, sb.toString());
	}
}
