package com.users.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.cn.dao.UsersDao;

/**
 *直接通过ajax来验证用户名和密码，所以不用配置struts.xml,也不要return,方法为void
 *直接通过流来返回
 *
 *注意:ajax要通过HttpServletRequest来接收，用非耦合的方式得不到
 */
public class CheckActive {
	
	//注意：ajax要通过耦合的方式获取
	HttpServletRequest request = ServletActionContext.getRequest();
	
	//数据传递走时，通过流来传递，而不是request
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public void checkusers(){

		//接收参数
		String uname = (String) request.getParameter("ajaxuname");
		String upass = (String) request.getParameter("ajaxupass");

		UsersDao dao = new UsersDao();
		boolean flag = dao.login(uname, upass);

		//通过流来传递
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter pw = response.getWriter();
			if(flag){
				pw.print("<font color='#EE0000' size='2'>*用户名或密码不正确</font>");//此时只是传的只是一个字符串
			}else{
				pw.print("<font color='gray' size='2'>√</font>");
			}
				
			
			pw.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

