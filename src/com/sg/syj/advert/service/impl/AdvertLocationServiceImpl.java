package com.sg.syj.advert.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.advert.dao.AdvertLocationDao;
import com.sg.syj.advert.service.AdvertLocationService;
import com.sg.syj.entity.po.AdvertLocation;
@Repository
@Transactional
public class AdvertLocationServiceImpl implements AdvertLocationService{
	@Autowired
	private AdvertLocationDao advertLocationDao;
	@Override
	public List<AdvertLocation> getAll() throws Exception {
		return advertLocationDao.find("from AdvertLocation where 1=1");
	}
	
	@Override
	public AdvertLocation getAdvertLocationById(String id) throws Exception {
		return advertLocationDao.get(AdvertLocation.class,id);
	}

}
