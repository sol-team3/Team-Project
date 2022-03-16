package com.sol.squid.chat;

import java.util.Date;

public class Chat {

	private int c_no;
	private String c_oppn;
	private String c_uId;
	private String c_toId;
	private String c_fromId;
	private String c_content;
	private Date c_date;
	
	public Chat() {}

	public Chat(int c_no, String c_oppn, String c_uId, String c_toId, String c_fromId, String c_content, Date c_date) {
		super();
		this.c_no = c_no;
		this.c_oppn = c_oppn;
		this.c_uId = c_uId;
		this.c_toId = c_toId;
		this.c_fromId = c_fromId;
		this.c_content = c_content;
		this.c_date = c_date;
	}

	public String getC_uId() {
		return c_uId;
	}

	public void setC_uId(String c_uId) {
		this.c_uId = c_uId;
	}

	public String getC_oppn() {
		return c_oppn;
	}

	public void setC_oppn(String c_oppn) {
		this.c_oppn = c_oppn;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_toId() {
		return c_toId;
	}

	public void setC_toId(String c_toId) {
		this.c_toId = c_toId;
	}

	public String getC_fromId() {
		return c_fromId;
	}

	public void setC_fromId(String c_fromId) {
		this.c_fromId = c_fromId;
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
