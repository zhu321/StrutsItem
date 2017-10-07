package com.cn.testtraining;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cn.dao.ChoicebankDao;
import com.cn.entity.Choicebank;
import com.opensymphony.xwork2.ActionContext;

public class TesttrainingAction {
	private int questionType;
	private int pattern;
	
	ChoicebankDao choicebankdao = new ChoicebankDao();
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();

	int u_id = (Integer) session.get("u_id");

	/**题库训练*/
	public String training() {
		
		List<Choicebank> traininglist = new ArrayList<Choicebank>();
		
		//questionType 1是单选，2是多选
		if(questionType == 1){
			//pattern 1是顺序，2是随机
			if(pattern==1){
				traininglist = choicebankdao.ordertraining(u_id, "单选");
			}else{
				traininglist = choicebankdao.randomtraining(u_id, "单选");
			}
			
		}else{
			
			if(pattern == 1){
				traininglist = choicebankdao.ordertraining(u_id, "多选");
			}else{
				traininglist = choicebankdao.randomtraining(u_id, "多选");
			}
			
			request.put("traininglist", traininglist);
			return "multipletraining";
			
		}
		

		request.put("traininglist", traininglist);

		return "training";
	}
	
	
	
	public int getQuestionType() {
		return questionType;
	}

	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}

	public int getPattern() {
		return pattern;
	}

	public void setPattern(int pattern) {
		this.pattern = pattern;
	}

	

}
