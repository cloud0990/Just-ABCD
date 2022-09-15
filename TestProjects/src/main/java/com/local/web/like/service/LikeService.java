package com.local.web.like.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.local.web.like.mapper.LikeMapper;

@Service("likeService")
public class LikeService {
	@Resource(name="likeMapper")
	private LikeMapper mapper;
	
	public List<HashMap<String, Object>> getLikeListRetrieve(HashMap<String, Object> hashmapParam){
		return mapper.getLikeListRetrieve(hashmapParam);
	}
	
	public int getLikeCnt(HashMap<String, Object> hashmapParam) {
		return mapper.getLikeCnt(hashmapParam);
	}
	
	public HashMap<String, Object> getLikeTp(HashMap<String, Object> hashmapParam) {
		return mapper.getLikeTp(hashmapParam);
	}
	
	public int createLike(HashMap<String, Object> hashmapParam) {
		return mapper.createLike(hashmapParam);
	}
	
	public int updateLike(HashMap<String, Object> hashmapParam) {
		return mapper.updateLike(hashmapParam);
	}
	public int updateInitLike(HashMap<String, Object> hashmapParam) {
		return mapper.updateInitLike(hashmapParam);
	}

}