package com.sol.squid.chat;

import java.util.List;

import com.sol.squid.user.User;

public interface ChatMapper {

	int submitChat(Chat chat);

//	List<Chat> getAllChat();

	List<Chat> getChatsByLoginUser(User u);

}
