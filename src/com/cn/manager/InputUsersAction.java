package com.cn.manager;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cn.dao.UsersDao;
import com.cn.entity.Users;
import com.opensymphony.xwork2.ActionContext;

/**
 *批量导入学员 ,只是插入大部分字段，u_name,u_pass,u_sex,u_birth,dep_id,edu_id,major_id
 */
public class InputUsersAction {
private File userupload;
	
	//上传成功的提示信息
	private String inputusersMessage;
	

	public String getInputusersMessage() {
		return inputusersMessage;
	}

	public void setInputusersMessage(String inputusersMessage) {
		this.inputusersMessage = inputusersMessage;
	}

	public String inputexcel() {

		try {

			FileInputStream fis = new FileInputStream(userupload);

			XSSFWorkbook book = new XSSFWorkbook(fis);

			List<Users> userlist = new ArrayList<Users>();

//			System.out.println("工作表的个数：" + book.getNumberOfSheets());
			// 循环工作表sheet
			for (int numsheet = 0; numsheet < book.getNumberOfSheets(); numsheet++) {
				// 从文档对象中得到工作簿对象（一个sheet就是一个对象）
				XSSFSheet sheet = book.getSheetAt(numsheet);

				if (sheet == null) {
					continue;
				}

				// 循环行row,sheet.getLastRowNum()得到总行数，sheet.getFirstRowNum()读取开始行，从开始行的下一行开始取值
				for (int rowNum = sheet.getFirstRowNum()+1; rowNum <= sheet.getLastRowNum(); rowNum++) {
					XSSFRow row = sheet.getRow(rowNum);

					if (row != null) {
						// 有多少列就写多少个
						XSSFCell uname = row.getCell(0);
						XSSFCell upass = row.getCell(1);
						XSSFCell usex = row.getCell(2);
						XSSFCell ubirth = row.getCell(3);
						XSSFCell dep_id = row.getCell(4);
						XSSFCell edu_id = row.getCell(5);
						XSSFCell major_id = row.getCell(6);
						
						//处理一下日期类型的
						Date date = ubirth.getDateCellValue();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

						/*System.out.println(upass.getCellType());//2
						
						System.out.println(upass.CELL_TYPE_NUMERIC);//0,数值型
						System.out.println(upass.CELL_TYPE_STRING);//1，字符串型
						System.out.println(upass.CELL_TYPE_BLANK);//3，空值
						System.out.println(upass.CELL_TYPE_BOOLEAN);//4，布尔型
						System.out.println(upass.CELL_TYPE_ERROR);//5，错误
						System.out.println(upass.CELL_TYPE_FORMULA);//2，公式型
*/						
						Users users = new Users();
						// 只需要7个字段
						users.setU_name(this.judge(uname));
						users.setU_pass(this.judge(upass));
						users.setU_sex(usex.getStringCellValue());
						users.setU_birth(sdf.format(date));
						users.setDep_id(Integer.parseInt(this.judge(dep_id)));
						users.setEdu_id(Integer.parseInt(this.judge(edu_id)));
						users.setMajor_id(Integer.parseInt(this.judge(major_id)));
						
						//把users放入集合里
						userlist.add(users);

					}
				}
			}// for循环

			// 插入到数据库
			UsersDao userdao = new UsersDao();
			boolean flag = userdao.insertusers(userlist);
			if(!flag){
				inputusersMessage = "<script>alert('导入成功！');</script>";
			}else{
				inputusersMessage = "<script>alert('导入失败，可能是excel格式有错误.......')</script>";
			}
			
			//把inputusersMessage放到request中传递
			Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
			//用Put放
			request.put("inputusersMessage", inputusersMessage);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return "inputok";
	}

	// 单独写一个方法来判断类型,此方法只判断int或String
	public String judge(XSSFCell strcell) {
		String aaa = "";

		// 格式化
		DecimalFormat df = new DecimalFormat("#"); //#表示匹配整数部门，若是0表示匹配一个整数，00，#.#等等

		// 依据：cell.getCellType() == cell.CELL_TYPE_NUMERIC,,注意upass是用公式获取的随机数，区分一下
		if (strcell.getCellType() == strcell.CELL_TYPE_NUMERIC || strcell.getCellType()==strcell.CELL_TYPE_FORMULA) {
			aaa = df.format(strcell.getNumericCellValue());
		}else {
			aaa = strcell.getStringCellValue();
		}

		return aaa;
	}
	
	
	
	
	public File getUserupload() {
		return userupload;
	}

	public void setUserupload(File userupload) {
		this.userupload = userupload;
	}


}
