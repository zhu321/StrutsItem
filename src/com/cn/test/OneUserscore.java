package com.cn.test;

import java.util.List;
import java.util.Map;

import com.cn.dao.UserscoreDao;
import com.cn.entity.Userscore;
import com.opensymphony.xwork2.ActionContext;

/**用户个人成绩*/
public class OneUserscore {
	private int test_id;
	private String testtime1;
	private String testtime2;
	
	// 放外面公用
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();
	UserscoreDao scoredao = new UserscoreDao();
	
	/**暂时不做条件查询*/
	public String getmyscore(){
		int u_id = (int) session.get("u_id");
		List<Userscore> myscorelist = scoredao.getmyscore(u_id);
		request.put("myscorelist", myscorelist);
		
		return "myscore";
	}

}
