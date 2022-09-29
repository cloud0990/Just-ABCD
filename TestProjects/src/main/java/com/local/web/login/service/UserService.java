package com.local.web.login.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.local.web.common.domain.SessionVo;
import com.local.web.login.mapper.UserMapper;

//Mapper구현 객체 (=ServiceImpl)
@Service("userService")
public class UserService {
	
	@Resource(name="userMapper")
	private UserMapper mapper;
	
	public int getQueryTotalCnt() {
		return mapper.getQueryTotalCnt();
	}
	public int signUpUser(HashMap<String, Object> hashmapParam) {
		return mapper.signUpUser(hashmapParam);
	}
	public SessionVo checkLoginUser(HashMap<String, Object> hashmapParam) {
		return mapper.checkLoginUser(hashmapParam);
	}
	public SessionVo changeUser(HashMap<String, Object> hashmapParam) {
		return mapper.changeUser(hashmapParam);
	}
	public List<HashMap<String, Object>> selectUserList(HashMap<String, Object> hashmapParam) {
		return mapper.selectUserList(hashmapParam);
	}
	public int createloginHist(HashMap<String, Object> hashmapParam) {
		return mapper.createloginHist(hashmapParam);
	}
	public List<HashMap<String, Object>> selectLoginHist(HashMap<String, Object> hashmapParam) {
		return mapper.selectLoginHist(hashmapParam);
	}
	public List<HashMap<String, Object>> srchUserListRetrieve(HashMap<String, Object> hashmapParam) {
		return mapper.srchUserListRetrieve(hashmapParam);
	}
	public int deleteUser(HashMap<String, Object> hashmapParam) {
		return mapper.deleteUser(hashmapParam);
	}
	public int deleteLoginHist(HashMap<String, Object> hashmapParam) {
		return mapper.deleteLoginHist(hashmapParam);
	}
	public int allDeleteLoginHist() {
		return mapper.allDeleteLoginHist();
	}
	public List<HashMap<String, Object>> getLogRetrieve(HashMap<String, Object> hashmapParam) {
		return mapper.getLogRetrieve(hashmapParam);
	}
	public int updateUser(HashMap<String, Object> hashmapParam) {
		return mapper.updateUser(hashmapParam);
	}
	public int chkUserNm(HashMap<String, Object> hashmapParam) {
		return mapper.chkUserNm(hashmapParam);
	}
}