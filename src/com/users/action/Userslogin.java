package com.users.action;

import java.util.Map;

import com.cn.dao.UsersDao;
import com.cn.entity.Users;
import com.opensymphony.xwork2.ActionContext;

public class Userslogin {
	private String uname;
	private String upass;
	private String code;
	

	//放外面公用
	Map<String , Object> session = ActionContext.getContext().getSession();
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	
	UsersDao dao = new UsersDao();
	
	/**先判断验证码，再判断用户是否存在，然后再判断是否激活*/
	public String login(){
		String safecode = (String) session.get("safecode");
		
		//获取验证码之后就可将其从session中移除了，不要移除，点击返回后会报空指针
//		session.remove("safecode");
		//一直报空指针的原因是直接点了浏览器的返回，此时验证码已经从session中移除了，还显示的是以前的图片，现在的还为空
		
		
		if((code.toUpperCase()).equals(safecode.toUpperCase())){
			
			//判断用户是否存在
			boolean flag = dao.login(uname, upass);
			if(!flag){
				//判断是否激活
				Users users = dao.checkactive(uname);//若激活，falg=false;

				if(users == null){
					//未激活
					request.put("noactive", "<script>alert('您的账户未激活,请激活');</script>");
					return "active";
				}
				
				//将uid放入session中
				session.put("u_id", users.getU_id());
				
				return "loginok";//用户名和密码正确，并且激活了
			}else{
				request.put("errorlogin", "<script>alert('用户名或密码错误');</script>");
				return "error";
			}
			
			
		}else{
			request.put("errorcode", "<font color='red'>验证码错误</font>");
			return "error";
		}
		
		
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}


}
