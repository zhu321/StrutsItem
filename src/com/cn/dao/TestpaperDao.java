package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cn.entity.Choicebank;
import com.cn.entity.ComTestpaper;
import com.cn.entity.Maintaintestpaper;
import com.cn.entity.Testpaper;

public class TestpaperDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**1.先去题库查询出相应的题目id
	 * 2.将id拼凑起来 插入到testpaper
	 * 3.还有试卷预览的功能
	 * */
	public Object[] inputmanualtest(int m_id,Maintaintestpaper maintaintest,String test_name,int dep_id,String start_time,String end_time){
		Object[] obj = new Object[2];
		
		try{
			conn = DBHelper.getConn();
			
			List<Choicebank> singlelist  = new ArrayList<Choicebank>();
			String singlesql = "select choice_id,choice_content,choice_A,choice_B,choice_C,choice_D,choice_answer from choicebank where m_id = ? and choice_type = ? order by choice_id desc limit ? ";
			pstmt = conn.prepareStatement(singlesql);
			pstmt.setInt(1, m_id);
			pstmt.setString(2, "单选");
			pstmt.setInt(3, maintaintest.getSingle_quantity());
			ResultSet rs2 = pstmt.executeQuery();
			while(rs2.next()){
				Choicebank choicebank = new Choicebank();
				choicebank.setChoice_id(rs2.getInt("choice_id"));
				choicebank.setChoice_content(rs2.getString("choice_content"));
				choicebank.setChoice_A(rs2.getString("choice_A"));
				choicebank.setChoice_B(rs2.getString("choice_B"));
				choicebank.setChoice_C(rs2.getString("choice_C"));
				choicebank.setChoice_D(rs2.getString("choice_D"));
				choicebank.setChoice_answer(rs2.getString("choice_answer"));
				
				singlelist.add(choicebank);
			}
			
			//注意：此时的试卷题目是倒排的
			List<Choicebank> singlelist2  = new ArrayList<Choicebank>();
			for(int i=singlelist.size()-1;i>=0;i--){
				singlelist2.add(singlelist.get(i));
			}
			

			List<Choicebank> multiplelist  = new ArrayList<Choicebank>();
			String multiplesql = "select choice_id,choice_content,choice_A,choice_B,choice_C,choice_D,choice_answer from choicebank where m_id = ? and choice_type = ? order by choice_id desc limit ? ";
			pstmt = conn.prepareStatement(multiplesql);
			pstmt.setInt(1, m_id);
			pstmt.setString(2, "多选");
			pstmt.setInt(3, maintaintest.getMultiple_quantity());
			ResultSet rs3 = pstmt.executeQuery();
			while(rs3.next()){
				Choicebank choicebank = new Choicebank();
				choicebank.setChoice_id(rs3.getInt("choice_id"));
				choicebank.setChoice_content(rs3.getString("choice_content"));
				choicebank.setChoice_A(rs3.getString("choice_A"));
				choicebank.setChoice_B(rs3.getString("choice_B"));
				choicebank.setChoice_C(rs3.getString("choice_C"));
				choicebank.setChoice_D(rs3.getString("choice_D"));
				choicebank.setChoice_answer(rs3.getString("choice_answer"));
				
				multiplelist.add(choicebank);
			}
			
			//题目是倒排的
			List<Choicebank> multiplelist2 = new ArrayList<Choicebank>();
			for(int i=multiplelist.size()-1;i>=0;i--){
				multiplelist2.add(multiplelist.get(i));
			}
			
			
			//直接放到obj中可以去试卷预览了
			obj[0] = singlelist2;
			obj[1] = multiplelist2;
			
			//将id拼凑起来 插入到testpaper
			String single = "";
			for(int i=0;i<singlelist.size();i++){
				
				single += singlelist.get(i).getChoice_id();
				//判断一下，最后一个不加分号
				if(i != singlelist.size()-1) single += ",";//每个id后面都加一个分号
			}
			
			String multiple = "";
			for(int i=0;i<multiplelist.size();i++){
				
				multiple += multiplelist.get(i).getChoice_id();
				//判断一下，最后一个不加分号
				if(i != multiplelist.size()-1) multiple += ",";
			}
			
			String testsql = "insert into testpaper values(null,?,?,?,?,?,?,?,now(),?)";
			pstmt = conn.prepareStatement(testsql);
			pstmt.setString(1, test_name);
			pstmt.setInt(2, maintaintest.getMaintain_id());
			pstmt.setString(3, single);
			pstmt.setString(4, multiple);
			pstmt.setString(5, start_time);
			pstmt.setString(6, end_time);
			pstmt.setInt(7, dep_id);
			pstmt.setInt(8, m_id);
			
			pstmt.execute(); //不要忘了执行
			
		
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return obj;
	}
	
	
	
	/**按条件查询*/
	public List<ComTestpaper> selectTestBycondition(Testpaper testpaper){
		List<ComTestpaper> list = new ArrayList<ComTestpaper>();
		
		//拼凑查询条件
		String mysql = "";
		if(testpaper.getTest_id() != 0){
			mysql += "and test_id = "+testpaper.getTest_id()+"";
		}
		
		if(testpaper.getTest_name()!=null && !testpaper.getTest_name().equals("")){
			mysql += " and test_name like '%"+testpaper.getTest_name()+"%'";
		}
		
		if(testpaper.getDep_id()!=0){
			mysql += " and dep_id = "+testpaper.getDep_id()+"";
		}
		
		//直接用start_time来比较
		if(testpaper.getStart_time() != null && !testpaper.getStart_time().equals("")){
			mysql += " and start_time >= '"+testpaper.getStart_time()+"' ";
		}
		if(testpaper.getEnd_time()!=null && !testpaper.getEnd_time().equals("")){
			mysql += " and start_time <= '"+testpaper.getEnd_time()+"'";
		}
		
		
		try{
			conn = DBHelper.getConn();
			String sql = "select * from testpaper where 1=1 "+mysql+" order by test_id desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				ComTestpaper comTestpaper = new ComTestpaper();
				comTestpaper.setTest_id(rs.getInt("test_id"));
				comTestpaper.setTest_name(rs.getString("test_name"));
				comTestpaper.setStart_time(rs.getString("start_time"));
				comTestpaper.setEnd_time(rs.getString("end_time"));
				comTestpaper.setTest_time(rs.getString("test_time"));
				
				//继续查询
				String sql2 = "select dep_name from department where dep_id = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1,rs.getInt("dep_id") );
				//注意要另外写一个ResultSet
				ResultSet rs2 = pstmt.executeQuery();
				if(rs2.next()){
					comTestpaper.setDep_name(rs2.getString("dep_name"));
				}
				
				String sql3 = "select totalscore,totaltime from maintaintestpaper where maintain_id = ?";
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, rs.getInt("maintain_id"));
				ResultSet rs3 = pstmt.executeQuery();
				if(rs3.next()){
					comTestpaper.setTotalScore(rs3.getInt("totalscore"));
					comTestpaper.setTotaltime(rs3.getInt("totaltime"));
					
				}
				
				String sql4 = "select count(*) from userscore where test_id = ?";
				pstmt = conn.prepareStatement(sql4);
				pstmt.setInt(1, rs.getInt("test_id"));
				ResultSet rs4 = pstmt.executeQuery();
				if(rs4.next()){
					comTestpaper.setTotalclick(rs4.getInt("count(*)"));
				}
				
				
				list.add(comTestpaper);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return list;
	}
	
	
	/**查询最近一周的考试安排*/
	public List<Testpaper> currentWeekTestpaper(int depid){
		List<Testpaper> list = new ArrayList<Testpaper>();
		
		try{
			conn = DBHelper.getConn();
			//就用now()吧
			String sql = "select * from testpaper where dep_id = "+depid+" and start_time between now() and date_add(now(),interval 7 day)";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Testpaper testpaper = new Testpaper(rs.getInt("test_id"), rs.getString("test_name"),rs.getInt("maintain_id"),
						rs.getString("single_content"), rs.getString("multiple_content"), rs.getString("start_time"),
						rs.getString("end_time"), rs.getInt("dep_id"), rs.getString("test_time"),rs.getInt("m_id"));
				list.add(testpaper);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return list;
	}
	
	/**查询当前部门是否有考试,要判断时间，还要判断用户是否考过*/
	public List<Testpaper> testpaper(int depid,String today,int u_id){
		List<Testpaper> list = new ArrayList<Testpaper>();
		
		try{
			conn = DBHelper.getConn();
			//注意：日期有引号
			String sql = "select * from testpaper where dep_id = "+depid+" and '"+today+"' between start_time and end_time and test_id not in(select test_id from userscore where u_id = "+u_id+")";//用用between"
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Testpaper testpaper = new Testpaper(rs.getInt("test_id"), rs.getString("test_name"),rs.getInt("maintain_id"),
						rs.getString("single_content"), rs.getString("multiple_content"), rs.getString("start_time"),
						rs.getString("end_time"), rs.getInt("dep_id"), rs.getString("test_time"),rs.getInt("m_id"));
				list.add(testpaper);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return list;
	}
	
	/**根据testid查询出试卷*/
	/**查询当前部门是否有考试,要判断时间*/
	public Testpaper getTestpaperByid(int testid){
		Testpaper testpaper = null;
		
		try{
			conn = DBHelper.getConn();
			//注意：日期有引号
			String sql = "select * from testpaper where test_id = "+testid+" ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				testpaper = new Testpaper(rs.getInt("test_id"), rs.getString("test_name"),rs.getInt("maintain_id"),
						rs.getString("single_content"), rs.getString("multiple_content"), rs.getString("start_time"),
						rs.getString("end_time"), rs.getInt("dep_id"), rs.getString("test_time"),rs.getInt("m_id"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return testpaper;
	}
	
	
	
	
	/**插入*/
	public boolean insertTest(Testpaper testpaper){
		boolean flag = true;
		try{
			conn = DBHelper.getConn();
			
			String sql = "insert into testpaper values(null,?,?,?,?,?,?,?,now(),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, testpaper.getTest_name());
			pstmt.setInt(2, testpaper.getMaintain_id());
			pstmt.setString(3, testpaper.getSingle_content());
			pstmt.setString(4, testpaper.getMultiple_content());
			pstmt.setString(5, testpaper.getStart_time());
			pstmt.setString(6, testpaper.getEnd_time());
			pstmt.setInt(7, testpaper.getDep_id());
			pstmt.setInt(8, testpaper.getM_id());
			
			flag = pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return flag;
	}
	
	

	/**删除*/
	public void delTestpaper(int test_id){
		try{
			conn = DBHelper.getConn();
			
			String sql = "delete from testpaper where test_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, test_id);
			
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	
	
}
