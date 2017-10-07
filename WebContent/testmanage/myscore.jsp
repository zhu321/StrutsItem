<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*,com.cn.entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的成绩</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 是一个日期插件，将以前datepacker文件夹的删除，将My97DatePicker文件夹复制过来，修改路径 -->
<link href="/mywebtraining/My97DatePicker/skin/default/datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mywebtraining/My97DatePicker/WdatePicker.js"></script>

<!-- 导入jquery库 -->
<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>

</head>

<body topmargin="0" leftmargin="0">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="195" background="../images/ht-body01.jpg" class="body02">当前位置：考试-我的成绩</td>
        </tr>
    </table></td>
  </tr>
  <tr>
  
  	<form action="oneUserscore_getmyscore" method="post">
	    <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td colspan="4" background="../images/ht-body02.jpg" class="body03">查询条件(待定)
	 		</td>
	 		
	        </tr>
	        <tr>
	          <td width="26%" nowrap="nowrap" class="body06">试卷id：</td>
	          <td width="27%" nowrap="nowrap" class="body04"><input name="test_id" type="text" class="bodytext"/></td>
			</tr>
			<tr>
	          <td nowrap="nowrap" class="body06">考试时间：</td>
	          <td nowrap="nowrap" class="body04"><input name="testtime1" value="${testtime1 }" type="text" id="startDate" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\') || \'new Date()\'}'})"/></td>
	          <td nowrap="nowrap" class="body06">到：</td>
	          <td class="body04"><input name="testtime2" value="${testtime2 }" type="text" class="Wdate" id="endDate" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'new Date()'})"/></td>
	        </tr>
			
	        <tr>
	          <td colspan="4" class="body03"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="69%" height="35">&nbsp;</td>
	                <td width="11%">&nbsp;</td>
	                <td width="10%"><input type="image" src="../images/ht-but-check.jpg"/></td>
	                <td width="10%"><input type="image" src="../images/ht-but-back.jpg" onclick="window.history.back();"/></td>
	              </tr>
	          </table></td>
	        </tr>
	    </table></td>
    
    </form>
  </tr>
  
  
  <!-- 试试java代码控制，因为下面的test="${empty deplist }既可判断null,也能判断empty，不好操作 -->
<%
	//用非耦合的方式放，可以用耦合的方式取
	List<Userscore> myscorelist = (List<Userscore>)request.getAttribute("myscorelist");
	
	if(myscorelist != null){%>
	
  <tr>
    <td class="body01a"><table width="100%" border="0" cellspacing="0" cellpadding="0">
       
         <tr><td colspan="3" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">查询结果</td>
			<td colspan="4" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">
					<c:if test="${empty myscorelist }"><h4>当前还没有成绩！</h4></c:if>
			</td>
					</tr>
					
		<c:if test="${not empty myscorelist }">
					<tr>
						<td width="9%" align="center" nowrap="nowrap" class="body05">score_id</td>
						<td width="16%" align="center" nowrap="nowrap" class="body05">test_name</td>
						<td width="12%" align="center" nowrap="nowrap" class="body05">test_start</td>
						<td width="12%" align="center" nowrap="nowrap" class="body05">test_end</td>
						<td width="12%" align="center" nowrap="nowrap" class="body05">score</td>
						<td width="9%" align="center" nowrap="nowrap" class="body05">notes</td>
						<td width="9%" align="center" nowrap="nowrap" class="body05">操作</td>
					</tr>

					<c:forEach items="${myscorelist }" var="userscore">
						<tr align="center">
							<td nowrap="nowrap" class="body06">${userscore.score_id }</td>
							<td nowrap="nowrap" class="body06">${userscore.test_name }</td>
							<td nowrap="nowrap" class="body06">${userscore.test_start }</td>
							<td nowrap="nowrap" class="body06">${userscore.test_end }</td>
							<td nowrap="nowrap" class="body06">${userscore.score }</td>
							<td nowrap="nowrap" class="body06">${userscore.notes }</td>
							<td nowrap="nowrap" class="body06">
								<!-- 判断一下，如果考试失败，就不让他在此处查看试卷，因为需要把用户的答案拆分出来，会出错，让它到别处查看试卷 -->
								<c:if test="${userscore.notes eq '考试失败' }" >
									请在别处查看试卷
								</c:if>
								
								<c:if test="${userscore.notes ne '考试失败' && userscore.notes ne '正在考试' }" >
									<input type="button" value="查看试卷" onclick="window.location='showMytest_shwoMytest?score_id=${userscore.score_id }'" />
								</c:if>
								
							</td>
						</tr>
					</c:forEach>
       
        <tr>
          <td colspan="11" class="body03">&nbsp;</td>
        </tr>
        
        </c:if>
    </table></td>
  </tr>
  
	<%}
		%>
</table>

</body>
</html>
