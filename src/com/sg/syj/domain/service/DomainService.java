package com.sg.syj.domain.service;

import com.sg.syj.entity.po.Domain;

public interface DomainService {
     //根据域名获取
	 Domain getByUrl(String url);
}
