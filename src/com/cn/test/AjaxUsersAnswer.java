package com.cn.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class AjaxUsersAnswer {
	private String singleanswer;
	private String multipleanswer;
	private int singlegrade;
	private int multiplegrade;
	


	// 数据传递走时，通过流来传递，而不是request
	HttpServletResponse response = ServletActionContext.getResponse();
	Map<String, Object> session = ActionContext.getContext().getSession();

	// 判分
	public String ajaxScore() {
		// 获取session中的答案
		String singleStandard = (String) session.get("singleStandard");
		String multipleStandard = (String) session.get("multipleStandard");

		// 已经取出来了，可以移除了
		session.remove("singleStandard");
		session.remove("multipleStandard");

		// 标准答案
		String[] danAnswers = singleStandard.split(",");
		String[] duoAnswers = multipleStandard.split(",");

		// 用户答案
		String[] userSingle = singleanswer.split(",");
		String[] userMultiple = multipleanswer.split(",");
		
		// 计分，count*分数
		int singlecount = 0;
		for (int i = 0; i < danAnswers.length; i++) {
			// 不要犯这种错if(danAnswers[i] == userSingle[i])
			if (danAnswers[i].equals(userSingle[i]))
				singlecount++;
		}

		int mutiplecount = 0;
		for (int i = 0; i < duoAnswers.length; i++) {
			if (duoAnswers[i].equals(userMultiple[i]))
				mutiplecount++;
		}
		
		//成绩
		int myscore = singlecount * singlegrade + mutiplecount * multiplegrade;
		try {
			PrintWriter pw = response.getWriter();
			pw.print(myscore);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null; // 通过流返回
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
	

	public int getSinglegrade() {
		return singlegrade;
	}

	public void setSinglegrade(int singlegrade) {
		this.singlegrade = singlegrade;
	}

	public int getMultiplegrade() {
		return multiplegrade;
	}

	public void setMultiplegrade(int multiplegrade) {
		this.multiplegrade = multiplegrade;
	}

}
