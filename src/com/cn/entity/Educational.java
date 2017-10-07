package com.cn.entity;

public class Educational {
	private int edu_id;
	private String edu_name;
	
	
	public Educational(int edu_id, String edu_name) {
		super();
		this.edu_id = edu_id;
		this.edu_name = edu_name;
	}
	public Educational() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getEdu_id() {
		return edu_id;
	}
	public void setEdu_id(int edu_id) {
		this.edu_id = edu_id;
	}
	public String getEdu_name() {
		return edu_name;
	}
	public void setEdu_name(String edu_name) {
		this.edu_name = edu_name;
	}
	

}
