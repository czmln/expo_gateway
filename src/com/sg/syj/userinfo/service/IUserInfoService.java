package com.sg.syj.userinfo.service;

import com.sg.syj.entity.po.UserInfo;
public interface IUserInfoService {

	UserInfo checkLogin(String username, String password);

	UserInfo saveByFormId(String username, String email, String password,String registerType , int sex);

	void checkUsername(String username);

}
