package com.sg.syj.entity.vo;

/***
 * 
 * 说明:返回结果的提示信息
 *
 */
public class ResultMsg {
	//结果
	private boolean rs;
	//提示信息
	private String msg;
	
	//错误码   100 :正确  101: 账号不正确   102: 密码不正确
	private int errorCode;
	
	public ResultMsg(boolean rs, String msg) {
		this.rs = rs;
		this.msg = msg;
	}

	public ResultMsg() {
		
	}

	public boolean isRs() {
		return rs;
	}

	public void setRs(boolean rs) {
		this.rs = rs;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	public ResultMsg(boolean rs, String msg, int errorCode) {
		super();
		this.rs = rs;
		this.msg = msg;
		this.errorCode = errorCode;
	}

	
}
