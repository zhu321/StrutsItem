package com.cn.questionbank;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cn.dao.ChoicebankDao;
import com.cn.entity.Choicebank;
import com.opensymphony.xwork2.ActionContext;

/**
 *批量插入选择题
 */
public class InputchoicebankAction {
	private File choiceupload;
	private String inputchoiceMessage;
	Map<String, Object> session = ActionContext.getContext().getSession();
	int m_id = (int) session.get("m_id");
	
	public String inputexcel() {
		
		//调用方法
		boolean flag = this.inputFunction(choiceupload);

		if(!flag){
			inputchoiceMessage = "<script>alert('导入成功')</script>";
		}else{
			inputchoiceMessage = "<script>alert('导入失败.......')</script>";
		}
		
		Map<String , Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("inputchoiceMessage", inputchoiceMessage);
		
		return "inputbankok";
	}
	
	
	//单独写一个方法,因为后面手动生成试卷时也要用到
	public boolean inputFunction(File choicefile){
		boolean flag = true;
		try {

			FileInputStream fis = new FileInputStream(choicefile);

			XSSFWorkbook book = new XSSFWorkbook(fis);

			List<Choicebank> Choicebanklist = new ArrayList<Choicebank>();

			for (int numsheet = 0; numsheet < book.getNumberOfSheets(); numsheet++) {
				
				XSSFSheet sheet = book.getSheetAt(numsheet);

				if (sheet == null) {
					continue;
				}

				for (int rowNum = sheet.getFirstRowNum()+1; rowNum <= sheet.getLastRowNum(); rowNum++) {
					XSSFRow row = sheet.getRow(rowNum);
					row.getCell(1).getCellTypeEnum();
					if (row != null) {
						XSSFCell choice_content = row.getCell(0);
						XSSFCell choice_A = row.getCell(1);
						XSSFCell choice_B = row.getCell(2);
						XSSFCell choice_C = row.getCell(3);
						XSSFCell choice_D = row.getCell(4);
						XSSFCell choice_type = row.getCell(5);
						XSSFCell choice_answer = row.getCell(6);
						XSSFCell choice_department = row.getCell(7);

						Choicebank choicebank = new Choicebank();
						choicebank.setChoice_content(choice_content.getStringCellValue());
						choicebank.setChoice_A(this.judge(choice_A));
						choicebank.setChoice_B(this.judge(choice_B));
						choicebank.setChoice_C(this.judge(choice_C));
						choicebank.setChoice_D(this.judge(choice_D));
						choicebank.setChoice_type(choice_type.getStringCellValue());
						choicebank.setChoice_answer(choice_answer.getStringCellValue());
						choicebank.setChoice_department(this.judge(choice_department));
						choicebank.setM_id(m_id);
						
						Choicebanklist.add(choicebank);

					}
				}
			}

			ChoicebankDao choicedao = new ChoicebankDao();
			
			flag = choicedao.addchoicebank(Choicebanklist);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	
	
	// 单独写一个方法来判断类型,,注意若答案中有double类型，格式化后就不对了，所以double类型的要单独在后台插入，不能批量
	public String judge(XSSFCell strcell) {
		String aaa = "";

		// 格式化
		DecimalFormat df = new DecimalFormat("#");

		if (strcell.getCellType() == strcell.CELL_TYPE_NUMERIC) {
			aaa = df.format(strcell.getNumericCellValue());
		} else {
			aaa = strcell.getStringCellValue();
		}

		return aaa;
	}
	
	

	public File getChoiceupload() {
		return choiceupload;
	}


	public void setChoiceupload(File choiceupload) {
		this.choiceupload = choiceupload;
	}


	public String getInputchoiceMessage() {
		return inputchoiceMessage;
	}


	public void setInputchoiceMessage(String inputchoiceMessage) {
		this.inputchoiceMessage = inputchoiceMessage;
	}
	

}
