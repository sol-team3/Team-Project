package com.sol.squid.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.squid.TokenMaker;
import com.sol.squid.user.User;

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
		
		TokenMaker.make(req);
		
		cDAO.submitChat(chat, req);
		
		req.setAttribute("contentPage", "chat/chatMain.jsp");
		return "index";
	}

	@RequestMapping(value = "/chatting.print", method = RequestMethod.GET, produces="application/text; charset=utf-8")
	public @ResponseBody List<Chat> printChat(Chat chat, User user, HttpServletRequest req) {
		
		List<Chat> chats;
		
		chats = cDAO.printChat(chat, req);
		
		return chats;
	}
	
}
