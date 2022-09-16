package com.local.web.like.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("likeMapper")
public interface LikeMapper {
	int getLikeCnt(HashMap<String, Object> hashmapParam);	
	int insertLike(HashMap<String, Object> hashmapParam);	
	int insertBoardLike(HashMap<String, Object> hashmapParam);	
	int updateLikeTp(HashMap<String, Object> hashmapParam);	
	int deleteLike(HashMap<String, Object> hashmapParam);
}