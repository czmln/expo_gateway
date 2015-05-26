package com.sg.syj.entity.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class ImageInfo implements Serializable{
	private static final long serialVersionUID = 5008460870519013992L;

	@Id
	@GeneratedValue(generator = "idGenerator")
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@Column(length = 40)
    private String id;
	
	//所属模块
	//type=template  属于模版的图片
	private String type;
	//图片地址
	private String imgUrl;
	
	//所属对象id,可能关联多个对象不生成外键约束
	@Column(length = 40)
	private String templateId;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
