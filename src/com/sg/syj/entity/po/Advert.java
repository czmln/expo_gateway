package com.sg.syj.entity.po;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Advert {
	/**
	 * 广告id
	 */
	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	
	/**
	 *  广告名字 
	 */
	private String name;
	
	/**
	 * 广告连接
	 */
	private String url;
	
	/**
	 * 广告内容
	 */
	@Column(columnDefinition="TEXT")
	private	String content;
	
	@ManyToOne(cascade=CascadeType.REFRESH,fetch=FetchType.EAGER)
	private AdvertLocation advertLocation;
	
	private String menubar_id;
	
	// 排序
	private String ord;

	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public String getMenubar_id() {
		return menubar_id;
	}
	public void setMenubar_id(String menubar_id) {
		this.menubar_id = menubar_id;
	}
	public AdvertLocation getAdvertLocation() {
		return advertLocation;
	}
	public void setAdvertLocation(AdvertLocation advertLocation) {
		this.advertLocation = advertLocation;
	}
	private String picture;

	private String webSiteName;
	public String getWebSiteName() {
		return webSiteName;
	}
	public void setWebSiteName(String webSiteName) {
		this.webSiteName = webSiteName;
	}
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
