function submitChat(token, toUserId, fromUserId) {
	let ok = confirm("쪽지를 보내시겠습니까?")
	
	if(ok) {
		location.href="chat.submit?token=" + token + "&c_toId=" + toUserId + "&c_fromId=" + fromUserId + "&u_id=" + toUserId;
	}
}

