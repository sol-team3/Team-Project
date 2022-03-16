package com.sol.squid.chat;

import java.util.List;

import com.sol.squid.user.User;

public interface ChatMapper {

	int submitChat(Chat chat);

	List<Chat> getChatsByLoginUser(User u);

	List<Chat> getAllChatting(Chat chat);

}
