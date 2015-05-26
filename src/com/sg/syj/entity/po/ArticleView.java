package com.sg.syj.entity.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * 文章视图实体
 * @author 
 *
 */
@Entity
public class ArticleView implements Serializable{
	
	private static final long serialVersionUID = -322355644867288514L;

	@Id
	@GeneratedValue(generator = "idGenerator")
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@Column(length = 40)
	private String id;


	// 标题
	private String title;
	// 一级导航ID
	private String parentId;
	
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	//作者
    private String author;
    //出处
    private String source;
	// 发表时间
    @Column(columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date issuedDate;
	// 最后一次修改的时间
	private Date updateTime;
	//封面图片
    private String coverImgUrl;
	// 内容
    @Column(columnDefinition="TEXT")
	private String content;
    //摘要
    @Column(columnDefinition="TEXT")
    private String summary;
    
    //二级导航
    private String name1;
    
    //一级导航
    private String name2;
	//时间
	@Column(columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date time;
	//地点
	private String place;
	
	//是否审批
	private Integer isRatified;
	
	//是否是首页轮播的图片(0未发布, 1发布)
	private Integer isChangeImgs;
    
	//审批人
	private String ratifieName;
	
	//是否添加联系人  0 不添加，1添加
	private Integer isAddContacts;
	//联系人姓名
	private String contactsName;
	//联系人电话
	private String contactsTel;
	//二维码名片地址
	private String qrCodeUrl;
	
	//同一篇文章对应的多个栏目id  用，分隔
	@Column(columnDefinition="text")
	private String manyMenubarId;
	
	//同一篇文章标识
	private String articleIdentify;
	//是否发送短息  0 不发送 ，1 发送
    private Integer isSendMessage;
    
    //点击率
    private Integer clickRate=0;
    
    //站点
    private String webSite_id;
    //部门
    private String dept;
    
    private String menubar_Id;
    
	public String getMenubar_Id() {
		return menubar_Id;
	}

	public void setMenubar_Id(String menubar_Id) {
		this.menubar_Id = menubar_Id;
	}

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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getCoverImgUrl() {
		return coverImgUrl;
	}

	public void setCoverImgUrl(String coverImgUrl) {
		this.coverImgUrl = coverImgUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Integer getIsRatified() {
		return isRatified;
	}

	public void setIsRatified(Integer isRatified) {
		this.isRatified = isRatified;
	}

	public Integer getIsChangeImgs() {
		return isChangeImgs;
	}

	public void setIsChangeImgs(Integer isChangeImgs) {
		this.isChangeImgs = isChangeImgs;
	}

	public String getRatifieName() {
		return ratifieName;
	}

	public void setRatifieName(String ratifieName) {
		this.ratifieName = ratifieName;
	}

	public Integer getIsAddContacts() {
		return isAddContacts;
	}

	public void setIsAddContacts(Integer isAddContacts) {
		this.isAddContacts = isAddContacts;
	}

	public String getContactsName() {
		return contactsName;
	}

	public void setContactsName(String contactsName) {
		this.contactsName = contactsName;
	}

	public String getContactsTel() {
		return contactsTel;
	}

	public void setContactsTel(String contactsTel) {
		this.contactsTel = contactsTel;
	}

	public String getQrCodeUrl() {
		return qrCodeUrl;
	}

	public void setQrCodeUrl(String qrCodeUrl) {
		this.qrCodeUrl = qrCodeUrl;
	}

	public String getManyMenubarId() {
		return manyMenubarId;
	}

	public void setManyMenubarId(String manyMenubarId) {
		this.manyMenubarId = manyMenubarId;
	}

	public String getArticleIdentify() {
		return articleIdentify;
	}

	public void setArticleIdentify(String articleIdentify) {
		this.articleIdentify = articleIdentify;
	}

	public Integer getIsSendMessage() {
		return isSendMessage;
	}

	public void setIsSendMessage(Integer isSendMessage) {
		this.isSendMessage = isSendMessage;
	}

	public Integer getClickRate() {
		return clickRate;
	}

	public void setClickRate(Integer clickRate) {
		this.clickRate = clickRate;
	}

	public String getWebSite_id() {
		return webSite_id;
	}

	public void setWebSite_id(String webSite_id) {
		this.webSite_id = webSite_id;
	}
	public Date getUpdateTime() {
		if(updateTime == null){
			updateTime=issuedDate;
		}
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
	
		this.updateTime = updateTime;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
    
}
