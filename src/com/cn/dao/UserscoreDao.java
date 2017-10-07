package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cn.entity.Userscore;
/**注意：用户不能删除自己的成绩*/
public class UserscoreDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**防止倒计时刷新功能*/
	public int selectusers(int test_id,int u_id){
		int test_end = 0;
		String note = null;
		
		try{
			conn = DBHelper.getConn();
			String sql = "select unix_timestamp(test_end),notes from userscore where test_id = ? and u_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, test_id);
			pstmt.setInt(2, u_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				note = rs.getString("notes");
				test_end = rs.getInt("unix_timestamp(test_end)"); //转成时间戳的形式
			}
			
			//判断有没有note，就知道是不是在刷新
			//note==null表示第一次来，还没考试，note.equals("正在考试")表示正在刷新
			if(note==null || !note.equals("正在考试")) return 0;
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return test_end;
	}
	
	/**查询所有用户
	 * 
	 * 按条件查询用户,待定
	 * 
	 * 也是采取投机方式
	 */
	public List<Userscore> getAllscore(){
		List<Userscore> list = new ArrayList<Userscore>();
		try{
			conn = DBHelper.getConn();
			
			//now() > test_end表示用户自己的考试时间 已经结束了
			String updsql = "update userscore set notes = '考试失败' where notes = '正在考试'and now() > test_end";
			pstmt = conn.prepareStatement(updsql);
			pstmt.execute();
			
			
			
			String sql = "select s.score_id,u.u_name,t.test_name,s.score,s.test_start,s.test_end,s.single_answer,s.multiple_answer,s.notes from userscore as s,users as u,testpaper as t where s.u_id = u.u_id and s.test_id = t.test_id order by score_id desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Userscore userscore = new Userscore(rs.getInt("score_id"), rs.getString("u_name"), rs.getString("test_name"),
						rs.getInt("score"), rs.getString("test_start"), rs.getString("test_end"),
						rs.getString("single_answer"), rs.getString("multiple_answer"), rs.getString("notes"));
				list.add(userscore);
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
	
	
	
	/**
	 * 用户查询自己的成绩
	 * 再加一个判断是否考试失败，目前没有什么好方法
	 * 我的方案是采取一种投机的方式，先看notes的状态，若为"正在考试"，则有两种情况
	 * 1.确实是正在考试，此方式的前提是，用户登录了两个一样的账号，一个账号在考试，另一个账号在看成绩
	 * 2.就是中途断网了或退出浏览器，反正就是考试失败了，因为设置了一个用户只能考一次
	 * 
	 * 所以，问题就变简单了，只需看note字段就行了，当然不能直接就修改，还要判断now() > test_end(),此时会有一些关于时间小问题
	 * 
	 * 注意：管理员查询所有用户成绩时，又是另一种判断方式
	 * 
	 * */
	public List<Userscore> getmyscore(int u_id){
		List<Userscore> list = new ArrayList<Userscore>();
		try{
			conn = DBHelper.getConn();
			
			String updsql = "update userscore set notes = '考试失败' where u_id = ? and notes = '正在考试'and now() > test_end";
			pstmt = conn.prepareStatement(updsql);
			pstmt.setInt(1, u_id);
			pstmt.execute();
			
			
			//对几张表做了整合
			String sql = "select s.score_id,u.u_name,t.test_name,s.score,s.test_start,s.test_end,s.single_answer,s.multiple_answer,s.notes from userscore as s,users as u,testpaper as t where s.u_id = u.u_id and s.test_id = t.test_id and s.u_id = ? order by score_id desc ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_id);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Userscore userscore = new Userscore(rs.getInt("score_id"), rs.getString("u_name"), rs.getString("test_name"),
						rs.getInt("score"), rs.getString("test_start"), rs.getString("test_end"),
						rs.getString("single_answer"), rs.getString("multiple_answer"), rs.getString("notes"));
				list.add(userscore);
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
	
	
	
	/**用户一进入考试，就向该表插入一条记录,默认notes就为"正在考试"，所以可以不写，当考试结束后，再修改这条记录*/
	public void startInsert(int u_id, int test_id,String test_start,int test_end){ //int test_end 是时间戳
		try{
			conn = DBHelper.getConn();
			
			String sql = "insert into userscore(u_id,test_id,test_start,test_end) values(?,?,?,from_unixtime("+test_end+"))";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_id);
			pstmt.setInt(2, test_id);
			pstmt.setString(3, test_start);
			
			
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	
	/**考试结束后，修改记录*/
	public void endUpdate(Userscore userscore,int u_id){
		try{
			conn = DBHelper.getConn();
			
			String sql = "update userscore set score = ?,single_answer = ?,multiple_answer = ?,notes = '正常' where u_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userscore.getScore());
			pstmt.setString(2, userscore.getSingle_answer());
			pstmt.setString(3, userscore.getMultiple_answer());
			pstmt.setInt(4, u_id);
			
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	
	
	

}
