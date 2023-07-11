package com.local.web.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat/main")
public class ChatController {
	
	@RequestMapping("/view")
	public String view() {
		return "chat/chatMain";
	}
	
}