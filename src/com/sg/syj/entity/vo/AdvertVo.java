package com.sg.syj.entity.vo;

import com.sg.syj.entity.po.Advert;

public class AdvertVo {
	private String id ;
	private String name;
	private String	url;
	private String picture;
	private String location;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public AdvertVo getAdvertVo(Advert advert){
		this.id =advert.getId();
		this.name=advert.getName();
		this.picture=advert.getPicture();
		this.location=advert.getAdvertLocation().getLocaltionName();
		return this;
	}
}
