package com.cn.entity;

public class Choicebank {
	private int choice_id;
	private String choice_content;
	private String choice_A;
	private String choice_B;
	private String choice_C;
	private String choice_D;
	private String choice_type;
	private String choice_answer;
	private String choice_department;
	private int m_id;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}


	public Choicebank(int choice_id, String choice_content, String choice_A, String choice_B, String choice_C,
			String choice_D, String choice_type, String choice_answer, String choice_department, int m_id) {
		super();
		this.choice_id = choice_id;
		this.choice_content = choice_content;
		this.choice_A = choice_A;
		this.choice_B = choice_B;
		this.choice_C = choice_C;
		this.choice_D = choice_D;
		this.choice_type = choice_type;
		this.choice_answer = choice_answer;
		this.choice_department = choice_department;
		this.m_id = m_id;
	}
	public Choicebank() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getChoice_id() {
		return choice_id;
	}
	public void setChoice_id(int choice_id) {
		this.choice_id = choice_id;
	}
	public String getChoice_content() {
		return choice_content;
	}
	public void setChoice_content(String choice_content) {
		this.choice_content = choice_content;
	}
	public String getChoice_A() {
		return choice_A;
	}
	public void setChoice_A(String choice_A) {
		this.choice_A = choice_A;
	}
	public String getChoice_B() {
		return choice_B;
	}
	public void setChoice_B(String choice_B) {
		this.choice_B = choice_B;
	}
	public String getChoice_C() {
		return choice_C;
	}
	public void setChoice_C(String choice_C) {
		this.choice_C = choice_C;
	}
	public String getChoice_D() {
		return choice_D;
	}
	public void setChoice_D(String choice_D) {
		this.choice_D = choice_D;
	}
	public String getChoice_type() {
		return choice_type;
	}
	public void setChoice_type(String choice_type) {
		this.choice_type = choice_type;
	}
	public String getChoice_answer() {
		return choice_answer;
	}
	public void setChoice_answer(String choice_answer) {
		this.choice_answer = choice_answer;
	}
	public String getChoice_department() {
		return choice_department;
	}
	public void setChoice_department(String choice_department) {
		this.choice_department = choice_department;
	}
	
	

}
