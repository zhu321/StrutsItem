package com.cn.entity;

public class Manager {
	private int m_id;
	private String m_name;
	private String m_pass;
	
	public Manager(int m_id, String m_name, String m_pass) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_pass = m_pass;
	}
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	

}
