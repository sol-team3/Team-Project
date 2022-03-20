package com.sol.squid.chat;

import java.util.List;

import com.sol.squid.user.User;

public interface ChatMapper {

	int submitIntro(Chat chat);

	String[] getToId(User u);

	String[] getFromId(User u);

	List<Chat> getAllChatting(Chat chat);

}
