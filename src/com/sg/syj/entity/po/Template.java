package com.sg.syj.entity.po;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;



import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;


/***
 * 
 * 说明:模版实体类
 *
 */
@Entity
public class Template implements Serializable {
	
	private static final long serialVersionUID = -2354029365000349248L;

	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	
	// 模版地址
	private String url;
	
	// 更新时间
	@Column(columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;
	
    //模版名称
	private String name;
	
	//备注	
	private String remarks;
	
	//模版图片
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="templateId",referencedColumnName="id")
	private Set<ImageInfo> imgs;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Set<ImageInfo> getImgs() {
		return imgs;
	}

	public void setImgs(Set<ImageInfo> imgs) {
		this.imgs = imgs;
	}

	
}
