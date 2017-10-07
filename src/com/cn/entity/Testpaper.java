package com.cn.entity;
/**试卷*/
public class Testpaper {
	private int test_id;
	private String test_name;
	private int maintain_id;
	private String single_content;
	private String multiple_content;
	private String start_time;
	private String end_time;
	private int dep_id;
	private String test_time;
	private int m_id; //加上mid是为了做试卷的预览效果
	
	
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
	public int getMaintain_id() {
		return maintain_id;
	}
	public void setMaintain_id(int maintain_id) {
		this.maintain_id = maintain_id;
	}
	public String getSingle_content() {
		return single_content;
	}
	public void setSingle_content(String single_content) {
		this.single_content = single_content;
	}
	public String getMultiple_content() {
		return multiple_content;
	}
	public void setMultiple_content(String multiple_content) {
		this.multiple_content = multiple_content;
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
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public String getTest_time() {
		return test_time;
	}
	public void setTest_time(String test_time) {
		this.test_time = test_time;
	}
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public Testpaper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Testpaper(int test_id, String test_name, int maintain_id, String single_content, String multiple_content,
			String start_time, String end_time, int dep_id, String test_time, int m_id) {
		super();
		this.test_id = test_id;
		this.test_name = test_name;
		this.maintain_id = maintain_id;
		this.single_content = single_content;
		this.multiple_content = multiple_content;
		this.start_time = start_time;
		this.end_time = end_time;
		this.dep_id = dep_id;
		this.test_time = test_time;
		this.m_id = m_id;
	}
	
	

}
