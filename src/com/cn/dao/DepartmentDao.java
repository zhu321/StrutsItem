package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cn.entity.Department;

public class DepartmentDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**查询出所有部门*/
	public List<Department> selectAllDeparment(){
		List<Department> list = new ArrayList<Department>();
		
		try{
			conn = DBHelper.getConn();
			String sql = "select * from department";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				Department dep = new Department(rs.getInt("dep_id"), rs.getString("dep_name"));
				list.add(dep);
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
	 * 当删除部门时，其实不是删除，就将该部门改为待定
	 * 当已经有'待定'存在时，再删除部门，如何合并为一条记录？此时要先将该部门中对应的user的部门先修改，然后才能将该部门删除
	 **/
	public void delDepartment(Department department){
		try{
			conn = DBHelper.getConn();
			
			//多条语句，事物控制
			conn.setAutoCommit(false);
			
			//查询出dep_id
			int dep_id = 0;
			
			//先判断是否有'待定'
			pstmt = conn.prepareStatement("select dep_id from department where dep_name = '待定'");
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dep_id = rs.getInt("dep_id");
			}
			
			
			if(dep_id == 0 ){ 
				//如果没有,直接将该部门修改为"待定"
				String sql = "update department set dep_name = '待定' where dep_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, department.getDep_id());
				
				pstmt.execute();//不要忘了
				
			}else{
				//如果已存在，则先去users表中 ，将修改该部门(department.getDep_id())的人修改为上面查出的dep_id，再来删除该部门
				String sql1 = "update users set dep_id = ? where dep_id = ?";
				pstmt = conn.prepareStatement(sql1);
				//注意：这两个顺序别写倒了
				pstmt.setInt(1, dep_id);
				pstmt.setInt(2, department.getDep_id());
				pstmt.execute();
				
				//然后删除该部门
				pstmt = conn.prepareStatement("delete from department where dep_id = "+department.getDep_id()+"");
				pstmt.execute();
				
				
			}
			
			conn.commit();
			
			
		}catch(Exception e){
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	
	/**添加部门*/
	public boolean addDepartment(Department department){
		boolean flag = true;
		try{
			conn = DBHelper.getConn();
			
			String sql = "insert into department values(null,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, department.getDep_name());
			
			flag = pstmt.execute();
					
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		return flag;
	}
	
	/**修改部门*/
	public void updateDepartment(Department department){
		try{
			conn = DBHelper.getConn();
			
			String sql = "update department set dep_name = ? where dep_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, department.getDep_name());
			pstmt.setInt(2, department.getDep_id());
			
			pstmt.execute();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
	}
	
	
	/**按条件查询部门*/
	public List<Department> selectDeparment(Department department){
		List<Department> list = new ArrayList<Department>();
		
		//条件汇总,%表示n个字符，n为任意数
		String mysql = "";

		if(department.getDep_id() != 0){
			mysql += " and dep_id = "+department.getDep_id()+"";//目前编号设置的为准确查询
		}
		
		if(department.getDep_name()!=null && !department.getDep_name().equals("")){
			mysql += " and dep_name like '%"+department.getDep_name()+"%'";
		}
		
		
		try{
			conn = DBHelper.getConn();
			String sql = "select * from department where 1=1 "+mysql+"";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				Department dep = new Department(rs.getInt("dep_id"), rs.getString("dep_name"));
				list.add(dep);
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
	
	

}
