package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cn.entity.Manager;

public class ManagerDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**登录*/
	public Manager login(String m_name,String m_pass){
		Manager manager = null;
		try{
			conn = DBHelper.getConn();
			String sql = "select * from manager where m_name = ? and m_pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_name);
			pstmt.setString(2, m_pass);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				manager = new Manager(rs.getInt("m_id"), rs.getString("m_name"),rs.getString("m_pass"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return manager;
	}
	
	
	
	
	

}
