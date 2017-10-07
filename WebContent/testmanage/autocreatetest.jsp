<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动生成试卷</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet" type="text/css" />
<!-- 是一个日期插件，将以前datepacker文件夹的删除，将My97DatePicker文件夹复制过来，修改路径 -->
<link href="/mywebtraining/My97DatePicker/skin/default/datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mywebtraining/My97DatePicker/WdatePicker.js"></script>

<style type="text/css">
	#test{
		font-size: 16px;
		font-family: Arial,"宋体";
	}

</style>

</head>

<body topmargin="0" leftmargin="0">


<!-- 试卷生成错误的提示 -->
${errortest }


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="195" background="/mywebtraining/images/ht-body01.jpg" class="body02">当前位置：考试管理-试卷管理</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td class="body01">
    
    <!-- =============表单开始,加一下条件回显================ -->
    <form action="autoCreateTestpaper_autoCreatetest" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="4" background="/mywebtraining/images/ht-body02.jpg" class="body03">生成试卷</td>
        </tr>
        <tr>
          <td width="21%" class="body06">试卷名称：</td>
          <td width="23%" class="body04"><input type="text" name="test_name" value="${test_name }"  class="bodytext" /></td>
       
       	 <td class="body06">部门</td>
              <td class="body04">
			<select style="width:100px;" name="dep_id">
				<c:forEach items="${deplist }" var="department">
                	<option value="${department.dep_id }" ${dep_id==department.dep_id? 'selected':'' }>${department.dep_name }</option>
                </c:forEach>
			</select>
			
			</td>
       
        </tr>
        
		<tr>
          <td class="body06">开放时间从：</td>   <!-- 注意指定id -->
          <td class="body04"><input name="start_time" value="${start_time }" type="text" id="startDate" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'new Date()',maxDate:'#F{$dp.$D(\'endDate\')}'})"/></td>
          <td class="body06">到：</td>
          <td class="body04"><input name="end_time" value="${end_time }" type="text" id="endDate" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\') || \'new Date()\'}'})" /></td>
        </tr>
        
        <tr>
          <td colspan="4" class="body03"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30%" height="35">&nbsp;</td>
                <td width="12%"><input type="image" src="/mywebtraining/images/ht-but-scsj.jpg""/></td>
                
              </tr>
          </table></td>
        </tr>
    </table>
    </form><!-- 表单结束 -->
    
    </td>
  </tr>
  
</table>

<!-- =============预览试卷=============== -->
<!-- 加一个判断条件 -->
<c:if test="${not empty mysinglelist }">

<table id="test" width="780" style="border:1px solid #ccc;margin:0 auto">
	<tr>
		<td colspan="3">
			<%-- <div style="width:260px; margin:0 auto"><font size="4">${test_name }考试</font></div> --%>
			<center><font size="4">${test_name }考试</font></center>
			<hr/>
		</td>
	</tr>
	
	<tr><td colspan="3">一、单选题（共${singlequantity }题，每题${singlegrade }分）</td></tr>
	<!-- 循环集合 -->
	<c:forEach items="${mysinglelist }" var="single" varStatus="no">
		<tr height="12"></tr><!-- 题目与题目之间空一行 -->
		<tr>
			<td width="2%"></td><!-- 空白列 -->
			<td width="8%">${single.choice_answer }</td>
			<td width="90%">
				<span style="font-weight:bold">${no.index + 1 }. ${single.choice_content }</span></br>
				A.${single.choice_A } <br/>
				B.${single.choice_B } <br/>
				C.${single.choice_C } <br/>
				D.${single.choice_D } 
			</td>
		</tr>
	</c:forEach>
	
	
	<tr height="16"></tr><!-- 题目与题目之间空一行 -->
	<tr><td colspan="3">二、多选题（共${multiplequantity }题，每题${multiplegrade }分）</td></tr>
	<!-- 循环集合 -->
	<c:forEach items="${mymutiplelist }" var="mutiple" varStatus="no">
		<tr height="12"></tr><!-- 题目与题目之间空一行 -->
		<tr>
			<td width="2%"></td><!-- 空白列 -->
			<td width="8%">${mutiple.choice_answer }</td>
			<td width="90%">
				<span style="font-weight:bold">${no.index + 1 }. ${mutiple.choice_content }</span></br><!-- 题目 -->
				A.${mutiple.choice_A } <br/>
				B.${mutiple.choice_B } <br/>
				C.${mutiple.choice_C } <br/>
				D.${mutiple.choice_D } 
			</td>
		</tr>
	</c:forEach>
	
	
	<tr height="30"></tr>

</table>
</c:if>

</body>
</html>
