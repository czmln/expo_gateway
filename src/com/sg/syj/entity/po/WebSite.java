package com.sg.syj.entity.po;


import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;


/***
 * 
 * 说明:站点实体
 *
 */
@Entity
public class WebSite implements Serializable{
	private static final long serialVersionUID = 5789301059057675245L;

	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
    private String id;
	
	//站点名称
	private String name;
	
	//链接地址
	private String linkUrl;

	//所属模版
	@ManyToOne
	@JoinColumn(name="template_id")	
	private Template template;
    
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="webSite")
	private Set<Menubar> menubars;
	
	@ManyToOne
	private Domain domain;
	
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

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public Set<Menubar> getMenubars() {
		return menubars;
	}

	public void setMenubars(Set<Menubar> menubars) {
		this.menubars = menubars;
	}

	public Domain getDomain() {
		return domain;
	}

	public void setDomain(Domain domain) {
		this.domain = domain;
	}


}
