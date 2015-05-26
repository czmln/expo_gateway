package com.sg.syj.fileInfo.service;

import java.util.List;

import com.sg.syj.entity.po.FileInfo;

public interface FileInfoService {
	public List<FileInfo> getFileInfo(String id);
}
