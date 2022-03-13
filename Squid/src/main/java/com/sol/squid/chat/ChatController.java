package com.sol.squid.chat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	@RequestMapping(value = "/chat.go", method = RequestMethod.GET)
	public String goRecritPage(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "chat/chatMain.jsp");
		return "index";
	}
	
}
