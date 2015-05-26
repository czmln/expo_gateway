package com.sg.syj.entity.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Navigation implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5444399254963107287L;


	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	/**
	 * ID 
	 */
	private String id;
	
	
	/**
	 * 栏目名称
	 */
	private String name;
	
	/**
	 * 网站链接
	 */
	private String url;
	
	/**
	 * 排序
	 */
	private Integer sort;
	
	/**
	 * 网站logo
	 */
	private String logo;
	
	/**
	 * 网站封面图片
	 */
	private String imageUrl;
	
	/**
	 * 栏目类型(0:重大展会,1:市州展会,2:节庆活动)
	 */
	private String navtype;
	
	
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getNavtype() {
		return navtype;
	}
	public void setNavtype(String navtype) {
		this.navtype = navtype;
	}
	
	
	

}
