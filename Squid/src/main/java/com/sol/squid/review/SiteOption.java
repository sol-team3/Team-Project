package com.sol.squid.review;

import javax.servlet.http.HttpServletRequest;

public class SiteOption {

	private int cntPerPage;
	
	public SiteOption() {}

	public SiteOption(int cntPerPage) {
		super();
		this.cntPerPage = cntPerPage;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	
	public static void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}
	
}
