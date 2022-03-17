package com.sol.squid.chat;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sol.squid.TokenMaker;

@Controller
public class ChatController {

	@Autowired
	ChatDAO cDAO;
	
	@RequestMapping(value = "/chat.go", method = RequestMethod.GET)
	public String goChatPage(HttpServletRequest req) {
		
		cDAO.getUserList(req);
		
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

	@RequestMapping(value = "/chatting.print", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	public @ResponseBody void printChat(Chat chat, HttpServletRequest req, HttpServletResponse responce) {
		
//		System.out.println("컨트롤러 : " + cDAO.printChat(chat, req));
		try {
			responce.getWriter().print(cDAO.printChat(chat, req));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
