package com.sol.squid.chat;

import java.util.List;

public interface ChatMapper {

	int submitChat(Chat chat);

	List<Chat> getAllChat();

}
