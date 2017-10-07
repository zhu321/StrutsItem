package com.cn.entity;
/**
 * 用户成绩表，增加一个备注字段
 * 
 * 此实体类与数据库中的表稍微有些不一样，将u_id改为u_name,test_id该test_name,方便到页面显示
 * 
 * */
public class Userscore {
	private int score_id;
	private String u_name;
	private String test_name;
	private int score;
	private String test_start;
	private String test_end;
	private String single_answer;//此处保留的是用户自己的答案，而不是标准答案
	private String multiple_answer;
	private String notes;
	public int getScore_id() {
		return score_id;
	}
	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getTest_start() {
		return test_start;
	}
	public void setTest_start(String test_start) {
		this.test_start = test_start;
	}
	public String getTest_end() {
		return test_end;
	}
	public void setTest_end(String test_end) {
		this.test_end = test_end;
	}
	public String getSingle_answer() {
		return single_answer;
	}
	public void setSingle_answer(String single_answer) {
		this.single_answer = single_answer;
	}
	public String getMultiple_answer() {
		return multiple_answer;
	}
	public void setMultiple_answer(String multiple_answer) {
		this.multiple_answer = multiple_answer;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Userscore() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Userscore(int score_id, String u_name, String test_name, int score, String test_start, String test_end,
			String single_answer, String multiple_answer, String notes) {
		super();
		this.score_id = score_id;
		this.u_name = u_name;
		this.test_name = test_name;
		this.score = score;
		this.test_start = test_start;
		this.test_end = test_end;
		this.single_answer = single_answer;
		this.multiple_answer = multiple_answer;
		this.notes = notes;
	}
	
	

}
