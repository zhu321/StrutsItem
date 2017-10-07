package com.cn.test;

import java.util.List;
import java.util.Map;

import com.cn.dao.DepartmentDao;
import com.cn.dao.TestpaperDao;
import com.cn.entity.ComTestpaper;
import com.cn.entity.Department;
import com.cn.entity.Testpaper;
import com.opensymphony.xwork2.ActionContext;
/**按条件查询试卷*/
public class SelectTestpaperAction {
	private Testpaper seltestpaper; 


	// 放到外面公用
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	DepartmentDao depdao = new DepartmentDao();
	TestpaperDao testpaperdao = new TestpaperDao();

	public String getTestpaperBycondition() {
		List<ComTestpaper> comtestlist = testpaperdao.selectTestBycondition(seltestpaper);
		request.put("comtestlist", comtestlist);
		
		//-------------再把部门也查一下，免得又转发麻烦------------------
		List<Department> deplist = depdao.selectAllDeparment();
		request.put("deplist", deplist);
		
		return "selecttest";
	}
	
	

	public Testpaper getSeltestpaper() {
		return seltestpaper;
	}

	public void setSeltestpaper(Testpaper seltestpaper) {
		this.seltestpaper = seltestpaper;
	}


}
