package com.local.web.login.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.local.web.common.domain.SessionVo;

//Service interface
@Repository("userMapper")
//userDao
public interface UserMapper {

	int getQueryTotalCnt();

	int signUpUser(HashMap<String, Object> hashmapParam);
	int chkUserNm(HashMap<String, Object> hashmapParam);
	int deleteUser(HashMap<String, Object> hashmapParam);
	int updateUser(HashMap<String, Object> hashmapParam);
	
	SessionVo checkLoginUser(HashMap<String, Object> hashmapParam);
	SessionVo changeUser(HashMap<String, Object> hashmapParam);

	List<HashMap<String, Object>> selectUserList(HashMap<String, Object> hashmapParam);
	List<HashMap<String, Object>> selectLoginHist(HashMap<String, Object> hashmapParam);
	List<HashMap<String, Object>> srchUserListRetrieve(HashMap<String, Object> hashmapParam);

	List<HashMap<String, Object>> getLogRetrieve(HashMap<String, Object> hashmapParam);
	
	int createloginHist(HashMap<String, Object> hashmapParam);
	int deleteLoginHist(HashMap<String, Object> hashmapParam);
	int allDeleteLoginHist();
}	