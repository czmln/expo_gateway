package com.sg.syj.articleView.service;

import java.util.List;
import java.util.Map;

import com.sg.syj.entity.po.ArticleView;
import com.sg.syj.entity.vo.PagePo;

public interface ArticleViewService {
	public PagePo<ArticleView> getArticleView(PagePo<ArticleView> page,Map<String,Object> map) throws Exception;
	
	public List<ArticleView> getList(String id);
}
