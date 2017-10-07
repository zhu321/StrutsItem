package com.cn.test;

import java.util.Map;

import com.cn.dao.MaintainTestpaperDao;
import com.cn.dao.UserscoreDao;
import com.cn.entity.Maintaintestpaper;
import com.cn.entity.Userscore;
import com.opensymphony.xwork2.ActionContext;

/**
 *判分，插入成绩表
 *从session中取出答案后，将之从session中移除
 */
public class AnswerAction {
	private String singleanswer;
	private String multipleanswer;
	private int testid; //试卷id

	//放到外面公用
	Map<String , Object> session = ActionContext.getContext().getSession();
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	
	
	//判分
	public String checkAnswer(){
		System.out.println("单选题："+singleanswer);
		System.out.println("多选题："+multipleanswer);
		
		//获取session中的答案
		String singleStandard = (String) session.get("singleStandard");
		String multipleStandard = (String) session.get("multipleStandard");
		
		//已经取出来了，可以移除了
		session.remove("singleStandard");
		session.remove("multipleStandard");
		
		//标准答案
		String[] danAnswers = singleStandard.split(",");
		String[] duoAnswers = multipleStandard.split(",");
		
		//用户答案
		String[] userSingle = singleanswer.split(",");
		String[] userMultiple = multipleanswer.split(",");
		
		//计分，count*分数
		int onecount = 0;
		for(int i=0;i<danAnswers.length;i++){
			//不要犯这种错if(danAnswers[i] == userSingle[i])
			if(danAnswers[i].equals(userSingle[i])) onecount++;
		}
		
		int twocount = 0;
		for(int i=0;i<duoAnswers.length;i++){
			if(duoAnswers[i].equals(userMultiple[i])) twocount++;
		}
		
		//将每题多少分，总分查出来就行了，有多少道题在上面就可计算出来
		MaintainTestpaperDao maintaindao = new MaintainTestpaperDao();
		Maintaintestpaper maintaintest = maintaindao.getscorecondition(testid);
		
		int singleScore = maintaintest.getSingle_grade();
		int multipleScore = maintaintest.getMultiple_grade();
		int totalScore = maintaintest.getTotalscore();
		
		//成绩列表
		int score = onecount * singleScore + twocount * multipleScore; //计算总分
		
		request.put("totalScore", totalScore);
		request.put("singleScore", singleScore);
		request.put("multipleScore", multipleScore);
		request.put("score", score);
		request.put("singletotal", danAnswers.length);
		request.put("onecount", onecount);
		request.put("error1", danAnswers.length-onecount);
		request.put("mutipletotal", duoAnswers.length);
		request.put("twocount", twocount);
		request.put("error2", duoAnswers.length-twocount);
		
		
		//更新成绩表
		UserscoreDao scoredao = new UserscoreDao();
		int u_id = (int)session.get("u_id");
		
		//new 一个新对象
		Userscore userscore = new Userscore();
		userscore.setScore(score);
		userscore.setSingle_answer(singleanswer);//注意此处保留的是用户自己的答案，而不是标准答案
		userscore.setMultiple_answer(multipleanswer);
		
		scoredao.endUpdate(userscore,u_id);  //考试结束后更新成绩记录
		
 		
		return "showscore";
	}

	
	
	
	public String getSingleanswer() {
		return singleanswer;
	}

	public void setSingleanswer(String singleanswer) {
		this.singleanswer = singleanswer;
	}

	public String getMultipleanswer() {
		return multipleanswer;
	}

	public void setMultipleanswer(String multipleanswer) {
		this.multipleanswer = multipleanswer;
	}

	public int getTestid() {
		return testid;
	}

	public void setTestid(int testid) {
		this.testid = testid;
	}
	

}
