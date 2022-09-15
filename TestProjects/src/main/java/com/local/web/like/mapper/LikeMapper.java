package com.local.web.like.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("likeMapper")
public interface LikeMapper {
	
	List<HashMap<String, Object>> getLikeListRetrieve(HashMap<String, Object> hashmapParam);
	int getLikeCnt(HashMap<String, Object> hashmapParam);
	int createLike(HashMap<String, Object> hashmapParam);	
	int updateLike(HashMap<String, Object> hashmapParam);	
	int updateInitLike(HashMap<String, Object> hashmapParam);	
	HashMap<String, Object> getLikeTp(HashMap<String, Object> hashmapParam);
}