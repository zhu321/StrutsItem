package com.cn.entity;
/**
 *试卷维护,设置试卷的题目数量和每题的分数，总分等
 */
public class Maintaintestpaper {
	private int maintain_id;
	private int single_quantity;
	private int single_grade;
	private int multiple_quantity;
	private int multiple_grade;
	private int totalscore;
	private int totaltime;
	private String maintain_time;
	public int getMaintain_id() {
		return maintain_id;
	}
	public void setMaintain_id(int maintain_id) {
		this.maintain_id = maintain_id;
	}
	public int getSingle_quantity() {
		return single_quantity;
	}
	public void setSingle_quantity(int single_quantity) {
		this.single_quantity = single_quantity;
	}
	public int getSingle_grade() {
		return single_grade;
	}
	public void setSingle_grade(int single_grade) {
		this.single_grade = single_grade;
	}
	public int getMultiple_quantity() {
		return multiple_quantity;
	}
	public void setMultiple_quantity(int multiple_quantity) {
		this.multiple_quantity = multiple_quantity;
	}
	public int getMultiple_grade() {
		return multiple_grade;
	}
	public void setMultiple_grade(int multiple_grade) {
		this.multiple_grade = multiple_grade;
	}
	public int getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}
	public int getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(int totaltime) {
		this.totaltime = totaltime;
	}
	public String getMaintain_time() {
		return maintain_time;
	}
	public void setMaintain_time(String maintain_time) {
		this.maintain_time = maintain_time;
	}
	public Maintaintestpaper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Maintaintestpaper(int maintain_id, int single_quantity, int single_grade, int multiple_quantity,
			int multiple_grade, int totalscore, int totaltime, String maintain_time) {
		super();
		this.maintain_id = maintain_id;
		this.single_quantity = single_quantity;
		this.single_grade = single_grade;
		this.multiple_quantity = multiple_quantity;
		this.multiple_grade = multiple_grade;
		this.totalscore = totalscore;
		this.totaltime = totaltime;
		this.maintain_time = maintain_time;
	}
	
	

}
