package com.sg.syj.article.service.impl;

import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.article.dao.ArticleDao;
import com.sg.syj.article.service.ArticleService;
import com.sg.syj.articleView.dao.ArticleViewDao;
import com.sg.syj.entity.po.Article;
import com.sg.syj.entity.po.ArticleView;
import com.sg.syj.entity.po.Menubar;
import com.sg.syj.entity.po.WebSite;
import com.sg.syj.menubar.service.MenubarService;
import com.sg.syj.website.dao.IWebSiteDao;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private ArticleViewDao articleViewDao;
	@Autowired
	private IWebSiteDao iWebSiteDao;
	@Autowired
	private MenubarService menubarService;

	@Override
	public List<Article> getArticleByPage(String param,String type) throws Exception {
		List<Article> list = articleDao
				.find("from Article where menubar_id = ? and isRatified = 1 order by updateTime desc",
						new Object[] { param });
		//直接进详情页点击次数加1
		if(StringUtils.isNotEmpty(type) && "6".equals(type)){
			Article article = list.get(0);
			article.setClickRate(article.getClickRate() + 1);
			articleDao.saveOrUpdate(article);
		}
		return list;
	}

	@Override
	public Article getArticleById(String id) throws Exception {
		String hql = "from Article where id = ? and isRatified = 1 order by issuedDate desc";
		return articleDao.get(hql, new Object[] { id });
	}

	@Override
	public ArticleView updatAarticcount(String id) throws Exception {
		String hql1 = "from ArticleView where id = ? and isRatified = 1 order by issuedDate desc";
		String hql2 = "from Article where id = ? and isRatified = 1 order by issuedDate desc";
		Article ar = (Article) articleDao.get(hql2, new Object[] { id });
		ar.setClickRate(ar.getClickRate() + 1);
		articleDao.saveOrUpdate(ar);
		return articleViewDao.get(hql1, new Object[] { id });
	}

	/**
	 * 全文搜索
	 */
	@Override
	public List<Article> searchArticle(String keyword, String tag) {
		// TODO Auto-generated method stub

		String menubarIds = "";

		String hq = "from WebSite where linkUrl=?";

		WebSite site = iWebSiteDao.get(hq, new Object[] { tag });

		if (site == null) {
			return null;
		}

		List<Menubar> ls = menubarService.getMenubarByType(site.getId());

		if (ls == null || ls.size() == 0) {

			return null;
		}

		for (Menubar mb : ls) {
			if (mb.getId() != null && !mb.getId().equals("")) {
				menubarIds += "'"+mb.getId() + "',";
			}

			try {
				List<Menubar> ll = menubarService.getMenubarByMenubar_id(mb
						.getId());

				if (ll != null && ll.size() > 0) {

					for (Menubar menubar : ll) {

						if (menubar.getId() != null
								&& !menubar.getId().equals("")) {
							menubarIds += "'"+menubar.getId() + "',";
						}
					}
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (!menubarIds.equals("")) {
			menubarIds = menubarIds.substring(0, menubarIds.length() - 1);
		}

		String hql = "from Article art where art.isRatified=1 and art.title like '%"
				+ keyword + "%' and art.menubar.id in (" + menubarIds
				+ ") order by art.issuedDate desc";

		return articleDao.find(hql);
	}

}
