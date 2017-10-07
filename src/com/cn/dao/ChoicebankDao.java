package com.cn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.cn.entity.Choicebank;

public class ChoicebankDao {
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	

	/**
	 * 题库训练，随机
	 * 
	 * 以前的方式
	 * 1.根据uid找出部门
	 * 2.找出该部门的所有题目id
	 * 3.生成随机数，匹配索引
	 * 4.根据id查找题目
	 * 
	 * 换另一种方式
	 * 1.根据uid找出部门
	 * 2.找出该部门的所有题目，不是id了，直接是一个对象
	 * 3.生成随机数，匹配索引，此时索引对应的是对象
	 */
	public List<Choicebank> randomtraining(int u_id,String type) {
		List<Choicebank> questionlist = new ArrayList<Choicebank>();

		try {
			conn = DBHelper.getConn();
			
			int dep_id = 0;
			
			//先根据u_id查出部门
			String depid_sql = "select dep_id from users where u_id = " + u_id + "";
			pstmt = conn.prepareStatement(depid_sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dep_id = rs.getInt("dep_id");
			}
			

			List<Choicebank> selectList = new ArrayList<Choicebank>();
			// 找出单选题/多选题
			String sql = "select * from choicebank where choice_department like '%"+dep_id+"%'and choice_type = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type); //类型：单选、多选
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Choicebank choicebank = new Choicebank(rs.getInt("choice_id"), rs.getString("choice_content"),
						rs.getString("choice_A"), rs.getString("choice_B"), rs.getString("choice_C"),
						rs.getString("choice_D"), rs.getString("choice_type"), rs.getString("choice_answer"),
						rs.getString("choice_department"), rs.getInt("m_id"));
				selectList.add(choicebank);
			}


			//获取总数
			int count = selectList.size();
			
			//生成不重复的随机数,用随机数匹配索引，而不是id
			//就用数组吧
			int[] idArray = new int[count];
			
			Random random = new Random();
			for(int i=0;i<count;i++){
				idArray[i] = random.nextInt(count); // 0-(count-1)
				//每生成一个数，就要与前面的所有数比较
				for(int j=0;j<i;j++){
					
					if(idArray[i] == idArray[j]){//如果相同就回退一步，而且最终每次也只会回退一步，因为前面已经生成的数只可能有一个与它相等
						i--; 
						break; //加上break,因为前面最多只可能有一个与它一样
					} 
					
				}
			}
			
			
			//根据索引，打乱题目
			for(int i=0;i<idArray.length;i++){
				questionlist.add(selectList.get(idArray[i]));
				
			}
			
		

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return questionlist;
	}
	
	
	/**
	 * 题库训练，顺序，按部门查询题目的id
	 */
	public List<Choicebank> ordertraining(int u_id,String type) {
		List<Choicebank> questionlist = new ArrayList<Choicebank>();

		try {
			conn = DBHelper.getConn();
			
			int dep_id = 0;
			
			//先根据u_id查出部门
			String depid_sql = "select dep_id from users where u_id = " + u_id + "";
			pstmt = conn.prepareStatement(depid_sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dep_id = rs.getInt("dep_id");
			}
			

			// 找出单选题/多选题
			String sql = "select * from choicebank where choice_department like '%"+dep_id+"%'and choice_type = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type); //类型：单选、多选
			
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Choicebank choicebank = new Choicebank(rs.getInt("choice_id"), rs.getString("choice_content"),
						rs.getString("choice_A"), rs.getString("choice_B"), rs.getString("choice_C"),
						rs.getString("choice_D"), rs.getString("choice_type"), rs.getString("choice_answer"),
						rs.getString("choice_department"), rs.getInt("m_id"));
				questionlist.add(choicebank);
			}

			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return questionlist;
	}
	
	

	/** 把拆分id单独写一个方法 */
	public List<Integer> splidID(String content) {
		List<Integer> list = new ArrayList<Integer>();

		String[] str1 = content.split(",");

		for (int i = 0; i < str1.length; i++) {
			list.add(Integer.parseInt(str1[i]));
		}

		return list;
	}

	public List<String> splidID2(String content) {
		List<String> list = new ArrayList<String>();

		String[] str1 = content.split(",");

		for (int i = 0; i < str1.length; i++) {
			list.add(str1[i]);
		}

		return list;
	}

	/**
	 * 用户查看试卷
	 */
	public Object[] showtest(int score_id) {
		Object[] obj = new Object[5];

		try {
			conn = DBHelper.getConn();

			// 先判断是否过了保密时间(默认是end_time的第二天),去两张表查询
			// String sql = "select
			// t.test_name,t.single_content,t.multiple_content,u.single_answer,u.multiple_answer
			// from userscore as u,testpaper as t where u.test_id = t.test_id
			// and u.score_id = ?";
			String sql = "select t.test_name,t.single_content,t.multiple_content,u.single_answer,u.multiple_answer from userscore as u,testpaper as t  where u.test_id = t.test_id and u.score_id = ? and now() > date_add(date_format(t.end_time,'%Y-%m-%d'),interval 1 day)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, score_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 任意判断一个就行
				if (rs.getString("test_name") == null) {
					// 表示没查到，即还没过保密时间，直接return
					return obj; // 此时list肯定是空的

				} else {

					obj[4] = rs.getString("test_name");

					// 将用户自己的答案拆分出来
					List<String> mysinglelist = this.splidID2(rs.getString("single_answer"));
					List<String> mymultiplelist = this.splidID2(rs.getString("multiple_answer"));

					// 放入object数组
					obj[0] = mysinglelist;
					obj[1] = mymultiplelist;

					// 根据single_content和multiple_content去题库中找题目和答案
					// 将id拆分出来,调用上面写的方法
					List<Integer> singlelist = this.splidID(rs.getString("single_content"));

					List<Choicebank> list2 = new ArrayList<Choicebank>();
					// 循环,根据id去查完整的题目和答案
					for (int i = 0; i < singlelist.size(); i++) {
						String sql2 = "select choice_content,choice_A,choice_B,choice_C,choice_D,choice_answer from choicebank where choice_id = ?";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setInt(1, singlelist.get(i));

						ResultSet rs2 = pstmt.executeQuery();
						if (rs2.next()) {
							Choicebank singlebank = new Choicebank();
							singlebank.setChoice_content(rs2.getString("choice_content"));
							singlebank.setChoice_A(rs2.getString("choice_A"));
							singlebank.setChoice_B(rs2.getString("choice_B"));
							singlebank.setChoice_C(rs2.getString("choice_C"));
							singlebank.setChoice_D(rs2.getString("choice_D"));
							singlebank.setChoice_answer(rs2.getString("choice_answer"));
							list2.add(singlebank);
						}

					} // 循环结束

					List<Integer> multiplelist = this.splidID(rs.getString("multiple_content"));

					List<Choicebank> list3 = new ArrayList<Choicebank>();
					// 循环,根据id去查完整的题目
					for (int i = 0; i < multiplelist.size(); i++) {
						String sql3 = "select choice_content,choice_A,choice_B,choice_C,choice_D,choice_answer from choicebank where choice_id = ?";
						pstmt = conn.prepareStatement(sql3);
						pstmt.setInt(1, multiplelist.get(i));

						ResultSet rs3 = pstmt.executeQuery();
						if (rs3.next()) {
							Choicebank multiplebank = new Choicebank();
							multiplebank.setChoice_content(rs3.getString("choice_content"));
							multiplebank.setChoice_A(rs3.getString("choice_A"));
							multiplebank.setChoice_B(rs3.getString("choice_B"));
							multiplebank.setChoice_C(rs3.getString("choice_C"));
							multiplebank.setChoice_D(rs3.getString("choice_D"));
							multiplebank.setChoice_answer(rs3.getString("choice_answer"));
							list3.add(multiplebank);
						}

					} // 循环结束

					obj[2] = list2;
					obj[3] = list3;

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return obj;
	}

	/**
	 * 根据抽取的id，找出题目内容，组成一张试卷
	 * 
	 * 在后台预览试卷 和 前台考试时都会用到该方法
	 * 
	 */
	public List<Choicebank> selectBank(List<Integer> id_list) {
		List<Choicebank> list = new ArrayList<Choicebank>();

		try {
			conn = DBHelper.getConn();

			// 循环,根据id去查完整的题目
			for (int i = 0; i < id_list.size(); i++) {
				String sql = "select * from choicebank where choice_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id_list.get(i));

				rs = pstmt.executeQuery();
				if (rs.next()) {
					Choicebank choicebank = new Choicebank(rs.getInt("choice_id"), rs.getString("choice_content"),
							rs.getString("choice_A"), rs.getString("choice_B"), rs.getString("choice_C"),
							rs.getString("choice_D"), rs.getString("choice_type"), rs.getString("choice_answer"),
							rs.getString("choice_department"), rs.getInt("m_id"));
					list.add(choicebank);
				}

			} // 循环结束

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return list;
	}

	/** 根据用户id查出他所在的部门 */
	public int seachDepidByUid(int uid) {
		int depid = 0;

		try {
			conn = DBHelper.getConn();
			String sql = "select dep_id from users where u_id = " + uid + "";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				depid = rs.getInt("dep_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return depid;
	}

	/**
	 * 插入数据库
	 */
	public boolean addchoicebank(List<Choicebank> list) {
		boolean flag = true;

		try {
			conn = DBHelper.getConn();

			// 循环
			for (int i = 0; i < list.size(); i++) {
				String sql = "insert into choicebank values(null,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list.get(i).getChoice_content());
				pstmt.setString(2, list.get(i).getChoice_A());
				pstmt.setString(3, list.get(i).getChoice_B());
				pstmt.setString(4, list.get(i).getChoice_C());
				pstmt.setString(5, list.get(i).getChoice_B());
				pstmt.setString(6, list.get(i).getChoice_type());
				pstmt.setString(7, list.get(i).getChoice_answer());
				pstmt.setString(8, list.get(i).getChoice_department());
				pstmt.setInt(9, list.get(i).getM_id());

				flag = pstmt.execute();

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return flag;
	}

	/**
	 * 按部门查询题目的id，此处只需要id就行了，因为后面抽题后再根据id把所需要的题抽出来 可能有多部门，1,2,3..,
	 * choice_department like '%"+dep_id+"%'
	 */
	public Object[] getallchoiceBycondition(int dep_id) {
		Object[] obj = new Object[2];
		List<Integer> singlelist = new ArrayList<Integer>();
		List<Integer> multiplelist = new ArrayList<Integer>();

		try {
			conn = DBHelper.getConn();

			// 找出单选题
			String sql = "select choice_id from choicebank where choice_department like '%" + dep_id
					+ "%'and choice_type = '单选'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				singlelist.add(rs.getInt("choice_id"));
			}

			// 找出多选题
			String sql2 = "select choice_id from choicebank where choice_department like '%" + dep_id
					+ "%'and choice_type = '多选'";
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				multiplelist.add(rs.getInt("choice_id"));
			}

			// 放入数组中
			obj[0] = singlelist;
			obj[1] = multiplelist;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBHelper.closeRs(rs);
			DBHelper.closePstmt(pstmt);
			DBHelper.closeConn(conn);
		}

		return obj;
	}

}
