package com.sol.squid.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol.squid.user.User;
import com.sol.squid.user.UserMapper;

@Service
public class ChatDAO {

	@Autowired
	private SqlSession ss;
	
	List<Chat> chats;

	public void submitChat(Chat chat, HttpServletRequest req) {
		
		String toUserId = req.getParameter("c_toUserId");
		String fromUserId = req.getParameter("c_fromUserId");
		
		User toUser = new User();
		toUser.setU_id(toUserId);
		
		toUser = ss.getMapper(UserMapper.class).getUserByID(toUser);
		System.out.println("보내는 사람" + toUser.getU_intro());
		
		req.setAttribute("toUser", toUser);
		
		User fromUser = new User();
		fromUser.setU_id(fromUserId);
		
		fromUser = ss.getMapper(UserMapper.class).getUserByID(fromUser);
		System.out.println("받는 사람" + fromUser.getU_intro());
		req.setAttribute("fromUser", fromUser);
		
		chat.setC_content(toUser.getU_intro());
		
		if(ss.getMapper(ChatMapper.class).submitChat(chat) >= 1) {
			System.out.println("전송 성공");
		}else{
			System.out.println("전송 실패");
		};
		
	}

	public void getAllChat(HttpServletRequest req) {

		chats = ss.getMapper(ChatMapper.class).getAllChat();
		
		req.setAttribute("chats", chats);
	}
	
	
	
}
