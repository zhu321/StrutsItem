package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cn.entity.Maintaintestpaper;

/**
 *试卷维护，暂时只做一下查询和添加
 */
public class MaintainTestpaperDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	

	/**从testpaper中查出maintain_id然后通过maintain_id查出每道题的分数*/
	public Maintaintestpaper getscorecondition(int testid){
		Maintaintestpaper maintain = null;
		
		try{
			conn = DBHelper.getConn();
			
			//子查询
			String sql = "select * from maintaintestpaper where maintain_id = (select maintain_id from testpaper where test_id = "+testid+")";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maintain = new Maintaintestpaper(rs.getInt("maintain_id"), rs.getInt("single_quantity"),
						rs.getInt("single_grade"), rs.getInt("multiple_quantity"), rs.getInt("multiple_grade"),
						rs.getInt("totalscore"), rs.getInt("totaltime"), rs.getString("maintain_time"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return maintain;
	}
	
	
	
	
	/**查询最新记录，生成试卷要用*/
	public Maintaintestpaper selectToCreatepaper(){
		Maintaintestpaper maintaintest = null;
		
		try{
			conn = DBHelper.getConn();
			String sql = "select * from maintaintestpaper order by maintain_id desc limit 1";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maintaintest = new Maintaintestpaper(rs.getInt("maintain_id"), rs.getInt("single_quantity"),
						rs.getInt("single_grade"), rs.getInt("multiple_quantity"), rs.getInt("multiple_grade"),
						rs.getInt("totalscore"),rs.getInt("totaltime"), rs.getString("maintain_time"));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return maintaintest;
	}
	
	
	
	/**查询*/
	public List<Maintaintestpaper> selectMaintaintest(){
		List<Maintaintestpaper> list = new ArrayList<Maintaintestpaper>();
		
		try{
			conn = DBHelper.getConn();
			String sql = "select * from maintaintestpaper order by maintain_id desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Maintaintestpaper maintain = new Maintaintestpaper(rs.getInt("maintain_id"),
						rs.getInt("single_quantity"), rs.getInt("single_grade"), rs.getInt("multiple_quantity"),
						rs.getInt("multiple_grade"), rs.getInt("totalscore"),rs.getInt("totaltime"), rs.getString("maintain_time"));
				list.add(maintain);
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
	
	/**添加*/
	public void addmaintaintest(Maintaintestpaper maintaintest){
		try{
			conn = DBHelper.getConn();
			
			String sql = "insert into maintaintestpaper values(null,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maintaintest.getSingle_quantity());
			pstmt.setInt(2, maintaintest.getSingle_grade());
			pstmt.setInt(3, maintaintest.getMultiple_quantity());
			pstmt.setInt(4, maintaintest.getMultiple_grade());
			pstmt.setInt(5, maintaintest.getTotalscore());
			pstmt.setInt(6, maintaintest.getTotaltime());
			
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	

}
