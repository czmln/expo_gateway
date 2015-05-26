package com.sg.syj.entity.vo;

import java.util.List;

import com.sg.syj.entity.po.Menubar;

public class TreeGridMenubar {
	private String id;
	
	private String name;
	
	private int navType;

	private int dataType;
	
	private String coverImg;
	
	private String linkUrl;
	
	private String ord;
	
	private int enable;
	
	private String descrip;

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
	private List<TreeGridMenubar> children;

	public List<TreeGridMenubar> getChildren() {
		return children;
	}

	public void setChildren(List<TreeGridMenubar> children) {
		this.children = children;
	}
	
	public TreeGridMenubar getTreeGridMenubar(Menubar menubar){
			this.id=menubar.getId();
			this.name=menubar.getName();
			this.coverImg=menubar.getCoverImg();
			this.dataType=menubar.getDataType();
			this.descrip=menubar.getDescrip();
			this.enable=menubar.getEnable();
			this.linkUrl=menubar.getLinkUrl();
			this.navType=menubar.getNavType();
			this.ord=menubar.getOrd();
		return this;
	}
}
