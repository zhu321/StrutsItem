package com.cn.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cn.dao.ChoicebankDao;
import com.cn.dao.MaintainTestpaperDao;
import com.cn.dao.TestpaperDao;
import com.cn.dao.UserscoreDao;
import com.cn.entity.Choicebank;
import com.cn.entity.Maintaintestpaper;
import com.cn.entity.Testpaper;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户考试 先查询出有哪些考试
 * 注意：不能通过(int) request.get("testid")得到从页面超链接中传来的参数
 * 
 * 1.获取用户id,查出它的部门 2.根据部门去试卷表中查询是否有考试，还要判断下时间 3.去试卷表中将题目id查出来 4.根据id去题库中查题目和答案
 */
public class UsersTestAction {
	private int testid;


	// 放到外面公用
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");

	Map<String, Object> session = ActionContext.getContext().getSession();

	UserscoreDao userscoredao = new UserscoreDao();
	ChoicebankDao bankdao = new ChoicebankDao();
	TestpaperDao paperdao = new TestpaperDao();
	MaintainTestpaperDao maintaindao = new MaintainTestpaperDao();

	// 获取用户id,放到外面
	int u_id = (int) session.get("u_id");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 注意此处的M要大写

	/** 先查询出有哪些考试 */
	public String showusertest() {
		Date date = new Date();

		String today = sdf.format(date);// 此处的时间是去数据库查询用的，所以时间应该要更详细

		// 根据id找该部门，然后判断是否有考试
		int depid = bankdao.seachDepidByUid(u_id);
		List<Testpaper> testlist = paperdao.testpaper(depid, today,u_id);
		
		request.put("testlist", testlist);

		// 判断是否有试卷
		if (testlist.isEmpty()) {

			// 没有试卷，就提醒还没到考试时间,,,,再显示一下最近一周的考试安排吧
			List<Testpaper> errortimelist = paperdao.currentWeekTestpaper(depid);
			request.put("errortimelist", errortimelist);

			return "nopaper";
		}

		
		return "showtest";
	}

	
	/**考试*/
	public String usertest() {
		Date date = new Date();

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");// 注意此处的M要大写
		String date1 = sdf2.format(date);
		request.put("formateDate", date1); // 此处的时间是放到页面上显示的
		
		// 根据testid获取testpaper
		Testpaper testpaper = paperdao.getTestpaperByid(testid);

		// 试卷名称要在页面显示
		request.put("testname", testpaper.getTest_name());

		// 从试卷中得到单选和多选题字段
		String singles = testpaper.getSingle_content();
		String multiples = testpaper.getMultiple_content();

		// 将id拆分出来
		String[] str1 = singles.split(",");
		String[] str2 = multiples.split(",");

		List<Integer> singlelist = new ArrayList<Integer>();
		List<Integer> multiplelist = new ArrayList<Integer>();

		for (int i = 0; i < str1.length; i++) {
			singlelist.add(Integer.parseInt(str1[i]));
			// 输出题目id看看
			// System.out.print(singlelist.get(i)+" ");
		}

		// System.out.println();
		for (int i = 0; i < str2.length; i++) {
			multiplelist.add(Integer.parseInt(str2[i]));
			// 输出题目id看看
			// System.out.print(multiplelist.get(i)+" ");
		}

		// 去题库匹配题
		List<Choicebank> usinglelist = bankdao.selectBank(singlelist);
		List<Choicebank> umultiplelist = bankdao.selectBank(multiplelist);

		//将题目放入request范围
		request.put("usinglelist", usinglelist);
		request.put("umultiplelist", umultiplelist);

		// 答案如何处理？
		// 答案不能放到页面隐藏域中保存，容易被作弊的人发现
		// 我的解决方案：答案放到session里，等考完试就从session中移除，，不同用户的sessionID是不一样的，所以不会有冲突
		String singleStandard = "";
		
		 //foreach方式差一点，获取不到索引 
		/*for (Choicebank_xxx choicebank : usinglelist) {
			answers += choicebank.getChoice_answer();
		}*/
		 

		for (int i = 0; i < usinglelist.size(); i++) {
			singleStandard += usinglelist.get(i).getChoice_answer();
			// 判断一下，最后一个不加分号
			if (i != usinglelist.size() - 1)
				singleStandard += ",";
		}
		System.out.println("singleStandard:" + singleStandard);


		String multipleStandard = "";
		for (int i = 0; i < umultiplelist.size(); i++) {
			multipleStandard += umultiplelist.get(i).getChoice_answer();
			// 判断一下，最后一个不加分号
			if (i != umultiplelist.size() - 1)
				multipleStandard += ",";
		}
		System.out.println("multipleStandard:" + multipleStandard);

		
		// 将答案放入session
		session.put("singleStandard", singleStandard);
		session.put("multipleStandard", multipleStandard);
		
		
		//倒计时声明在外面
		int countdown = 0;
		
		// 将考试总时间查询出来
		MaintainTestpaperDao maintaindao = new MaintainTestpaperDao();
		Maintaintestpaper maintaintest = maintaindao.getscorecondition(testpaper.getTest_id());
		
		//判断用户是否在考试，就是去userscore中查看一下该用户在不在，带上一个时间限制(限制在今天)，查的就少一些
		int flag = userscoredao.selectusers(testid,u_id);
		if(flag==0){ //表示还没有考试
			// 此时向userscore插入一条数据

			// select unix_timestamp(now());
			// java中Date类中的getTime()是获取时间戳的，java中生成的时间戳精确到毫秒级别，
			// 而unix中精确到秒级别，所以通过java生成的时间戳需要除以1000
			Date testdate = new Date();
			int time = (int) (testdate.getTime() / 1000);

			
			int test_end = time + maintaintest.getTotaltime()*60; //注意maintaintest.getTotaltime()单位是分钟，要转化为秒
			// 考试前 先插入一条记录到userscore表
			UserscoreDao scoredao = new UserscoreDao();
			//把上面的日期格式化一下，不然插入数据库会有问题
			String now = sdf.format(testdate);
			scoredao.startInsert(u_id, testpaper.getTest_id(), now, test_end);

			
			//给倒计时赋值
			countdown = maintaintest.getTotaltime() * 60; //分钟转为秒

			
		}else{
			//正在考试，而且在刷新页面，此时要控制倒计时继续，就是重新计算一下倒计时
			Date nowtime = new Date();
			int now = (int)(nowtime.getTime()/1000);
			countdown = flag - now; //注意：flag - now单位是秒
			
		}
		

		//将maintaintest放入request中
		request.put("maintaintest",maintaintest);
		//倒计时
		request.put("countdown", countdown);
		
		return "usertest";
	}
	

	public int getTestid() {
		return testid;
	}

	public void setTestid(int testid) {
		this.testid = testid;
	}

}
