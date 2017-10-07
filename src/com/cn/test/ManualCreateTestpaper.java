package com.cn.test;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.cn.dao.ChoicebankDao;
import com.cn.dao.DepartmentDao;
import com.cn.dao.MaintainTestpaperDao;
import com.cn.dao.TestpaperDao;
import com.cn.entity.Choicebank;
import com.cn.entity.Department;
import com.cn.entity.Maintaintestpaper;
import com.cn.questionbank.InputchoicebankAction;
import com.opensymphony.xwork2.ActionContext;

/**
 * 手动出题，用excel导入，，
 * 要与规定的MaintainTestpaper一致，不然查询的就不准确了
 * 如果想自由指定题目数量和分数，则一张试卷表不够用，暂时就不拆开了，用一张表
 * */
public class ManualCreateTestpaper {
	private String test_name;
	private int dep_id;
	private String start_time;
	private String end_time;
	
	private File choiceupload;

	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();

	DepartmentDao depdao = new DepartmentDao();
	TestpaperDao testpaperdao = new TestpaperDao();
	ChoicebankDao choicedao = new ChoicebankDao();
	MaintainTestpaperDao maintaindao = new MaintainTestpaperDao();
	
	
	public String createManualtest(){
		
		//调用InputchoicebankAction类中的导入题目的方法，因为是公用的方法，所以部门其实有多余，有重复，试卷里的每道题要写上部门，暂时就这样，再写一个方法没什么必要
		InputchoicebankAction input = new InputchoicebankAction();
		boolean flag = input.inputFunction(choiceupload);
		
		if(!flag){ //如果导入成功
			//1.先将题目插入题库，在根据相应的题目设定的条件查出相应的id,将id拼凑，插入到试卷表，在增加一个试卷预览的功能吧

			//查询单选和多选设定的数量
			Maintaintestpaper maintaintest =  maintaindao.selectToCreatepaper();
			
			//试卷预览
			int m_id = (int) session.get("m_id"); 
			Object[] obj =  testpaperdao.inputmanualtest(m_id,maintaintest,test_name,dep_id,start_time,end_time);
			List<Choicebank> singlelist = (List<Choicebank>) obj[0];
			List<Choicebank> mutiplelist = (List<Choicebank>) obj[1];
			
			
			request.put("maintaintest", maintaintest);
			request.put("singlelist", singlelist);
			request.put("mutiplelist", mutiplelist);
			
			
		}else{
			//导入失败就提示重新导入,就直接return 
			request.put("inputerror", "<script>alert('导入失败，请重新检查试卷格式是否正确!');</script>");
			return "manualtest";
		}
		
		
		// -------------再把部门也查一下，免得又转发麻烦------------------
		List<Department> deplist = depdao.selectAllDeparment();
		request.put("deplist", deplist);
		
		
		return "manualtest";
	}
	
	
	
	
	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

	public int getDep_id() {
		return dep_id;
	}

	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public File getChoiceupload() {
		return choiceupload;
	}

	public void setChoiceupload(File choiceupload) {
		this.choiceupload = choiceupload;
	}



}
