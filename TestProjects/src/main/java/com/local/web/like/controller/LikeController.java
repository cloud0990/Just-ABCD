package com.local.web.like.controller;

import java.util.HashMap;

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
	

	/**
	 * 좋아요타입 변경
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@Transactional
	@RequestMapping(value="/updateLikeTp", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo updateLikeTp(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		try {
			int cnt = mapper.getLikeCnt(hashmapParam);
			
			/* 최초 좋아요인 경우 */
			if(cnt == 0) {
				mapper.insertLike(hashmapParam);
			}
			
			mapper.updateLikeTp(hashmapParam);
			
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
}