package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cn.entity.Department;
import com.cn.entity.Educational;
import com.cn.entity.Major;
import com.cn.entity.Users;

public class UsersDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**选择删除用户*/
	public void delusersByChecked(List<Integer> uidlist){
		
		try{
			conn = DBHelper.getConn();
			//事物
			conn.setAutoCommit(false);
			
			//遍历
			for(int uid : uidlist){
				String sql = "delete from users where u_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, uid);
				
				pstmt.execute();
			}
			
			conn.commit();
			
		}catch(Exception e){
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	
	
	/**删除单个用户*/
	public void delOneUsers(int uid){
		
		try{
			conn = DBHelper.getConn();
			String sql = "delete from users where u_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
	}
	
	
	/**修改用户1，根据id查询出用户*/
	public Users selectOneUsers(int uid){
		Users users = null;
		
		try{
			conn = DBHelper.getConn();
			String sql = "select * from users where u_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				users = new Users(rs.getInt("u_id"), rs.getString("u_name"), rs.getString("u_pass"),
						rs.getString("u_sex"), rs.getString("u_birth"), rs.getInt("dep_id"), rs.getInt("edu_id"),
						rs.getInt("major_id"), rs.getInt("active_state"), rs.getString("active_time"),
						rs.getString("last_login"), rs.getInt("login_times"));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return users;
	}
	
	/**修改用户2，真正的修改*/
	public void updateUsers(Users users){
		
		try{
			conn = DBHelper.getConn();
			String sql = "update users set u_name=?,u_pass=?,u_sex=?,u_birth=?,dep_id=?,edu_id=?,major_id=? where u_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getU_name());
			pstmt.setString(2, users.getU_pass());
			pstmt.setString(3, users.getU_sex());
			pstmt.setString(4, users.getU_birth());
			pstmt.setInt(5, users.getDep_id());
			pstmt.setInt(6, users.getEdu_id());
			pstmt.setInt(7, users.getMajor_id());
			pstmt.setInt(8, users.getU_id());
			
			pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
	}

	
	
	
	
	/**添加用户*/
	public boolean addusers(Users users){
		boolean flag = true;
		
		try{
			conn = DBHelper.getConn();
			String sql = "insert into users (u_name,u_pass,u_sex,u_birth,dep_id,edu_id,major_id) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getU_name());
			pstmt.setString(2, users.getU_pass());
			pstmt.setString(3, users.getU_sex());
			pstmt.setString(4, users.getU_birth());
			pstmt.setInt(5, users.getDep_id());
			pstmt.setInt(6, users.getEdu_id());
			pstmt.setInt(7, users.getMajor_id());
			
			flag = pstmt.execute();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}
		
		return flag;
	}
	
	
	
	

	/**
	 * 根据条件查询用户 ，，注意字符串的列要带上引号，日期也是
	 */
	public List<Users> selectUsersByCondition(Object[] obj, int page) {
		List<Users> ulist = new ArrayList<Users>();

		// 条件汇总：users(u_id,dep_id,edu_id,major_id,u_name,u_sex), u_birth1,
		// u_birth2,active_time1,active_time2
		String mysql = "";
		Users users = (Users) obj[0];
		// 注意要判断
		if (users.getU_id() != 0) {
			mysql += " and u_id = " + users.getU_id() + "";
		}

		if (users.getDep_id() != 0) {
			mysql += " and dep_id = " + users.getDep_id() + "";
		}

		if (users.getEdu_id() != 0) {
			mysql += " and edu_id = " + users.getEdu_id() + "";
		}

		if (users.getMajor_id() != 0) {
			mysql += " and major_id = " + users.getMajor_id() + "";
		}

		if (users.getU_name() != null && !users.getU_name().equals("")) {
			mysql += " and u_name like '%" + users.getU_name() + "%'";
		}

		if (users.getU_sex() != null && !users.getU_sex().equals("")) {
			mysql += " and u_sex = '" + users.getU_sex() + "'";
		}

		if (obj[1] != null && !obj[1].equals("")) {
			mysql += " and u_birth >= '" + obj[1] + "'";
		}

		if (obj[2] != null && !obj[2].equals("")) {
			mysql += " and u_birth <= '" + obj[2] + "'";
		}

		if (obj[3] != null && !obj[3].equals("")) {
			mysql += " and active_time >= '" + obj[3] + "'";
		}

		if (obj[4] != null && !obj[4].equals("")) {
			mysql += " and active_time <= '" + obj[4] + "'";
		}

		try {
			conn = DBHelper.getConn();
			// 5个一页，进行一下倒排序
			String sql = "select * from users where 1=1 " + mysql + " order by u_id desc limit ?,5 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * 5);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Users myusers = new Users(rs.getInt("u_id"), rs.getString("u_name"), rs.getString("u_pass"),
						rs.getString("u_sex"), rs.getString("u_birth"), rs.getInt("dep_id"), rs.getInt("edu_id"),
						rs.getInt("major_id"), rs.getInt("active_state"), rs.getString("active_time"),
						rs.getString("last_login"), rs.getInt("login_times"));
				ulist.add(myusers);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return ulist;
	}

	/**
	 * 查询满足条件的总人数
	 */
	public int getUsersTotalByCondition(Object[] obj) {
		int total = 0;

		// 条件汇总：users(u_id,dep_id,edu_id,major_id,u_name,u_sex), u_birth1,u_birth2,active_time1,active_time2
		String mysql = "";
		Users users = (Users) obj[0];
		// 注意要判断
		if (users.getU_id() != 0) {
			mysql += " and u_id = " + users.getU_id() + "";
		}

		if (users.getDep_id() != 0) {
			mysql += " and dep_id = " + users.getDep_id() + "";
		}

		if (users.getEdu_id() != 0) {
			mysql += " and edu_id = " + users.getEdu_id() + "";
		}

		if (users.getMajor_id() != 0) {
			mysql += " and major_id = " + users.getMajor_id() + "";
		}

		if (users.getU_name() != null && !users.getU_name().equals("")) {
			mysql += " and u_name like '%" + users.getU_name() + "%'";
		}

		if (users.getU_sex() != null && !users.getU_sex().equals("")) {
			mysql += " and u_sex = '" + users.getU_sex() + "'";
		}

		if (obj[1] != null && !obj[1].equals("")) {
			mysql += " and u_birth >= '" + obj[1] + "'";
		}

		if (obj[2] != null && !obj[2].equals("")) {
			mysql += " and u_birth <= '" + obj[2] + "'";
		}

		if (obj[3] != null && !obj[3].equals("")) {
			mysql += " and active_time >= '" + obj[3] + "'";
		}

		if (obj[4] != null && !obj[4].equals("")) {
			mysql += " and active_time <= '" + obj[4] + "'";
		}

		try {
			conn = DBHelper.getConn();
			String sql = "select count(*) from users where 1=1" + mysql + "";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return total;
	}

	/**
	 * 条件：学历、部门、专业
	 */
	public Object[] getconditions() {
		Object[] obj = new Object[3];// Object类型的数组

		List<Department> deplist = new ArrayList<Department>();
		List<Educational> edulist = new ArrayList<Educational>();
		List<Major> majorlist = new ArrayList<Major>();

		try {
			conn = DBHelper.getConn();

			// 部门
			String depsql = "select * from department";
			pstmt = conn.prepareStatement(depsql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Department dep = new Department(rs.getInt("dep_id"), rs.getString("dep_name"));
				deplist.add(dep);
			}

			// 学历
			String edusql = "select * from educational";
			pstmt = conn.prepareStatement(edusql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Educational edu = new Educational(rs.getInt("edu_id"), rs.getString("edu_name"));
				edulist.add(edu);
			}

			// 专业
			String majorsql = "select * from major";
			pstmt = conn.prepareStatement(majorsql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Major major = new Major(rs.getInt("major_id"), rs.getString("major_name"));
				majorlist.add(major);
			}

			// 把它们都放到数组里
			obj[0] = deplist;
			obj[1] = edulist;
			obj[2] = majorlist;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return obj;
	}

	/** 批量导入数据库,,多语句要进行事物控制 */
	public boolean insertusers(List<Users> list) {
		boolean flag = true;

		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);

			// 循环
			for (int i = 0; i < list.size(); i++) {
				String sql = "insert into users(u_name,u_pass,u_sex,u_birth,dep_id,edu_id,major_id) values(?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list.get(i).getU_name());
				pstmt.setString(2, list.get(i).getU_pass());
				pstmt.setString(3, list.get(i).getU_sex());
				pstmt.setString(4, list.get(i).getU_birth());
				pstmt.setInt(5, list.get(i).getDep_id());
				pstmt.setInt(6, list.get(i).getEdu_id());
				pstmt.setInt(7, list.get(i).getMajor_id());

				flag = pstmt.execute();

			}

			conn.commit();

		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return flag;
	}

	/** 判断是否激活,,应该是先判断用户是否存在，再判断用户时候激活，若用户不存在，肯定也就没激活
	 * 若用户已激活，更新登录时间和登录次数 */
	public Users checkactive(String uname) { //因为用户名是唯一的
		Users users = null;
		
		try {
			conn = DBHelper.getConn();
			//事物
			conn.setAutoCommit(false);
			
			String sql = "select * from users where u_name= ? and active_state = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				users = new Users(rs.getInt("u_id"), rs.getString("u_name"), rs.getString("u_pass"),
						rs.getString("u_sex"), rs.getString("u_birth"), rs.getInt("dep_id"), rs.getInt("edu_id"),
						rs.getInt("major_id"), rs.getInt("active_state"), rs.getString("active_time"),
						rs.getString("last_login"), rs.getInt("login_times"));
			}
			
			

			//更新登录时间和登录次数
			if(users != null){
				//更新登录时间
				pstmt = conn.prepareStatement("update users set last_login = now() where u_id = "+users.getU_id()+"");
				pstmt.execute();//注意不要忘记
				
				//更新登录次数,login_times = login_times + 1 
				pstmt = conn.prepareStatement("update users set login_times = login_times + 1 where u_id = "+users.getU_id()+"");
				pstmt.execute();
				
			}
			

			conn.commit();//提交
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return users;
	}

	/** 登录,在激活时也可用作判断 */
	public boolean login(String uname, String upass) {
		boolean flag = true;
		try {
			conn = DBHelper.getConn();
			
			String sql = "select * from users where u_name= ? and u_pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, upass);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return flag;
	}

	/** 激活,修改密码和激活状态,还有激活时间 */
	public boolean active(String newpass, String uname, String upass) {
		boolean flag = true;

		try {
			conn = DBHelper.getConn();
			String sql = "update users set u_pass=?,active_state = 1,active_time=now() where u_name=? and u_pass=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newpass);
			pstmt.setString(2, uname);
			pstmt.setString(3, upass);

			flag = pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return flag;
	}

}
