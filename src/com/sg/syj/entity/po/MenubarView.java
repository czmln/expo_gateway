package com.sg.syj.entity.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class MenubarView implements Serializable{
	private static final long serialVersionUID = 3398163606178112376L;

	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	
	// 栏目名称
	private String name;
	
	private String keyWord;
	
	private String templatesUrl;
	
	private String url;
	
	private String parentId;
	
	private String shortUrl;
	
	public String getShortUrl() {
		return shortUrl;
	}

	public void setShortUrl(String shortUrl) {
		this.shortUrl = shortUrl;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getTemplatesUrl() {
		return templatesUrl;
	}

	public void setTemplatesUrl(String templatesUrl) {
		this.templatesUrl = templatesUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	// 导航类型  ,1001 一级栏目,1002  二级栏目
	private int navType;

	// 数据类型,2001 单页面,2002  分页列表
	private int dataType;
	
	//封面图片
	private String coverImg;
	
	//连接地址
	private String linkUrl;
	
	//排序
	private String ord;
	
	//是否启用  0 禁用  ,1 使用
	private int enable;
	
	private String descrip;
	
	private int sysDefault;
	
	private String webSite_id;
	
	private String menubar_id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNavType() {
		return navType;
	}

	public void setNavType(int navType) {
		this.navType = navType;
	}

	public int getDataType() {
		return dataType;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

	public String getCoverImg() {
		return coverImg;
	}

	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getOrd() {
		return ord;
	}

	public void setOrd(String ord) {
		this.ord = ord;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public int getSysDefault() {
		return sysDefault;
	}

	public void setSysDefault(int sysDefault) {
		this.sysDefault = sysDefault;
	}

	public String getWebSite_id() {
		return webSite_id;
	}

	public void setWebSite_id(String webSite_id) {
		this.webSite_id = webSite_id;
	}

	public String getMenubar_id() {
		return menubar_id;
	}

	public void setMenubar_id(String menubar_id) {
		this.menubar_id = menubar_id;
	}
	
}
