package com.sol.squid.scrap;

public class Scrap {
	private int s_no;
	private String s_u_id;
	private int s_rt_no;
	private int s_j_no;

	public Scrap() {
		// TODO Auto-generated constructor stub
	}

	public Scrap(int s_no, String s_u_id, int s_rt_no, int s_j_no) {
		super();
		this.s_no = s_no;
		this.s_u_id = s_u_id;
		this.s_rt_no = s_rt_no;
		this.s_j_no = s_j_no;
	}

	public int getS_j_no() {
		return s_j_no;
	}

	public void setS_j_no(int s_j_no) {
		this.s_j_no = s_j_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_u_id() {
		return s_u_id;
	}

	public void setS_u_id(String s_u_id) {
		this.s_u_id = s_u_id;
	}

	public int getS_rt_no() {
		return s_rt_no;
	}

	public void setS_rt_no(int s_rt_no) {
		this.s_rt_no = s_rt_no;
	}
	
}