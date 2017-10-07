package com.cn.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cn.dao.ChoicebankDao;
import com.cn.entity.Choicebank;
import com.cn.entity.Showtest;
import com.opensymphony.xwork2.ActionContext;

public class ShowMytest {
	private int score_id;

	// 公用
	Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
	Map<String, Object> session = ActionContext.getContext().getSession();

	ChoicebankDao bankdao = new ChoicebankDao();

	/** 当保密时间过去后可查看试卷 */
	public String shwoMytest() {

		// 先判断是否过了保密时间
		Object[] obj = bankdao.showtest(score_id);
		
		//任意判断里面的其中一个元素就行
		if(obj[0]==null){
			request.put("testmessage", "试卷还没公布，请耐心等待....");
			
			return "showtest";
		}
		
		//把四个list组成两个List<Showtest>,不然在页面拼凑太麻烦
		
		List<String> mysinglelist = (List<String>) obj[0];
		List<String> mymultiplelist = (List<String>) obj[1];
		List<Choicebank> singlelist = (List<Choicebank>) obj[2];
		List<Choicebank> multiplelist = (List<Choicebank>) obj[3];
		
		List<Showtest> showsinglelist = new ArrayList<Showtest>();
		for(int i=0; i<singlelist.size();i++){
			Showtest show = new Showtest();
			show.setChoice_content(singlelist.get(i).getChoice_content());
			show.setChoice_A(singlelist.get(i).getChoice_A());
			show.setChoice_B(singlelist.get(i).getChoice_B());
			show.setChoice_C(singlelist.get(i).getChoice_C());
			show.setChoice_D(singlelist.get(i).getChoice_D());
			show.setChoice_answer(singlelist.get(i).getChoice_answer());
			show.setMy_answer(mysinglelist.get(i));
			
			showsinglelist.add(show);
		}
		
		List<Showtest> showmultiplelist = new ArrayList<Showtest>();
		for(int i=0; i<multiplelist.size();i++){
			Showtest show = new Showtest();
			show.setChoice_content(multiplelist.get(i).getChoice_content());
			show.setChoice_A(multiplelist.get(i).getChoice_A());
			show.setChoice_B(multiplelist.get(i).getChoice_B());
			show.setChoice_C(multiplelist.get(i).getChoice_C());
			show.setChoice_D(multiplelist.get(i).getChoice_D());
			show.setChoice_answer(multiplelist.get(i).getChoice_answer());
			show.setMy_answer(mymultiplelist.get(i));
			
			showmultiplelist.add(show);
		}
		

		//试卷名称也放上
		request.put("test_name", (String)obj[4]);
		request.put("showsinglelist", showsinglelist);
		request.put("showmultiplelist", showmultiplelist);

		return "showtest";
	}

	
	public int getScore_id() {
		return score_id;
	}

	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}

}
