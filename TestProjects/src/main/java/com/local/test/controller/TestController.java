package com.local.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.test.common.domain.ReturnDataVo;
import com.local.test.login.service.UserService;

@Controller
public class TestController {
	
	//CompanyService는 CompanyMapper(=Dao)를 구현한 클래스이다.
	//해당 Annotation을 통해 의존성 주입
	@Resource(name="userService")
	private UserService service;
	
	//@Autowired
	//private CompanyService service;
	
//	@RequestMapping(value="/hello")
//	public String hello(Model model) {
//		List<CompanyVo> list = service.getCompanyList();
//		
//		model.addAttribute("list", list);
//
//		return "hello";
//	}
	
	@RequestMapping("/hello")
	public String hello() {
		return "hello";
	}
	
	@RequestMapping(value="/hello/srch", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo srchUserListRetrieve(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		
		for(Map.Entry<String, Object> entry : hashmapParam.entrySet()) {
			String key = entry.getKey();
			Object val = entry.getValue();
			System.out.println(key);
			System.out.println(val);
		}
		
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		try {
			resultList = service.srchUserListRetrieve(hashmapParam);
			result.setResultCode("S000");
			result.setData(resultList);
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
}