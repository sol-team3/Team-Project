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
		
		// 토큰 발생
		String token = req.getParameter("token");
		String successToken = (String)req.getSession().getAttribute("successToken");
		
		System.out.println(token);
		System.out.println(successToken);
		
		// 중복 처리
		if(successToken != null && token.equals(successToken)) {
			return;
		}
		
		String toUserId = req.getParameter("c_toId");
		String fromUserId = req.getParameter("c_fromId");
		
		User toUser = new User();
		toUser.setU_id(toUserId);
		
		// 보내는 사람 ID 출력
		toUser = ss.getMapper(UserMapper.class).getUserByID(toUser);
		// System.out.println("보내는 사람" + toUser.getU_intro());
		
		req.setAttribute("toUser", toUser);
		
		User fromUser = new User();
		fromUser.setU_id(fromUserId);
		
		// 받는 사람 ID 출력
		fromUser = ss.getMapper(UserMapper.class).getUserByID(fromUser);
		// System.out.println("받는 사람" + fromUser.getU_intro());
		req.setAttribute("fromUser", fromUser);
		
		chat.setC_content(toUser.getU_intro());
		
		// 채팅 전송
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
		
		// 채팅 중인 유저 데이터들
		ArrayList<User> oppnUsers = new ArrayList<User>();
		
		for (String s : oppnId) {
			User us = new User();
			us.setU_id(s);
			us = ss.getMapper(UserMapper.class).getUserByID(us);
//			System.out.println(us.getU_profile());
			oppnUsers.add(us); // 대화한 유저들 데이터 정보 뽑아오기
		}
		req.setAttribute("oppnUsers", oppnUsers);
	}

	public String printChat(Chat chat, HttpServletRequest req) {
		
//		System.out.println("챗 유저아이디 : " + chat.getC_toId());
//		System.out.println("다른정보 : " + chat.getC_content());
//		System.out.println("챗 상대아이디 : " + chat.getC_fromId());
		
		chats = new ArrayList<Chat>();
		// 채팅들 값 뽑기
		chats = ss.getMapper(ChatMapper.class).getAllChatting(chat);
		
		// 뽑은 값 제이슨으로 파싱
		Gson gson = new Gson();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("chats", chats);
		return gson.toJson(data.get("chats"));
	}

	public void submitChat(Chat chat) {

		// 채팅 전송
		if(ss.getMapper(ChatMapper.class).submitIntro(chat) >= 1) {
			System.out.println("전송 성공");
		}else{
			System.out.println("전송 실패");
		};
		
	}
	

}
