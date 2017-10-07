package com.cn.test;

import java.util.List;
import java.util.Map;

import com.cn.dao.UserscoreDao;
import com.cn.entity.Userscore;
import com.opensymphony.xwork2.ActionContext;

public class AllUsersscore {
	//放外面公用
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	UserscoreDao scoredao = new UserscoreDao();
	

	/**暂时先把所有的用户成绩查出来*/
	public String selAllscore(){
		List<Userscore> scorelist = scoredao.getAllscore();
		request.put("scorelist", scorelist);
		
		return "allscore";
	}
	
	/**按条件查询所有用户的成绩*/
	public String selectAllscoreByCondition(){
		
		
		return "allscoreCondition";
	}
	
	

}
