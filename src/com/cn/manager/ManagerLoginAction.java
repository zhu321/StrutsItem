package com.cn.manager;

import java.util.Map;

import com.cn.dao.ManagerDao;
import com.cn.entity.Manager;
import com.opensymphony.xwork2.ActionContext;

public class ManagerLoginAction {
	private String m_name;
	private String m_pass;
	
	//放到外面公用
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String , Object> session = ActionContext.getContext().getSession();
	
	//登录
	public String mlogin(){
		ManagerDao dao = new ManagerDao();
		Manager manager = dao.login(m_name, m_pass);
		
		
		if(manager != null){
			session.put("m_id", manager.getM_id());
			return "mloginok";
		}else{
			request.put("mloginerror", "<script>alert('用户名或密码错误！');</script>");
			
			return "mloginerror";
		}
		
		
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
