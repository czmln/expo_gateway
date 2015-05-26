package com.sg.syj.entity.po;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
@Entity
public class UserInfo {
	@Id
	@GeneratedValue(generator="idGenerator")
    @GenericGenerator(name="idGenerator", strategy="uuid")
	@Column(length=40)
	private String id;
	/**
	 *  登录帐号
	 */
	private String loginName;
	/**
	 *  登录密码
	 */
	public String password;
	/**
	 *  用户名
	 */
	private String userName;
	/**
	 * 用户状态 （0停用， 1启用）
	 */
	private int status;
	/**
	 * 用户类型 (0个人， 1媒体， 2境内企业，3境外企业， 4专业观众)
	 */
	private String userType;

	/**
	 *  注册时间
	 */
	@Column(columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
	private Date regTime;
	/**
	 *  公司名称
	 */
	private String companyName;
	/**
	 *  备注
	 */
	private String remark;
	
	/**
	 * 审批（0未审批， 1审批）
	 */
	private int approval;
	
	/**
	 * 性别 0 女 1 男
	 */
	private int sex;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getApproval() {
		return approval;
	}

	public void setApproval(int approval) {
		this.approval = approval;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}
	
	
}
