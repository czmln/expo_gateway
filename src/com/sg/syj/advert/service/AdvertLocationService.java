package com.sg.syj.advert.service;

import java.util.List;

import com.sg.syj.entity.po.AdvertLocation;

public interface AdvertLocationService {

	public List<AdvertLocation> getAll() throws Exception;
	
	public AdvertLocation getAdvertLocationById(String id) throws Exception;
}
