package com.sg.syj.index.service;

import java.util.List;
import java.util.Map;

import com.sg.syj.entity.po.ArticleView;

/**
 * 首页service
 * @author Administrator
 *
 */
public interface IndexService {
	
	
	/**
	 * 获取新闻 公告 行业动态
	 * @return
	 */
	public Map<String,Object> getNewsOrNotice(String menubarId,String noticeId,String dynamicId,String webtarget);
	
	/**
	 * 获取导航数据通过ID
	 * @param menubarId
	 * @return
	 */
	public List<ArticleView> getArticleById(String menubarId,Integer pageNo,Integer pageSize,String webtarget);

}
