package com.sol.squid.chat;

import java.util.Date;

public class Chat {

	private int c_no;
	private String c_toUserId;
	private String c_fromUserId;
	private String c_content;
	private Date c_date;
	
	public Chat() {}

	public Chat(int c_no, String c_toUserid, String c_fromUserid, String c_content, Date c_date) {
		super();
		this.c_no = c_no;
		this.c_toUserId = c_toUserid;
		this.c_fromUserId = c_fromUserid;
		this.c_content = c_content;
		this.c_date = c_date;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_toUserId() {
		return c_toUserId;
	}

	public void setC_toUserId(String c_toUserId) {
		this.c_toUserId = c_toUserId;
	}

	public String getC_fromUserId() {
		return c_fromUserId;
	}

	public void setC_fromUserId(String c_fromUserId) {
		this.c_fromUserId = c_fromUserId;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
		
}
