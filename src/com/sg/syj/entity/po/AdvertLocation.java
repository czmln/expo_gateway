package com.sg.syj.entity.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class AdvertLocation {
	/**
	 *id 
	 */
	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	
	/**
	 * 位置名称
	 */
	private String localtionName;
	/**
	 * 广告数量
	 */
	private int advertNumber;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLocaltionName() {
		return localtionName;
	}
	public void setLocaltionName(String localtionName) {
		this.localtionName = localtionName;
	}
	public int getAdvertNumber() {
		return advertNumber;
	}
	public void setAdvertNumber(int advertNumber) {
		this.advertNumber = advertNumber;
	}
	
}
