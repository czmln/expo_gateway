package com.sg.syj.fileInfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.entity.po.FileInfo;
import com.sg.syj.fileInfo.dao.FileInfoDao;
import com.sg.syj.fileInfo.service.FileInfoService;

@Service
@Transactional
public class FileInfoServiceImpl implements FileInfoService{
	@Autowired
	FileInfoDao fileInfoDao;
	
	@Override
	public List<FileInfo> getFileInfo(String id) {
		String hql = "from FileInfo where webSite_id = ? order by issuedDate desc";
		return fileInfoDao.find(hql, new Object[]{id});
	}
	
}
