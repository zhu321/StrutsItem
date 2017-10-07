package com.cn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBHelper {
	private static String className = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/mywebtraining";
	private static String uname = "root";
	private static String upass = "xiao111";
	
	public static  Connection getConn(){
		Connection conn = null;
		
		try{
			Class.forName(className);
			conn = DriverManager.getConnection(url, uname, upass);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}

	public static void closeConn(Connection conn){
		try{
			if(!conn.isClosed() || conn != null){
				conn.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void closePstmt(PreparedStatement pstmt){
		try{
			if(pstmt != null){
				pstmt.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public static void closeRs(ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
