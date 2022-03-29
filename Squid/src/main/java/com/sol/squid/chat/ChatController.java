package com.sol.squid.chat;

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
	
	// 채팅 페이지 이동
	@RequestMapping(value = "/chat.go", method = RequestMethod.GET)
	public String goChatPage(HttpServletRequest req) {
		
		cDAO.getUserList(req);
		
		req.setAttribute("contentPage", "chat/chatMain.jsp");
		return "index";
	}

	// 지원 채팅 전송
	@RequestMapping(value = "/chat.submit.intro", method = RequestMethod.GET)
	public String submitIntro(Chat chat, HttpServletRequest req) {
		
		TokenMaker.make(req);
		
		cDAO.submitIntro(chat, req);
		cDAO.getUserList(req);
		
		req.setAttribute("contentPage", "chat/chatMain.jsp");
		return "index";
	}

	// 채팅 내역 출력
	@RequestMapping(value = "/chatting.print", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	public @ResponseBody void printChat(Chat chat, HttpServletRequest req, HttpServletResponse responce) {
		
//		System.out.println("컨트롤러 : " + cDAO.printChat(chat, req));
		try {
			responce.getWriter().print(cDAO.printChat(chat, req));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 채팅 전송
	@RequestMapping(value = "/chat.submit", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	public @ResponseBody void submitChat(Chat chat, HttpServletRequest req, HttpServletResponse responce) {
		
//		System.out.println(chat.getC_content());
//		System.out.println(chat.getC_toId());
//		System.out.println(chat.getC_fromId());
		
		cDAO.submitChat(chat);
		
		try {
			responce.getWriter().print(cDAO.printChat(chat, req));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
