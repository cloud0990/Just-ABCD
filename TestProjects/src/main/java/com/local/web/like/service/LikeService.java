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

	public int getLikeCnt(HashMap<String, Object> hashmapParam) {
		return mapper.getLikeCnt(hashmapParam);
	}
	public int insertLike(HashMap<String, Object> hashmapParam) {
		return mapper.insertLike(hashmapParam);
	}
	public int updateLikeTp(HashMap<String, Object> hashmapParam) {
		return mapper.updateLikeTp(hashmapParam);
	}
	public int deleteLike(HashMap<String, Object> hashmapParam) {
		return mapper.deleteLike(hashmapParam);
	}
}