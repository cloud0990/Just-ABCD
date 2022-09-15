package com.local.test.jsptest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {
	
	@RequestMapping("/view")
	public String view() {
		return "disabledAttr";
	}
	
}