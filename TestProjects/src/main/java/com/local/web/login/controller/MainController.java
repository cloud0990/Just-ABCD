package com.local.web.login.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.web.common.domain.PageingVo;
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
	@RequestMapping(value="/selectUserList", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> selectUserList(@ModelAttribute("pageing") PageingVo pageing, @RequestParam HashMap<String, Object> hashmapParam) throws Exception {
		
		List<HashMap<String, Object>> userList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object>  hashmapResult = new HashMap<String, Object>();
		
		//페이징 처리
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			
			System.out.println(page);
			System.out.println(rows);
			System.out.println(start);
			System.out.println(end);
			
			userList = mapper.selectUserList(hashmapParam);
			int records = mapper.getQueryTotalCnt();

			System.out.println(records);
				
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", userList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	@RequestMapping("/loginhist")
	public String loginhistPage() throws Exception {
		return "login/loginHist";
	}
	
	@RequestMapping(value="/selectLoginHist", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getLoginHist(@ModelAttribute("pageing") PageingVo pageing, @RequestParam HashMap<String, Object> hashmapParam) throws Exception {
		List<HashMap<String, Object>> loginHist = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object>   hashmapResult = new HashMap<String, Object>();
		
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			
			loginHist = mapper.selectLoginHist(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", loginHist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
}