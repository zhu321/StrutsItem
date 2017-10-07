package com.cn.manager;

import java.util.Map;

import com.cn.dao.UsersDao;
import com.opensymphony.xwork2.ActionContext;

/**
 * 将能查询的条件从数据库中查出来，例：学历、部门、专业
 * */
public class UsersConditionAction {
	private int conditionFlag;
	

	//放到外面公用
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();
	
	UsersDao dao = new UsersDao();
	
	/**查询出条件*/
	public String getconditions(){
		
		Object[] conditions = dao.getconditions();
		
		//放入3个集合放入request中
		request.put("deplist", conditions[0]);
		request.put("edulist", conditions[1]);
		request.put("majorlist", conditions[2]);
		
		request.put("uflag", "1");//给一个标识符
		
		//根据不同参数到不同的页面,1:addusers.jsp
		if(conditionFlag==1){
			
			return "adduserscondition";
		}else{
			return "condition"; //userslist.jsp
		}
		
		
	}
	

	public int getConditionFlag() {
		return conditionFlag;
	}

	public void setConditionFlag(int conditionFlag) {
		this.conditionFlag = conditionFlag;
	}
	
	

}
