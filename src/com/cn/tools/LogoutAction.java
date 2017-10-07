package com.cn.tools;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

/**
 *
 */
public class LogoutAction {
	
	Map<String, Object> session = ActionContext.getContext().getSession();
	
	//管理员注销
	public String managerlogout(){
		
		session.remove("m_id");
		
		return "mlogout";
	}
	
	
	//用户注销
	public String usreslogout(){
		session.remove("u_id");
		
		return "ulogout";
	}
	

}
