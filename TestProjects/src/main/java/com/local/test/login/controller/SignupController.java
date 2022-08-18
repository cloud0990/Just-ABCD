package com.local.test.login.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.test.common.domain.ReturnDataVo;
import com.local.test.login.service.UserService;

@Controller
public class SignupController {

	@Resource(name="userService")
	private UserService service;
	
	@RequestMapping("/signUp")
	public String signUpPage() {
		return "signUpPage";
	}
	
	//회원가입
	@RequestMapping(value="/signUp/insertUser", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo signUp(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		//회원가입
		int resultSignUp = 0;
		try {
			resultSignUp = service.signUpUser(hashmapParam);
			result.setResultCode("S000");
			result.setResultMsg("회원가입을 축하드립니다.");
		} catch (Exception e) {
			result.setResultCode("S999");
			result.setResultMsg("이미 사용 중인 닉네임입니다.");
		}
		return result;
	}
}