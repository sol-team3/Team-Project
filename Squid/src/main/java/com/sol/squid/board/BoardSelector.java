package com.sol.squid.board;

import java.math.BigDecimal;

// Bean
// 검색어

// OO ~ OO 검색
public class BoardSelector {
	
	private String search1;	// 검색어 처리
	
	// 숫자 두개 처리하기 위한..
	private BigDecimal start;	
	private BigDecimal end;
	

	
	
	public String getSearch1() {
		return search1;
	}
	public void setSearch1(String search1) {
		this.search1 = search1;
	}
	
	public BigDecimal getStart() {
		return start;
	}
	public void setStart(BigDecimal start) {
		this.start = start;
	}
	public BigDecimal getEnd() {
		return end;
	}
	public void setEnd(BigDecimal end) {
		this.end = end;
	}
	
	public BoardSelector() {
		// TODO Auto-generated constructor stub
	}
	public BoardSelector(String search1, BigDecimal start, BigDecimal end) {
		super();
		this.search1 = search1;
		this.start = start;
		this.end = end;
	}
	
	
	 
}
