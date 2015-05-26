package com.sg.syj.userinfo.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sg.syj.common.exception.LogicException;
import com.sg.syj.common.util.Md5encyptUtil;
import com.sg.syj.common.util.UuidTool;
import com.sg.syj.entity.po.UserInfo;
import com.sg.syj.userinfo.dao.IUserInfodao;
import com.sg.syj.userinfo.service.IUserInfoService;

@Service
@Transactional
public class UserInfoServiceImpl implements IUserInfoService {

	@Autowired
	private IUserInfodao userInfodao;
	/**
	 * 检查登陆的业务方法
	 */
	@Override
	public UserInfo checkLogin(String username, String password)
			throws LogicException {

		String hql = "from UserInfo o  where  o.loginName = '"+username+"'";
		List<UserInfo> list = userInfodao.find(hql);
		
		UserInfo userInfo=null;
		if (list == null || list.size() != 1) {
			throw new LogicException("账号不正确",101);
		} else if (list != null && list.size() == 1) {
			userInfo = list.get(0);
			try {
				if (!Md5encyptUtil.validPassword(password, userInfo.getPassword())) {
					throw new LogicException("密码不正确",102);
				}
			} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return userInfo;

	}

	/**
	 * 根据表单的不同id 存储不同的表单的对应用户
	 */
	@Override
	public UserInfo saveByFormId(String username, String email, String password,String registerType,int sex) {
		String encryptedPwd = null;
		
		UserInfo userInfo=new UserInfo();
		userInfo.setRegTime(new Date());
		userInfo.setUserType(registerType);
		userInfo.setLoginName(username);
		userInfo.setUserName(username);
		try {
			 encryptedPwd = Md5encyptUtil.getEncryptedPwd(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		userInfo.setPassword(encryptedPwd);
		userInfo.setId(new UuidTool().getUuid());
		userInfo.setStatus(0);
		userInfo.setApproval(0);
		userInfo.setSex(sex);
		userInfodao.save(userInfo);
		
		return userInfo;
	}

	@Override
	public void checkUsername(String username) {
		String hql = "from UserInfo o  where  o.loginName = '"+username+"'";
		List<UserInfo> list = userInfodao.find(hql);
		if(list.size()>=1){
			throw new LogicException("账号已存在");
		}else if(list.size()<1){
			throw new LogicException("账号可使用");
		}
	}

	
}
