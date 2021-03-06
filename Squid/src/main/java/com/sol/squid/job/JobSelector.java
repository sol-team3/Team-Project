package com.sol.squid.job;

import java.math.BigDecimal;

// Bean
// 검색어

// OO ~ OO 검색
public class JobSelector {
	
	private String search;	// 검색어 처리
	
	// 숫자 두개 처리하기 위한..
	private BigDecimal start;	
	private BigDecimal end;
	
	public JobSelector() {
		// TODO Auto-generated constructor stub
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
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
	public JobSelector(String search, BigDecimal start, BigDecimal end) {
		super();
		this.search = search;
		this.start = start;
		this.end = end;
	}
	
	
	 
}
