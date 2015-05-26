package com.sg.syj.entity.po;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;




import org.hibernate.annotations.GenericGenerator;

/***
 * 说明:前台显示的栏目实体 
 */
@Entity
public class Menubar implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2832363933546946476L;

	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	
	// 栏目名称
	private String name;
	
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
	
	//所属站点
	@ManyToOne(cascade=CascadeType.REFRESH,fetch=FetchType.EAGER)
	private WebSite webSite;
	
	private String menubar_id;
	
	/*//所包含的子栏目
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.REFRESH)
	@JoinColumn(name="menubar_id")
	private List<Menubar> menubars;*/
    
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

	public WebSite getWebSite() {
		return webSite;
	}

	public void setWebSite(WebSite webSite) {
		this.webSite = webSite;
	}

	public String getMenubar_id() {
		return menubar_id;
	}

	public void setMenubar_id(String menubar_id) {
		this.menubar_id = menubar_id;
	}
}
