package com.local.web.login.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.web.common.domain.ReturnDataVo;
import com.local.web.login.service.UserService;

@Controller
@RequestMapping(value="/signUp")
public class SignupController {

	@Resource(name="userService")
	private UserService service;
	
	@RequestMapping(value="/view")
	public String signUpPage() {
		return "signUp";
	}
	
	/**
	 * 회원가입
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@RequestMapping(value="/insertUser", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo signUp(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		try {
			service.signUpUser(hashmapParam);
			result.setResultCode("S000");
			result.setResultMsg("회원가입을 축하드립니다.");
		} catch (Exception e) {
			result.setResultCode("S999");
			result.setResultMsg("이미 사용 중인 닉네임입니다.");
		}
		return result;
	}
}