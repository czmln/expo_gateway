package com.sg.syj.index.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.article.dao.ArticleDao;
import com.sg.syj.articleView.dao.ArticleViewDao;
import com.sg.syj.entity.po.ArticleView;
import com.sg.syj.index.service.IndexService;

/**
 * 首页新闻板块Service
 * @author Administrator
 *
 */
@Service
@Transactional
public class IndexServiceImpl implements IndexService{
	
	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private ArticleViewDao articleViewDao;

	/**
	 * 获取新闻板块的内容
	 */
	@Override
	public Map<String, Object> getNewsOrNotice(String menubarId,String noticeId,String dynamicId,String webtarget) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		//轮播新闻
		String lunhql="from ArticleView where 1=1  and isRatified = '1' and isChangeImgs='1' and webSite_id = '"+webtarget+"' order by updateTime desc";
		List<ArticleView> lunls = articleViewDao.find(lunhql,new ArrayList(), 1, 5);
		
		//最新新闻
		String newshql="from ArticleView where 1=1 and isRatified = '1' and menubar_id='"+menubarId+"' and webSite_id = '"+webtarget+"' order by updateTime desc";
		
		
		List<ArticleView> newsls = articleViewDao.find(newshql,new ArrayList(), 1, 8);
		
		//最新公告
		
		String noticehql="from ArticleView where 1=1 and isRatified = '1' and menubar_id='"+noticeId+"' and webSite_id = '"+webtarget+"' order by updateTime desc";
		
		
		List<ArticleView> noticels = articleViewDao.find(noticehql,new ArrayList(), 1, 8);
		
		//最新公告
		
		String dynamichql="from ArticleView where 1=1 and isRatified = '1' and menubar_id='"+dynamicId+"' and webSite_id = '"+webtarget+"' order by updateTime desc";
				
				
		List<ArticleView> dynamicls = articleViewDao.find(dynamichql,new ArrayList(), 1, 8);
		
		map.put("lun", lunls);
		map.put("news", newsls);
		map.put("notice", noticels);
		map.put("dynamic", dynamicls);
		
		return map;
	}

	/**
	 * 获取导航栏文章
	 */
	@Override
	public List<ArticleView> getArticleById(String menubarId,Integer pageNo,Integer pageSize,String webtarget) {
		// TODO Auto-generated method stub
		
		String hql="from ArticleView where 1=1 and menubar_id='"+menubarId+"' and isRatified = '1' and webSite_id = '"+webtarget+"' order by updateTime desc";	
		
		return (List<ArticleView>)articleViewDao.find(hql,new ArrayList(), pageNo, pageSize);
	}

}
