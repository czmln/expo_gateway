package com.sg.syj.domain.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.domain.dao.DomainDao;
import com.sg.syj.domain.service.DomainService;
import com.sg.syj.entity.po.Domain;

@Service
@Transactional
public class DomainServiceImpl implements DomainService{
	
    @Autowired
	private DomainDao domainDao;
	
	@Override
	public Domain getByUrl(String url) {
		String hql=" from Domain o where o.url=?";
		
		Domain domain = domainDao.get(hql, new Object[]{url});
		
		return domain;
	}

}
