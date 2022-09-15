package com.local.web.like.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.web.common.domain.ReturnDataVo;
import com.local.web.like.service.LikeService;

@Controller
@RequestMapping("/like/board")
public class LikeController {
	
	@Resource(name="likeService")
	private LikeService mapper;
	
	@RequestMapping(value="/getLikeListRetrieve", method=RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> getLikeListRetrieve(@RequestParam HashMap<String, Object> hashmapParam) {
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		
		mapper.getLikeListRetrieve(hashmapParam);
		
		
		return resultList;
	}
	
	@RequestMapping(value="/getLikeTp", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo getLIke(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		
		for(Map.Entry<String, Object> map : hashmapParam.entrySet()) {
			System.out.println("key: " + map.getKey() );
			System.out.println("value: " + map.getValue() );
		}
		
		resultMap = mapper.getLikeTp(hashmapParam);
		
		result.setData(resultMap);
		return result;
	}
	
	@Transactional
	@RequestMapping(value="/createLike", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo createLike(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		HashMap<String, Object> hashmapResult = new HashMap<String, Object>();
		
		int likeCnt = mapper.getLikeCnt(hashmapParam);
		hashmapResult = mapper.getLikeTp(hashmapParam);
		
		try {
			if(likeCnt==0) {
				hashmapParam.put("like_tp", "Y");
				mapper.updateInitLike(hashmapParam);
				result.setResultCode("S000");
			}else if(likeCnt!=0 && "Y".equals(hashmapResult.get("like_tp"))) {
				hashmapParam.put("like_tp", "N");
				mapper.updateLike(hashmapParam);
				result.setResultCode("S000");
			}else {
				hashmapParam.put("like_tp", "Y");
				mapper.updateLike(hashmapParam);
				result.setResultCode("S000");
			}
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		
		return result;
	}
	
}