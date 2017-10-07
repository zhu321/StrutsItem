<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示考试信息</title>
</head>
<body>

	<!-- 做一下判断 -->
	<c:if test="${ not empty testlist }">
		<center style="margin-top: 120px">
			<table>
				<tr>
					<th width="120">试卷名称</th>
					<th width="400">开放时间</th>
				</tr>

				<c:forEach items="${testlist }" var="testpaper">
					<tr>
						<td align="center"><a
							href="usersTestAction_usertest?testid=${testpaper.test_id }"
							target="_top">${testpaper.test_name }</a></td>
						<td align="center">${testpaper.start_time } -- ${testpaper.end_time }</td>
					</tr>
				</c:forEach>
			</table>

		</center>
	</c:if>

	<c:if test="${empty testlist }">
		<center style="margin-top: 120px">
			<h3>目前还没有考试，最近一周的考试安排如下：</h3>
			<table>
				<tr>
					<th width="120">试卷名称</th>
					<th width="400">开放时间</th>
				</tr>

				<c:forEach items="${errortimelist }" var="testpaper">
					<tr>
						<td align="center">${testpaper.test_name }</td>
						<td align="center">${testpaper.start_time } -- ${testpaper.end_time }</td>
					</tr>
				</c:forEach>
			</table>

		</center>
	</c:if>
</body>
</html>