package com.cn.entity;

/**部门、学历、专业、激活状态、激活时间、最后登录时间、登录次数*/
public class Users {
	private int u_id;
	private String u_name;
	private String u_pass;
	private String u_sex;
	private String u_birth;
	private int dep_id;
	private int edu_id;
	private int major_id;
	private int active_state;
	private String active_time;
	private String last_login;
	private int login_times;
	
	@Override
	public String toString() {
		return "Users [u_id=" + u_id + ", u_name=" + u_name + ", u_pass=" + u_pass + ", u_sex=" + u_sex + ", u_birth="
				+ u_birth + ", dep_id=" + dep_id + ", edu_id=" + edu_id + ", major_id=" + major_id + ", active_state="
				+ active_state + ", active_time=" + active_time + ", last_login=" + last_login + ", login_times="
				+ login_times + "]";
	}
	public Users(int u_id, String u_name, String u_pass, String u_sex, String u_birth, int dep_id, int edu_id,
			int major_id, int active_state, String active_time, String last_login, int login_times) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pass = u_pass;
		this.u_sex = u_sex;
		this.u_birth = u_birth;
		this.dep_id = dep_id;
		this.edu_id = edu_id;
		this.major_id = major_id;
		this.active_state = active_state;
		this.active_time = active_time;
		this.last_login = last_login;
		this.login_times = login_times;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public String getU_birth() {
		return u_birth;
	}
	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public int getEdu_id() {
		return edu_id;
	}
	public void setEdu_id(int edu_id) {
		this.edu_id = edu_id;
	}
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}
	public int getActive_state() {
		return active_state;
	}
	public void setActive_state(int active_state) {
		this.active_state = active_state;
	}
	public String getActive_time() {
		return active_time;
	}
	public void setActive_time(String active_time) {
		this.active_time = active_time;
	}
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}
	public int getLogin_times() {
		return login_times;
	}
	public void setLogin_times(int login_times) {
		this.login_times = login_times;
	}
	
	
	

}
