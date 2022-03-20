function submitChat(toUserId, fromUserId) {
	let ok = confirm("쪽지를 보내시겠습니까?")
	
	if(ok) {
		location.href="chat.submit?c_toUserId=" + toUserId + "&c_fromUserId=" + fromUserId;
	}
}