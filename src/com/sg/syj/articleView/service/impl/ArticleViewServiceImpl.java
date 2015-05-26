package com.sg.syj.articleView.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.articleView.dao.ArticleViewDao;
import com.sg.syj.articleView.service.ArticleViewService;
import com.sg.syj.common.util.DateUtil;
import com.sg.syj.entity.po.ArticleView;
import com.sg.syj.entity.vo.PagePo;

@Service
@Transactional
public class ArticleViewServiceImpl implements ArticleViewService{

	@Autowired
	ArticleViewDao articleViewDao;
	
	@Override
	public PagePo<ArticleView> getArticleView(PagePo<ArticleView> page,Map<String,Object> map)
			throws Exception {
		StringBuilder hql = new StringBuilder("from ArticleView ar where 1 = 1");
		String sort = (String)map.get("sort");
		String order = (String)map.get("order");		
		String fristwid=(String)map.get("fristwid");
		String secondwid=(String)map.get("secondwid");
		String artcletitle=(String)map.get("artcletitle");
		String writer=(String)map.get("writer");
		String isPublish=(String)map.get("isPublish");
		String isRatified=(String)map.get("isRatified");		
		String webSiteId=(String)map.get("webSiteId");
		String sdate=(String) map.get("sdate");
		String edate=(String) map.get("edate");
		if(StringUtils.isNotEmpty(isPublish)&&!isPublish.equals("-1")){
			if (Integer.parseInt(isPublish.toString()) == 1) {
				hql.append(" and ar.isChangeImgs=1");
			} else {
				hql.append(" and (ar.isChangeImgs=0 or ar.isChangeImgs = NULL)");
			}
		}
		if (StringUtils.isNotEmpty(isRatified)&&!isRatified.equals("-1")) {
			if (Integer.parseInt(isRatified.toString()) == 1) {
				hql.append(" and ar.isRatified=1");
			} else {
				hql.append(" and (ar.isRatified=0 or ar.isRatified = NULL)");
			}
		}
		if(StringUtils.isNotEmpty(webSiteId)&&!webSiteId.equals("0")){
			hql.append(" and ar.webSite_id="+"'"+webSiteId+"'");
		}
		if(StringUtils.isNotEmpty(secondwid)){
			hql.append(" and ar.name1 like '%"+secondwid+"%'");
		}
		if(StringUtils.isNotEmpty(fristwid)){
			hql.append(" and ar.name2 like '%"+fristwid+"%'");
		}
		if(StringUtils.isNotEmpty(artcletitle)){
			hql.append(" and ar.title like '%"+artcletitle+"%'");
		}
		if(StringUtils.isNotEmpty(writer)){
			hql.append(" and ar.author like '%"+writer+"%'");
		}
		
		if(sdate!=null&&edate!=null){
			sdate=DateUtil.toString(DateUtil.parseDate(sdate,"yyyy-MM-dd"), "yyyy-MM-dd");
			edate= DateUtil.toString(DateUtil.parseDate(edate+" 23:59:58", "yyyy-MM-dd HH:mm:ss"),"yyyy-MM-dd HH:mm:ss");
			hql.append(" and ar.issuedDate between "+"'"+sdate+"'"+" and '"+edate+"'");
		}
			
		if(StringUtils.isNotEmpty(sort) && StringUtils.isNotEmpty(order)){
			hql.append(" order by " + sort + " " + order);
		}else{
			hql.append(" order by  issuedDate desc ");
		}
		return page = this.articleViewDao.getByPage(page, hql.toString(), new Object[]{});
	}

	@Override
	public List<ArticleView> getList(String id) {
		String hql = "from ArticleView where menubar_id = ?";
		return articleViewDao.find(hql,new Object[]{id});
	}
}
