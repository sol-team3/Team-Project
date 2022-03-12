package com.sol.squid.recruit;

public class SearchRecruit {

	private String recruitResearchMainSelect;
	private String recruitResearchMainInput;
	private String recruitResearchStartDate;
	private String recruitResearchEndDate;
	private String recruitResearchStartTime;
	private String recruitResearchEndTime;
	private int startPage;
	private int endPage;
	
	public SearchRecruit() {
		// TODO Auto-generated constructor stub
	}

	public SearchRecruit(String recruitResearchMainSelect, String recruitResearchMainInput,
			String recruitResearchStartDate, String recruitResearchEndDate, String recruitResearchStartTime,
			String recruitResearchEndTime, int startPage, int endPage) {
		super();
		this.recruitResearchMainSelect = recruitResearchMainSelect;
		this.recruitResearchMainInput = recruitResearchMainInput;
		this.recruitResearchStartDate = recruitResearchStartDate;
		this.recruitResearchEndDate = recruitResearchEndDate;
		this.recruitResearchStartTime = recruitResearchStartTime;
		this.recruitResearchEndTime = recruitResearchEndTime;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getRecruitResearchMainSelect() {
		return recruitResearchMainSelect;
	}

	public void setRecruitResearchMainSelect(String recruitResearchMainSelect) {
		this.recruitResearchMainSelect = recruitResearchMainSelect;
	}

	public String getRecruitResearchMainInput() {
		return recruitResearchMainInput;
	}

	public void setRecruitResearchMainInput(String recruitResearchMainInput) {
		this.recruitResearchMainInput = recruitResearchMainInput;
	}

	public String getRecruitResearchStartDate() {
		return recruitResearchStartDate;
	}

	public void setRecruitResearchStartDate(String recruitResearchStartDate) {
		this.recruitResearchStartDate = recruitResearchStartDate;
	}

	public String getRecruitResearchEndDate() {
		return recruitResearchEndDate;
	}

	public void setRecruitResearchEndDate(String recruitResearchEndDate) {
		this.recruitResearchEndDate = recruitResearchEndDate;
	}

	public String getRecruitResearchStartTime() {
		return recruitResearchStartTime;
	}

	public void setRecruitResearchStartTime(String recruitResearchStartTime) {
		this.recruitResearchStartTime = recruitResearchStartTime;
	}

	public String getRecruitResearchEndTime() {
		return recruitResearchEndTime;
	}

	public void setRecruitResearchEndTime(String recruitResearchEndTime) {
		this.recruitResearchEndTime = recruitResearchEndTime;
	}
	
}
