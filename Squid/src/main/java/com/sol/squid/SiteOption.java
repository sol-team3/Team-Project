package com.sol.squid;

import javax.servlet.http.HttpServletRequest;

// 페이지 관련
public class SiteOption {
	
	private int boardCountPerpage; // 한 페이지당 개수
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}
	
	public int getBoardCountPerpage() {
		return boardCountPerpage;
	}

	public void setBoardCountPerpage(int boardCountPerpage) {
		this.boardCountPerpage = boardCountPerpage;
	}
	
	public SiteOption(int boardCountPerpage) {
		super();
		this.boardCountPerpage = boardCountPerpage;
	}

	// 세션값 초기화 - job
	public static void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);		
	}
	
	// 세션값 초기화 - board
	public static void clearSearch1(HttpServletRequest req) {
		req.getSession().setAttribute("search1", null);		
	}
	
}
