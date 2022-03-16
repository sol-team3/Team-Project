package com.sol.squid.chat;

import java.util.ArrayList;
import java.util.HashSet;
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
		
		String token = req.getParameter("token");
		String successToken = (String)req.getSession().getAttribute("successToken");
		
		System.out.println(token);
		System.out.println(successToken);
		
		if(successToken != null && token.equals(successToken)) {
			return;
		}
		
		String toUserId = req.getParameter("c_toId");
		String fromUserId = req.getParameter("c_fromId");
		
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
			req.getSession().setAttribute("successToken", token);
		}else{
			System.out.println("전송 실패");
		};
		
	}

	public void getAllChat(HttpServletRequest req) {

		
		User u = new User();
		u.setU_id(req.getParameter("myID"));
		
		System.out.println(u.getU_id());
		
		User myInfo = ss.getMapper(UserMapper.class).getUserByID(u); // 내정보

		chats = ss.getMapper(ChatMapper.class).getChatsByLoginUser(myInfo); 
		System.out.println(chats.size());
		
		User oppn = new User();
		ArrayList<User> oppns = new ArrayList<User>();
		
		for (Chat c : chats) {
			System.out.println("여기는 뭐? " + c.getC_oppn());
			
			oppn.setU_id(c.getC_oppn());
			oppns.add(ss.getMapper(UserMapper.class).getUserByID(oppn));
		}
		
		for (User user : oppns) {
			System.out.println(user.getU_id());
			System.out.println(user.getU_name());
		}
		
//		for (Chat c : chats) {
//			
//			if (c.getC_toId().equals(myInfo.getU_id())) {
//				// 받는 사람 info
//				u.setU_id(c.getC_fromId());
//				User fromUser = ss.getMapper(UserMapper.class).getUserByID(u);
//				// System.out.println("받는사람이 나일때 보내는사람 아이디 : " + fromUser.getU_id());
//				fromUsers.add(fromUser);
//				
//			}
//
//			if (c.getC_fromId().equals(myInfo.getU_id())) {
//				// 주는 사람 info 
//				u.setU_id(c.getC_toId());
//				User toUser = ss.getMapper(UserMapper.class).getUserByID(u);
//				// System.out.println("보내는사람이 나일때 받는사람 아이디 : " + toUser.getU_id());
//				toUsers.add(toUser);
//			}
//		}
		
//		System.out.println(toUserList.size());
//		System.out.println(fromUserList.size());
		
//		for (User user : fromUserList) {
//			System.out.println("받아보자" + user.getU_id());
//		}
//		for (User user : toUserList) {
//			System.out.println("보내보자" + user.getU_id());
//		}
		
//		if(fromUsers.size() != 0) {
//			System.out.println(fromUsers.size());
//			System.out.println(fromUsers.get(0).getU_id());
//			System.out.println(fromUsers.get(0).getU_name());
//		}
//
//		if(toUsers.size() != 0) {
//			System.out.println(toUsers.size());
//			System.out.println(toUsers.get(0).getU_id());
//			System.out.println(toUsers.get(0).getU_name());
//		}
		
//		for (User fromU : fromUsers) {
//			System.out.println("받는 사람들 " +fromU.getU_id());
//		}
//		
//		for (User toU : toUsers) {
//			System.out.println("주는 사람들" +toU.getU_id());
//		}
		
		req.setAttribute("chats", chats);
		req.setAttribute("oppns", oppns);
	}
	
	
	
}
