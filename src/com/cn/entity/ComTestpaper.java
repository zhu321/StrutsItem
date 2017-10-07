package com.cn.entity;

/**
 *另外写一个实体与页面显示的对应
 */
public class ComTestpaper {
	private int test_id ;
	private String test_name;
	private String dep_name;
	private int totalScore; //总分
	private int totaltime; //答卷时间 
	private int totalclick; //总点击数
	private String start_time;
	private String end_time;
	private String test_time;
	
	public int getTest_id() {
		return test_id;
	}
	public void setTest_id(int test_id) {
		this.test_id = test_id;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public int getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(int totaltime) {
		this.totaltime = totaltime;
	}
	public int getTotalclick() {
		return totalclick;
	}
	public void setTotalclick(int totalclick) {
		this.totalclick = totalclick;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getTest_time() {
		return test_time;
	}
	public void setTest_time(String test_time) {
		this.test_time = test_time;
	}
	public ComTestpaper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ComTestpaper(int test_id, String test_name, String dep_name, int totalScore, int totaltime, int totalclick,
			String start_time, String end_time, String test_time) {
		super();
		this.test_id = test_id;
		this.test_name = test_name;
		this.dep_name = dep_name;
		this.totalScore = totalScore;
		this.totaltime = totaltime;
		this.totalclick = totalclick;
		this.start_time = start_time;
		this.end_time = end_time;
		this.test_time = test_time;
	}
	

}
