package com.sg.syj.entity.po;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class ExhibitInfo {
	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 图片路径
	 */
	private String imgUrl;
	/**
	 * 参展时间
	 */
	@Column(columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date regDate;
	/**
	 * 参展地方
	 */
	private String place;
	/**
	 * 展品概况
	 */
	@Column(columnDefinition="TEXT")
	private String intro;
	/**
	 * 参展公司
	 */
	private String company;
	/**
	 * 点击量
	 */
	private int hitNum;
	/**
	 * 录入人
	 */
	@ManyToOne
	@JoinColumn(name="userInfo_id")	
	private UserInfo userInfo;
	/**
	 * 展品类型
	 */
	@ManyToOne
	@JoinColumn(name="exhibitType_id")	
	private ExhibitType exhibitType;
	/**
	 * 备用字段
	 */
	private String other;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getHitNum() {
		return hitNum;
	}

	public void setHitNum(int hitNum) {
		this.hitNum = hitNum;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public ExhibitType getExhibitType() {
		return exhibitType;
	}

	public void setExhibitType(ExhibitType exhibitType) {
		this.exhibitType = exhibitType;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
	
}
