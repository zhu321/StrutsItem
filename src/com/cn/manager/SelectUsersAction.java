package com.cn.manager;

import java.util.List;
import java.util.Map;

import com.cn.dao.UsersDao;
import com.cn.entity.Users;
import com.opensymphony.xwork2.ActionContext;

/**
 * 模型驱动 加 一些额外的条件
 *
 * 条件汇总：users(u_id,dep_id,edu_id,major_id,u_name,u_sex), u_birth1,
 * u_birth2,active_time1,active_time2
 */
public class SelectUsersAction {
	private Users users;
	private String u_birth1;
	private String u_birth2;
	private String active_time1;
	private String active_time2;
	
	/*
	 * 不转发了，所以要将 显示的条件 再写一遍
	 * 强调：
	 * 跳转 用int类型，当页面禁用js时，会有一个等于0时的bug,所以要String类型
	 * 分页用int类型，可以在页面通过jstl来控制，不会有问题
	 * 
	 * */
	// 分页
	private int page; // 说明：int类型的变量，当该变量还不存在时，默认给它赋为0
	// 跳转到多少页
	private String skipPage;

	// 放到外面公用
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();

	UsersDao dao = new UsersDao();

	/**按条件查询用户*/
	public String selectusers() {
		
		//声明数组用来存放条件
		Object[] obj = new Object[5];
		obj[0] = users;
		obj[1] = u_birth1;
		obj[2] = u_birth2;
		obj[3] = active_time1;
		obj[4] = active_time2;
		
		
		/**
		 * 规范一下步骤：
		 * 1.先求出最大页
		 * 2.判断时查询，还是上下页，又或者是"跳转"
		 * 3.补充：一定要注意判断条件
		 */
		
		int maxpage = 0; 
		
		//满足条件的总人数
		int total = dao.getUsersTotalByCondition(obj);
		if(total % 5 == 0 ){
			maxpage = total / 5;
		}else{
			maxpage = total/5 + 1;
		}
		
		
		//分页，，注意判断条件很关键，要与下面的"跳转"做区分，还要去是查询，还是上下页
		if(page == 0){ //表示还不存在page这个参数，有两种情况，第一：查询的时候 ；第二：点击的是"跳转"
			
			page = 1;//第一次来默认显示第一页
		}else{
			//进行分页,此处不进行判断了，在页面进行规范
			//什么也不干，因为page已经被struts框架自动赋值了
			
		}
		
		//分页 与 跳转 是不会冲突的
		
		//跳转到多少页,,//若skipPage==null表示还不存在skipPage这个参数，有两种情况，第一：查询的时候 ；第二：分页时
		if(skipPage != null){
			int mypage = Integer.parseInt(skipPage);
			if(mypage < 1){
				page = 1;
			}else if(mypage > maxpage){
				page = maxpage;
			}else{
				page = mypage;
			}
		}
		

		List<Users> userslist = dao.selectUsersByCondition(obj, page);
		
		
		//将所需的所有参数放入request范围内
		request.put("userslist", userslist);
		request.put("total", total);
		request.put("maxpage", maxpage);
		request.put("page", page);
		
		//----------------------显示的条件------------------------------
		Object[] conditions = dao.getconditions();
		
		//放入3个集合放入request中
		request.put("deplist", conditions[0]);
		request.put("edulist", conditions[1]);
		request.put("majorlist", conditions[2]);
		
		
		return "selectusers";
	}

	
	
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getU_birth1() {
		return u_birth1;
	}

	public void setU_birth1(String u_birth1) {
		this.u_birth1 = u_birth1;
	}

	public String getU_birth2() {
		return u_birth2;
	}

	public void setU_birth2(String u_birth2) {
		this.u_birth2 = u_birth2;
	}

	public String getActive_time1() {
		return active_time1;
	}

	public void setActive_time1(String active_time1) {
		this.active_time1 = active_time1;
	}

	public String getActive_time2() {
		return active_time2;
	}

	public void setActive_time2(String active_time2) {
		this.active_time2 = active_time2;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSkipPage() {
		return skipPage;
	}

	public void setSkipPage(String skipPage) {
		this.skipPage = skipPage;
	}

}
