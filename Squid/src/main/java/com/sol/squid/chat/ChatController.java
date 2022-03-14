package com.sol.squid.chat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	@Autowired
	ChatDAO cDAO;
	
	@RequestMapping(value = "/chat.go", method = RequestMethod.GET)
	public String goChatPage(HttpServletRequest req) {
		
		cDAO.getAllChat(req);
		
		req.setAttribute("contentPage", "chat/chatMain.jsp");
		return "index";
	}

	@RequestMapping(value = "/chat.submit", method = RequestMethod.GET)
	public String submitChat(Chat chat, HttpServletRequest req) {
		
		cDAO.submitChat(chat, req);
		
		req.setAttribute("contentPage", "chat/chatMain.jsp");
		return "index";
	}
	
}
