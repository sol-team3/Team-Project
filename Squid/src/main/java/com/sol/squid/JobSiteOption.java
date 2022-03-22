package com.sol.squid;

import javax.servlet.http.HttpServletRequest;

public class JobSiteOption {
	
	private int jobCountPerpage; // 한 페이지당 개수
	
	public JobSiteOption() {
		// TODO Auto-generated constructor stub
	}

	public int getJobCountPerpage() {
		return jobCountPerpage;
	}

	public void setJobCountPerpage(int jobCountPerpage) {
		this.jobCountPerpage = jobCountPerpage;
	}

	public JobSiteOption(int jobCountPerpage) {
		super();
		this.jobCountPerpage = jobCountPerpage;
	}
	
	public static void searchClear1(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}
	
}
