function deleteScrap(uId, rtNo) {
	let ok = confirm("스크랩을 삭제할까요?")
	
	if(ok) {
		location.href="scrap.delete?s_u_id=" + uId + "&s_rt_no=" + rtNo;
	}
}