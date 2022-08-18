package com.local.web.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
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
	
	//CompanyService는 CompanyMapper(=Dao)를 구현한 클래스이다.
	//해당 Annotation을 통해 의존성 주입
	//@Resource(name="userService")
	//private UserService service;
	
	@RequestMapping("/autoComplete")
	public String hello() {
		return "test/autoCompleteTest";
	}
}