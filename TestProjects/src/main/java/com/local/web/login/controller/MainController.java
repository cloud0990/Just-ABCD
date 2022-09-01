package com.local.web.login.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.web.common.domain.PageingVo;
import com.local.web.common.domain.ReturnDataVo;
import com.local.web.login.service.UserService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Resource(name="userService")
	private UserService mapper;
	
	@RequestMapping("/view")
	public String mainPage() {
		return "mainPage";
	}
	@RequestMapping("/loginhist")
	public String loginhistPage() throws Exception {
		return "login/loginHist";
	}
	
	/**
	 * 사용자 조회
	 * @param hashmapParam
	 * @param PageingVo
	 * @return HashMap
	 */
	@RequestMapping(value="/selectUserList", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> selectUserList(@ModelAttribute("pageing") PageingVo pageing, @RequestParam HashMap<String, Object> hashmapParam) throws Exception {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object>  hashmapResult = new HashMap<String, Object>();
		
		//페이징 처리 시, 반드시 try~catch로 예외처리 할 것
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			
			resultList = mapper.selectUserList(hashmapParam);
			int records = mapper.getQueryTotalCnt();

			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	/**
	 * 로그인기록 조회
	 * @param hashmapParam
	 * @param PageingVo
	 * @return HashMap
	 */
	@RequestMapping(value="/selectLoginHist", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getLoginHist(@ModelAttribute("pageing") PageingVo pageing, @RequestParam HashMap<String, Object> hashmapParam) throws Exception {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object>   hashmapResult = new HashMap<String, Object>();
		
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			
			resultList = mapper.selectLoginHist(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	/**
	 * 사용자 삭제
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@Transactional
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo deleteUser(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		try {
			mapper.deleteUser(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 사용자 수정
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@Transactional
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo updateUser(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		try {
			mapper.updateUser(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
	
}