package com.sg.syj.article.service;



import java.util.List;

import com.sg.syj.entity.po.Article;
import com.sg.syj.entity.po.ArticleView;

public interface ArticleService {

	/***
	 * 分页查询
	 * 
	 * @param po
	 * @param params
	 * @return
	 */
	public List<Article> getArticleByPage(String param,String type) throws Exception;
	public Article getArticleById(String id) throws Exception;
	public ArticleView updatAarticcount(String id) throws Exception;
	
	/**
	 *全文搜索
	 * @param keyword
	 * @return
	 */
	public List<Article> searchArticle(String keyword,String tag);
}
