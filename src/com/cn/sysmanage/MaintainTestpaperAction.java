package com.cn.sysmanage;

import java.util.List;
import java.util.Map;

import com.cn.dao.MaintainTestpaperDao;
import com.cn.entity.Maintaintestpaper;
import com.opensymphony.xwork2.ActionContext;

public class MaintainTestpaperAction {
	private Maintaintestpaper maintaintestpaper;
	
	
	MaintainTestpaperDao dao = new MaintainTestpaperDao();
	Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");

	/**添加生成试卷的条件*/
	public String addtestCondition(){
		
		dao.addmaintaintest(maintaintestpaper);
		
		return "addcondition";
	}
	
	
	/**查询*/
	public String showConditions(){
		List<Maintaintestpaper> conditionlist = dao.selectMaintaintest();
	
		request.put("conditionlist", conditionlist);
		
		return "showcondition";
	}


	public Maintaintestpaper getMaintaintestpaper() {
		return maintaintestpaper;
	}


	public void setMaintaintestpaper(Maintaintestpaper maintaintestpaper) {
		this.maintaintestpaper = maintaintestpaper;
	}
	


}
