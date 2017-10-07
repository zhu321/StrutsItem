<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户(条件从数据库中获取)</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet"
	type="text/css" />
<link href="/mywebtraining/My97DatePicker/skin/default/datepicker.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/mywebtraining/My97DatePicker/WdatePicker.js"></script>

</head>

<body topmargin="0" leftmargin="0">

<!-- 添加成功的提示信息 -->
${addusersmessage }

	<!-- =========================注意表单========================- -->
	<form action="optUsersAction_addusers?conditionFlag=1" method="post">

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="4" background="/mywebtraining/images/ht-body02.jpg"
					class="body03">详细信息</td>
			</tr>
			<tr>
				<td width="15%" class="body06">用户名：</td>
				<td width="33%" class="body04"><input name="operusers.u_name"
					type="text" class="bodytext" /></td>
				<td width="16%" class="body06">密码：</td>
				<td width="36%" class="body04"><input name="operusers.u_pass"
					type="password" class="bodytext" /></td>
			</tr>
			<tr>
				<td class="body06">性别：</td>
				<td class="body04"><input type="radio" name="operusers.u_sex"
					value="男" /> 男 <input type="radio" name="operusers.u_sex" value="女" />女
				</td>
				<td class="body06">学历：</td>
				<td class="body04"><select name="operusers.edu_id" class="bodytext01">
						<option value="0">- 请选择 -</option>
						<c:forEach items="${edulist }" var="educational">
							<option value="${educational.edu_id }">${educational.edu_name }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="body06">专业：</td>
				<td class="body04"><select name="operusers.major_id" class="bodytext01">
						<option value="0">- 请选择 -</option>
						<c:forEach items="${majorlist }" var="major">
							<option value="${major.major_id }" >${major.major_name }</option>
						</c:forEach>
				</select></td>
				<td class="body06">出生日期：</td>
				<td class="body04"><input name="operusers.u_birth" type="text"
					class="Wdate" onfocus="new WdatePicker(this)" /></td>
			</tr>
			<tr>
				<td width="21%" class="body06">所属部门：</td>
				<td width="23%" class="body04"><select name="operusers.dep_id" class="bodytext01">
						<option value="0">- 请选择 -</option>
						<c:forEach items="${deplist }" var="department">
							<option value="${department.dep_id }" >${department.dep_name }</option>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<td colspan="4" class="body03"><table width="100%" border="0"
						cellspacing="0" cellpadding="0">
						<tr>
							<td width="81%" height="35">&nbsp;</td>
							<td width="10%"><input type="submit" value="&nbsp;&nbsp;添&nbsp;加&nbsp;&nbsp;" /></td>
							
							<!-- 返回不能这样写了：onclick="javascript:history.back()" -->
							<td width="9%"><input type="button" value="&nbsp;&nbsp;返&nbsp;回&nbsp;&nbsp;"
								onclick="window.location.href = '/mywebtraining/usersConditionAction_getconditions'" /></td>
						</tr>
					</table></td>
			</tr>

		</table>
	</form>
	<!-- ========================结束=====================- -->


</body>
</html>

