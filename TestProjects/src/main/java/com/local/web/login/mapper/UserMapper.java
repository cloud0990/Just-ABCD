package com.local.web.login.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.local.web.common.domain.SessionVo;

//Service interface
@Repository("userMapper")
//userDao
public interface UserMapper {
	//직전 결과 처리 행수
	int getQueryTotalCnt();
	//회원가입
	int signUpUser(HashMap<String, Object> hashmapParam);
	//로그인
	SessionVo checkLoginUser(HashMap<String, String> hashmapParam);
	//전체 회원 조회
	List<HashMap<String, Object>> selectUserList(HashMap<String, Object> hashmapParam);
	//로그인기록 저장
	int createloginHist(HashMap<String, Object> hashmapParam);
	//로그인기록 조회
	List<HashMap<String, Object>> selectLoginHist(HashMap<String, Object> hashmapParam);
	//현재 사용자 검색
	List<HashMap<String, Object>> srchUserListRetrieve(HashMap<String, Object> hashmapParam);
	//사용자 삭제
	int deleteUser(HashMap<String, Object> hashmapParam);
	//사용자 수정
	int updateUser(HashMap<String, Object> hashmapParam);
}	