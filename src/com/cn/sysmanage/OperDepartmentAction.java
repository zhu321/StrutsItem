package com.cn.sysmanage;

import java.util.List;
import java.util.Map;

import com.cn.dao.DepartmentDao;
import com.cn.entity.Department;
import com.opensymphony.xwork2.ActionContext;
/**
 *部门操作，增删改查
 */
public class OperDepartmentAction {
	private Department department;

	//放到外面公用
	DepartmentDao dao = new DepartmentDao();
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	
	
	
	/**修改*/
	public String updateDep(){
		dao.updateDepartment(department);
		
		return "updatedep";
	}
	
	/**删除,可能是删除，也可能是修改为'待定'*/
	public String deleteDep(){

		dao.delDepartment(department);
		
		return "deletedep";
	}
	
	/**添加部门*/
	public String addDep(){
		boolean flag = dao.addDepartment(department);
		if(!flag){
			request.put("adddepmessage", "<script>alert('添加成功！');</script>");
		}else{
			request.put("adddepmessage", "<script>alert('添加失败！');</script>");
		}
		
		return "adddep";
	}
	
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

}
