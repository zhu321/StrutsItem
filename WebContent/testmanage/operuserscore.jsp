<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.cn.entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有用户的成绩</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet" type="text/css" />

</head>

<body topmargin="0" leftmargin="0">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td height="195" background="/mywebtraining/images/ht-body01.jpg"
							class="body02">当前位置：用户成绩</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="4" background="../images/ht-body02.jpg"
							class="body03">查询条件(待定)</td>
					</tr>
				
				<!-- 暂时把所有的都查出来，若有时间在做多条件查询 -->
				<form action="allUsersscore_selAllscore" method="post"> <!-- ========表单开始======= -->
						<tr>
							<td class="body06">部门</td>
							<td class="body04"><select style="width: 100px;" name="dep_id">
									<option value="0"  ${dep_id==0? 'selected':''} >- 不限 -</option>
									<c:forEach items="${deplist }" var="department">
										<option value="${department.dep_id }" ${dep_id==department.dep_id? 'selected':'' }>${department.dep_name }</option>
									</c:forEach>
							</select></td>
						</tr><tr>
						<td colspan="4" class="body03"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="69%" height="35">&nbsp;</td>
									<td width="11%">&nbsp;</td>
									<td width="10%"><input type="image"
										src="/mywebtraining/images/ht-but-check.jpg" /></td>
									
								</tr>
							</table></td>
					</tr>

			</form>

				</table></td>
		</tr>
		
  <!-- 试试java代码控制，因为下面的test="${empty deplist }既可判断null,也能判断empty，不好操作 -->
<%
	//用非耦合的方式放，可以用耦合的方式取
	List<Userscore> scorelist = (List<Userscore>)request.getAttribute("scorelist");
	
	if(scorelist != null){
	%>

		<tr>
			<td class="body01a"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">

					<tr>
						<td colspan="3" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">查询结果</td>
						<td colspan="4" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">
							<c:if test="${empty scorelist }"><h4>当前还没有成绩！</h4></c:if>
						</td>
					</tr>
					
	<c:if test="${not empty scorelist }">
					<tr>
						<td width="9%" align="center" nowrap="nowrap" class="body05">score_id</td>
						<td width="9%" align="center" nowrap="nowrap" class="body05">u_name</td>
						<td width="16%" align="center" nowrap="nowrap" class="body05">test_name</td>
						<td width="12%" align="center" nowrap="nowrap" class="body05">test_start</td>
						<td width="12%" align="center" nowrap="nowrap" class="body05">test_end</td>
						<td width="12%" align="center" nowrap="nowrap" class="body05">score</td>
						<td width="9%" align="center" nowrap="nowrap" class="body05">notes</td>
					</tr>

					<c:forEach items="${scorelist }" var="userscore">
						<tr align="center">
							<td nowrap="nowrap" class="body06">${userscore.score_id }</td>
							<td nowrap="nowrap" class="body06">${userscore.u_name }</td>
							<td nowrap="nowrap" class="body06">${userscore.test_name }</td>
							<td nowrap="nowrap" class="body06">${userscore.test_start }</td>
							<td nowrap="nowrap" class="body06">${userscore.test_end }</td>
							<td nowrap="nowrap" class="body06">${userscore.score }</td>
							<td nowrap="nowrap" class="body06">${userscore.notes }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="11" class="body03">&nbsp;</td>
					</tr>
			</c:if>
				
				</table></td>
		</tr>
	<%}%>
	
	</table>
	
</body>
</html>
