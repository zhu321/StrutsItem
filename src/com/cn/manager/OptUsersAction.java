package com.cn.manager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cn.dao.UsersDao;
import com.cn.entity.Users;
import com.opensymphony.xwork2.ActionContext;

/**操作用户，包括添加、删除等*/
public class OptUsersAction {
	private Users operusers;//u_name,u_pass,u_sex,u_birth,dep_id,edu_id,major_id
	//选择删除
	private String[] checkuser;
	

	//放到外面公用
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	UsersDao dao = new UsersDao();

	/**选择删除用户*/
	public String delUsersBySelect(){
		
		 List<Integer> uidlist = new ArrayList<Integer>();
		 
		 for(int i=0; i<checkuser.length;i++){
			 uidlist.add(Integer.parseInt(checkuser[i]));
		 }
		
		dao.delusersByChecked(uidlist);
		
		return "delusersBychecked";
	}
	
	/**删除单个用户*/
	public String delOneusers(){
		dao.delOneUsers(operusers.getU_id());
		
		return "deloneusers";
	}
	
	/**修改用户1，根据id查询出用户*/
	public String selectOneUsers(){
		Users editusers1 = dao.selectOneUsers(operusers.getU_id());
		request.put("editusers1", editusers1);
		
		return "selectoneusers";
	}
	
	/**修改用户2，真正的修改*/
	public String updateUsers(){
		dao.updateUsers(operusers);
		
		return "updateusers";
	}
	
	
	
	/**添加用户*/
	public String addusers(){
		
		boolean flag = dao.addusers(operusers);
		if(!flag){
			request.put("addusersmessage", "<script>alert('添加成功');</script>");
		}else{
			request.put("addusersmessage", "<script>alert('添加失败，请重新添加');</script>");
		}
			
		
		return "addusers";
	}
	

	
	public Users getOperusers() {
		return operusers;
	}

	public void setOperusers(Users operusers) {
		this.operusers = operusers;
	}

	public String[] getCheckuser() {
		return checkuser;
	}

	public void setCheckuser(String[] checkuser) {
		this.checkuser = checkuser;
	}

}
