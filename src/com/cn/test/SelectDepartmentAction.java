package com.cn.test;

import java.util.List;
import java.util.Map;

import com.cn.dao.DepartmentDao;
import com.cn.entity.Department;
import com.opensymphony.xwork2.ActionContext;

/**
 * 查询出部门，生成试卷时要用，到时条件回显时用转发
 * 
 * 和按条件查询
 */
public class SelectDepartmentAction {
	private Department selectdepart;
	private int flag;//标识常量
	
	//放到外面公用
	DepartmentDao dao = new DepartmentDao();
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	
	/**
	 * 查询所有的部门
	 * flag标识常量
	 * */
	public String selectdepart(){
		List<Department> deplist = dao.selectAllDeparment();
		request.put("deplist", deplist);
		
		if(flag == 1){
			return "selectopertest";
		}else if(flag == 2){
			return "seletoperscore";
		}else if(flag==3){
			return "seletomanualtest";
		}else{
			
		}
		
		return "selectdeps";
	}
	


	/**按条件查询*/
	public String selectDep(){

		List<Department>  deplist = dao.selectDeparment(selectdepart);
		
		request.put("deplist", deplist);
		
		return "selectdep";		
	}
	
	
	public Department getSelectdepart() {
		return selectdepart;
	}

	public void setSelectdepart(Department selectdepart) {
		this.selectdepart = selectdepart;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}


}
