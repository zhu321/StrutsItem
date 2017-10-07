<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东检验检疫（检务）网上培训系统后台管理系统</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />
<link href="../datepicker/default/datePicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../datepicker/WdatePicker.js"></script>
</head>
<script>
	function add_Sub()
	{
		window.document.location="editquestion2.html";
	}
	function show_person()
	{
		if(window.document.getElementById("allperson").style.display=='none')
		{
			window.document.getElementById("allperson").style.display='';
		}
		else
		{
			window.document.getElementById("allperson").style.display='none'
		}
	}
</script>


<body topmargin="0" leftmargin="0">

<!-- 批量导入提示信息 -->
${inputchoiceMessage }

<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td background="../images/ht-body01.jpg" class="body02">当前位置：考试管理-题库管理</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="4" background="../images/ht-body02.jpg" class="body03">查询条件</td>
            </tr>
            <tr>
              <td width="25%" class="body06">试题标题：</td>
              <td width="27%" class="body04"><input name="textfield9" type="text" class="bodytext" /></td>
              <td width="21%" class="body06">教材名称</td>
              <td width="23%" class="body04"><input name="textfield92" type="text" class="bodytext" /></td>
            </tr>
            <tr>
              <td class="body06">分类专业：</td>
              <td class="body04">
			<select style="width:100px;">
				<option>- 不限 -</option>
				<option>检务</option>
				<option>食品</option>
				<option>动检</option>
				<option>植检</option>
				<option>财务</option>
				<option>统计</option>
			</select>
		</td>
            
              <td class="body06">加入用户名：</td>
              <td class="body04"><input type="text" class="bodytext"/></td>
            </tr>
			
			 <tr>
              <td class="body06">难度系数：</td>
              <td class="body04"><select name="select2" class="bodytext01">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              </select></td>
              <td class="body06">试题类型：</td>
              <td class="body04"><select name="select2" class="bodytext01">
		<option>单选</option>
		<option>多选</option>
		<option>是非</option>
              </select></td>
            </tr>
			 <tr>
              <td class="body06">是否练习题：</td>
              <td class="body04"><input type="checkbox" /></td>
              <td class="body06"></td>
              <td class="body04"></td>
            </tr>
            <tr>
              <td colspan="4" class="body03"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="60%" height="35">&nbsp;</td>
                    <td width="10%"><input type="image" src="../images/ht-but-add.jpg" name="Submit2222"  onclick="add_Sub()"/></td>
                    <td width="10%"><input type="image" src="../images/ht-but-check.jpg" name="Submit222" /></td>
                    <td width="10%"><input type="image" src="../images/ht-but-del.jpg" name="Submit224" onclick="javascript:alert('ccccccc')"/></td>
                    <td width="10%"><input type="button" value="批量导入试题" onclick="window.location='inputbanks.jsp'" /></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="body01a"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="11" background="../images/ht-body02.jpg" class="body03">查询结果</td>
            </tr>
            <tr>
              <td width="5%" class="body05" align="center">选择</td>
			  <td width="14%" class="body05" align="center">标题</td>
              <td width="7%" class="body05" align="center">分类专业</td>
              <td width="10%" class="body05" align="center">专业岗位</td>
              <td width="9%" class="body05" align="center">难度系数</td>
			  <td width="11%" class="body05" align="center">加入时间</td>
			  <td width="14%" class="body05" align="center">操&nbsp;&nbsp;作</td>
			  
            </tr>
            <tr>
              <td height="35" class="body03"><input type="checkbox" name="checkbox5" value="checkbox" /></td>
              <td class="body03">疫情考试</td>
              <td class="body03">检务</td>
              <td class="body03">报检岗</td>
			  <td class="body03">3</td>
			  <td class="body03">2007-10-09</td>
			  <td class="body03" nowrap><input type="image" src="../images/ht-but-del.jpg" name="Submit2222"  onclick="javascript:alert('删除成功');"/>
			 <input type="image" src="../images/ht-but-adit.jpg" name="Submit2222"  onclick="window.location='editquestion.html';"/></td>
            </tr>
            <tr>
              <td class="body06"><input type="checkbox" name="checkbox6" value="checkbox" />
              </td>
              <td class="body06">检查考试</td>
              <td class="body06">食品</td>
              <td class="body06">签证管理岗位</td>
			  <td class="body06">3</td>
			  <td class="body06">2007-10-09</td>
			  <td class="body06"><input type="image" src="../images/ht-but-del.jpg" name="Submit2222"  onclick="javascript:alert('删除成功');"/>
			 <input type="image" src="../images/ht-but-adit.jpg" name="Submit2222"  onclick="window.location='editquestion.html';"/></td>
            </tr>
            <tr>
              <td class="body03"><input type="checkbox" name="checkbox7" value="checkbox" /></td>
              <td class="body03">工作考勤</td>
              <td class="body03">动检</td>
              <td class="body03">放行岗</td>
			  <td class="body03">3</td>
			  <td class="body03">2007-10-09</td>
			  <td class="body03"><input type="image" src="../images/ht-but-del.jpg" name="Submit2222"  onclick="javascript:alert('删除成功');"/>
			 <input type="image" src="../images/ht-but-adit.jpg" name="Submit2222"  onclick="window.location='editquestion.html';"/></td>
            </tr>
            <tr>
              <td class="body06"><input type="checkbox" name="checkbox8" value="checkbox" />
              </td>
              <td class="body06">工作表转考试</td>
              <td class="body06">统计</td>
              <td class="body06">印章管理岗</td>
			  <td class="body06">5</td>
			  <td class="body06">2007-10-09</td>
			  <td class="body06"><input type="image" src="../images/ht-but-del.jpg" name="Submit2222"  onclick="javascript:alert('删除成功');"/>
			 <input type="image" src="../images/ht-but-adit.jpg" name="Submit2222"  onclick="window.location='editquestion.html';"/></td>
            </tr>
            <tr>
              <td colspan="11" class="body03">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
    </table>
	
</body>
</html>
