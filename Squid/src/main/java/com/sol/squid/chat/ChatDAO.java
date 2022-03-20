package com.sol.squid.chat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.sol.squid.user.User;
import com.sol.squid.user.UserMapper;

@Service
public class ChatDAO {

	@Autowired
	private SqlSession ss;
	
	List<Chat> chats;
	
	public void submitIntro(Chat chat, HttpServletRequest req) {
		
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
		
		if(ss.getMapper(ChatMapper.class).submitIntro(chat) >= 1) {
			System.out.println("전송 성공");
			req.getSession().setAttribute("successToken", token);
		}else{
			System.out.println("전송 실패");
		};
		
	}

	public void getUserList(HttpServletRequest req) {
		
		User u = new User();
		u.setU_id(req.getParameter("u_id"));

		String toId[] = ss.getMapper(ChatMapper.class).getToId(u);
		String fromId[] = ss.getMapper(ChatMapper.class).getFromId(u);
		// 로그인한 유저랑 대화한 사람 전체 출력
		
		String oppnId[] = ArrayUtils.addAll(toId, fromId);
		HashSet<String> sort = new HashSet<String>(Arrays.asList(oppnId));
		oppnId = sort.toArray(new String[0]);
		// 중복값 제거
		
		ArrayList<User> oppnUsers = new ArrayList<User>();
		
		for (String s : oppnId) {
			User us = new User();
			us.setU_id(s);
			// System.out.println(us.getU_id());
			
			us = ss.getMapper(UserMapper.class).getUserByID(us);
			
//			System.out.println(us.getU_profile());
			
			oppnUsers.add(us); // 대화한 유저들 데이터 정보 뽑아오기

		}
		
//		for (User us : oppnUsers) {
//			System.out.println("이거도 안나오네 .. "+us.getU_profile());
//		}
		
		req.setAttribute("oppnUsers", oppnUsers);
		
//		for (String s : toId) {
//			System.out.println("이거 배열임" + s);
//		}
//		
//		for (String s : fromId) {
//			System.out.println("이건 프롬배열임" + s);
//		}
		
	}

	public String printChat(Chat chat, HttpServletRequest req) {
		
//		System.out.println("챗 유저아이디 : " + chat.getC_toId());
//		System.out.println("다른정보 : " + chat.getC_content());
//		System.out.println("챗 상대아이디 : " + chat.getC_fromId());
		
		chats = new ArrayList<Chat>();
		
		chats = ss.getMapper(ChatMapper.class).getAllChatting(chat);
		
//		System.out.println(chats.size());

//		for (Chat c : chats) {
//			System.out.println(c.getC_fromId());
//			System.out.println(c.getC_toId());
//			System.out.println(c.getC_content());
//		}
		
		Gson gson = new Gson();
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("chats", chats);
		
//		System.out.println(data.get("chats"));
		
		return gson.toJson(data.get("chats"));
	}

	public void submitChat(Chat chat) {

		if(ss.getMapper(ChatMapper.class).submitIntro(chat) >= 1) {
			System.out.println("전송 성공");
		}else{
			System.out.println("전송 실패");
		};
		
	}
	

}
