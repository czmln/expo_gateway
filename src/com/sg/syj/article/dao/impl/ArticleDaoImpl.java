package com.sg.syj.article.dao.impl;

import org.springframework.stereotype.Repository;

import com.sg.syj.article.dao.ArticleDao;
import com.sg.syj.base.dao.impl.BaseDAOImpl;
import com.sg.syj.entity.po.Article;
@Repository
public class ArticleDaoImpl extends BaseDAOImpl<Article> implements ArticleDao{

}
