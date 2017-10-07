package com.cn.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.cn.dao.ChoicebankDao;
import com.cn.dao.DepartmentDao;
import com.cn.dao.MaintainTestpaperDao;
import com.cn.dao.TestpaperDao;
import com.cn.entity.Choicebank;
import com.cn.entity.Maintaintestpaper;
import com.cn.entity.Testpaper;
import com.opensymphony.xwork2.ActionContext;

/**
 *
 * 后台管理员自动生成试卷autoCreatetest()，会存入数据库
 * 和 用户模拟考试userMockExamination()，不存入数据库
 */
public class AutoCreateTestpaper {
	private String test_name;
	private int dep_id;
	private String start_time;
	private String end_time;

	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();

	DepartmentDao depdao = new DepartmentDao();
	TestpaperDao testpaperdao = new TestpaperDao();
	ChoicebankDao choicedao = new ChoicebankDao();
	MaintainTestpaperDao maintaindao = new MaintainTestpaperDao();
	
	/**用户模拟考试*/
	public String userMockExamination(){
		//根据用户id 获取部门 好去抽相应的题
		int u_id = (int) session.get("u_id");
		int mockdepid = choicedao.seachDepidByUid(u_id);
		
		// 调用方法，获取需要的数据
		Object[] objID = this.autoGetid(mockdepid);
		Maintaintestpaper maintainTest = (Maintaintestpaper) objID[0];
		List<Integer> singlelist = (List<Integer>) objID[1];
		List<Integer> multiplelist = (List<Integer>) objID[2];

		// 直接模拟考试，去将答案和题目都查出来
		List<Choicebank> mysinglelist = choicedao.selectBank(singlelist);
		List<Choicebank> mymutiplelist = choicedao.selectBank(multiplelist);

		// 放入request中
		request.put("mysinglelist", mysinglelist);
		request.put("mymutiplelist", mymutiplelist);
		//maintainTest也放入request范围
		request.put("maintainTest", maintainTest);

		String singleStandard = "";
		for(int i=0;i<mysinglelist.size();i++){
			singleStandard += mysinglelist.get(i).getChoice_answer();
			//判断一下，最后一个不加分号
			if(i != mysinglelist.size()-1) singleStandard += ",";//每个id后面都加一个分号
		}
		
		String multipleStandard = "";
		for(int i=0;i<mymutiplelist.size();i++){
			multipleStandard += mymutiplelist.get(i).getChoice_answer();
			//判断一下，最后一个不加分号
			if(i != mymutiplelist.size()-1) multipleStandard += ",";//每个id后面都加一个分号
		}
		
		//把答案放入session中
		session.put("singleStandard", singleStandard);
		session.put("multipleStandard", multipleStandard);
		
		//还有一些补充
		
		
		
		return "usermock";
	}
	

	/**后台自动生成试卷*/ 
	public String autoCreatetest() {
		//调用方法
		 Object[] objID = this.autoGetid(dep_id);//此处dep_id是struts自动赋值的
		 Maintaintestpaper maintainTest = (Maintaintestpaper) objID[0];
		 List<Integer> singlelist = (List<Integer>) objID[1];
		 List<Integer> multiplelist = (List<Integer>) objID[2];
		 

		// 所有抽取的id已经得到，把它们组合到一起就可插入试题表了
		String single_content = singlelist.get(0) + "";// 格式1,2,3,4,5,6....
		for (int i = 1; i < singlelist.size(); i++) {
			single_content += "," + singlelist.get(i);
		}

		String multiple_content = multiplelist.get(0) + "";
		for (int i = 1; i < multiplelist.size(); i++) {
			multiple_content += "," + multiplelist.get(i);
		}
		
		
		//从session中获取m_id,试卷预览的时候用的上
		int m_id = (int) session.get("m_id");
		
		//插入试卷
		Testpaper testpaper = new Testpaper();
		testpaper.setTest_name(test_name);
		testpaper.setMaintain_id(maintainTest.getMaintain_id());
		testpaper.setSingle_content(single_content);
		testpaper.setMultiple_content(multiple_content);
		testpaper.setStart_time(start_time);
		testpaper.setEnd_time(end_time);
		testpaper.setDep_id(dep_id);
		testpaper.setM_id(m_id);
		
		boolean flag = testpaperdao.insertTest(testpaper);
		
		/*判断上面的试题是否插入成功，若成功就直接利用上面获取的id的list集合，去题库中查询题目到页面显示*/
		if(!flag){
			//直接利用上面得到的list集合，单选singlelist，多选multiplelist
			//遍历集合，去题库中查询题目
			List<Choicebank> mysinglelist = choicedao.selectBank(singlelist);
			List<Choicebank> mymutiplelist = choicedao.selectBank(multiplelist);
			
			//放入request中
			request.put("mysinglelist", mysinglelist);
			request.put("mymutiplelist", mymutiplelist);
			//有多少道题，每题多少分
			request.put("singlequantity", maintainTest.getSingle_quantity());
			request.put("singlegrade", maintainTest.getSingle_grade());
			request.put("multiplequantity", maintainTest.getMultiple_quantity());
			request.put("multiplegrade", maintainTest.getMultiple_grade());
			
		}else{
			//不成功就直接提示错误
			request.put("errortest", "<script>alert('试卷生成失败，请重新生成！');</script>");
		}
		
		return "autotest";
	}
	
	
	
	
	
	

	/** 提出来单独写一个方法,得到抽取的id */
	public Object[] autoGetid(int getdepid) {
		//初始化
		Object[] objID = new Object[3];
		
		// 先从题库中抽取符合条件的所有试题的id
		Object[] obj = choicedao.getallchoiceBycondition(getdepid);
		List<Integer> singlelist = (List<Integer>) obj[0];
		List<Integer> multiplelist = (List<Integer>) obj[1];

		// 去Maintaintestpaper表中查询，需要抽取多少道题
		Maintaintestpaper maintaintest = maintaindao.selectToCreatepaper();

		// 单选，随机数
		int[] singlearray = this.getrandoms(singlelist.size(), maintaintest.getSingle_quantity());
		// 声明一个list放匹配后的id,也就是抽取的
		List<Integer> singlelist2 = new ArrayList<Integer>();

		// 用产生的随机数去匹配list中的索引,即用get(singlearray[i])替换get(i)
		for (int i = 0; i < singlearray.length; i++) {
			singlelist2.add(singlelist.get(singlearray[i]));
		}

		

		// 多选
		int[] multiplearray = this.getrandoms(multiplelist.size(), maintaintest.getMultiple_quantity());
		List<Integer> multiplelist2 = new ArrayList<Integer>();
		for (int i = 0; i < multiplearray.length; i++) {
			multiplelist2.add(multiplelist.get(multiplearray[i]));
		}

		//给object[] 赋值
		objID[0] = maintaintest; //放一个对象，到时要用到里面的一些参数
		objID[1] = singlelist2;
		objID[2] = multiplelist2;
		
		
		return objID;

	}

	/** 产生不重复的随机数,用产生的随机数去匹配list中的索引 */
	public int[] getrandoms(int length, int number) { // 要从length中抽取number个不重复的随机数，length是单/多选题总个数，number是试卷中单/多选题个数
		int[] a = new int[number];
		Random random = new Random();
		// 从getidlist.size()中生成number个不重复的随机数
		for (int i = 0; i < number; i++) {
			a[i] = random.nextInt(length);// 注意不能加1 //例random.nextInt(9)表示0-8

			// 判断：若已重复，就回去重新生成,与以前生成的进行比较，所以是j<i
			for (int j = 0; j < i; j++) {
				if (a[i] == a[j]){
					i--;
					break; //加上break,因为前面最多只可能有一个与它一样
				}
				
			}

		}

		/*
		 * //输出看看 for(int i=0;i<number;i++){ System.out.print(a[i]+" "); }
		 * System.out.println();
		 */

		return a;
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

}
