package com.users.action;

import java.util.Map;

import com.cn.dao.UsersDao;
import com.opensymphony.xwork2.ActionContext;

public class UsersActive {
	private String uname;
	private String upass;
	private String newpass;

	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");

	public String active() {
		UsersDao dao = new UsersDao();
		boolean flag = dao.active(newpass, uname, upass);
		if(flag){
			request.put("activefalse", "<script>alert('激活失败，请重新激活');</script>");
			return "activefalse";
		}

		request.put("activesuccess", "<script>alert('激活成功，请登录');</script>");
		return "activeok";
	}

	
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

}
