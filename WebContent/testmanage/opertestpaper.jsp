<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.cn.entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷管理</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet"
	type="text/css" />

<!-- 是一个日期插件，将以前datepacker文件夹的删除，将My97DatePicker文件夹复制过来，修改路径 -->
<link href="/mywebtraining/My97DatePicker/skin/default/datepicker.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/mywebtraining/My97DatePicker/WdatePicker.js"></script>

<!-- 导入jquery库 -->
<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>


</head>
<script>
	
</script>
<body topmargin="0" leftmargin="0">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td height="195" background="/mywebtraining/images/ht-body01.jpg"
							class="body02">当前位置：考试管理-试卷管理</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					
				<form action="selectTestpaperAction_getTestpaperBycondition" method="post">
					<tr>
						<td colspan="4" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">查询条件</td>
					</tr>
					<tr>
						<td width="25%" class="body06">试卷编号：</td>
						<input type="hidden" name="hiddetestid" value="${seltestpaper.test_id }" />
						<td width="27%" class="body04"><input
							name="seltestpaper.test_id" id="testid" type="text"
							class="bodytext" value="42060001" /></td>
						<td width="21%" class="body06">试卷名称：</td>
						<td width="23%" class="body04"><input
							name="seltestpaper.test_name" value="${seltestpaper.test_name }"
							type="text" class="bodytext" /></td>
					</tr>

					<tr>
						<td class="body06">部门</td>
						<td class="body04"><select name="seltestpaper.dep_id"
							class="bodytext01" id="depid">
								<option value="0" ${seltestpaper.dep_id == 0? 'selected':'' }>-
									不限 -</option>

								<c:forEach items="${deplist }" var="department">
									<option value="${department.dep_id }"
										${seltestpaper.dep_id==department.dep_id? 'selected':'' }>${department.dep_name }</option>
								</c:forEach>

						</select></td>

					</tr>
					<tr>
						<td class="body06">开放时间从：</td>
						<td class="body04"><input name="seltestpaper.start_time"
							value="${seltestpaper.start_time }" type="text" class="Wdate"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
						<td class="body06">到：</td>
						<td class="body04"><input name="seltestpaper.end_time"
							value="${seltestpaper.end_time }" type="text" class="Wdate"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
					</tr>

					<tr>
						<td colspan="4" class="body03"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="69%" height="35">&nbsp;</td>
									<td width="10%"><input type="image"
										src="/mywebtraining/images/ht-but-check.jpg" /></td>
					</form>						
					
									<td width="10%"><input type="image"
										src="/mywebtraining/images/ht-but-del.jpg"
										onclick="javascript:alert('Del Successful')" /></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>


		<!-- =====================查询结果显示========================== -->
		<!-- 试试java代码控制，因为下面的test="${empty deplist }既可判断null,也能判断empty，不好操作 -->
		<%
			//用非耦合的方式放，可以用耦合的方式取
			List<ComTestpaper> comtestlist = (List<ComTestpaper>) request.getAttribute("comtestlist");

			if (comtestlist != null) {
				
				%>
				

		<tr>
			<td class="body01a"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="4" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">查询结果</td>

						<td colspan="10" background="/mywebtraining/images/ht-body02.jpg"
							class="body03"><c:if test="${empty comtestlist }">
								<h4>当前还没有数据</h4>
							</c:if></td>
					</tr>

					<c:if test="${not empty comtestlist }">

						<tr>
							<td width="4%" align="center" nowrap="nowrap" class="body05">编号</td>
							<td width="8%" align="center" nowrap="nowrap" class="body05">标题</td>
							<td width="4%" align="center" nowrap="nowrap" class="body05">部门</td>
							<td width="5%" align="center" nowrap="nowrap" class="body05">总分</td>
							<td width="4%" align="center" nowrap="nowrap" class="body05">答卷时间(分钟)</td>
							<td width="4%" align="center" nowrap="nowrap" class="body05">点击数</td>
							<td width="25%" align="center" nowrap="nowrap" class="body05">开放时间</td>
							<td width="13%" align="center" nowrap="nowrap" class="body05">生成时间</td>

							<td width="6%" align="center" nowrap="nowrap" class="body05">操&nbsp;&nbsp;作</td>
						</tr>

						<c:forEach items="${comtestlist }" var="comtest">
							<tr>
								<td nowrap="nowrap" align="center" class="body06">${comtest.test_id }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.test_name }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.dep_name }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.totalScore }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.totaltime }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.totalclick }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.start_time } -- ${comtest.end_time }</td>
								<td nowrap="nowrap" align="center" class="body06">${comtest.test_time }</td>
								
								<td nowrap="nowrap" class="body06">
									<input type="image" src="/mywebtraining/images/ht-but-del.jpg" onclick="window.location='xxx?test_id=${comtest.test_id }'"/>
							</tr>
						</c:forEach>

						<tr>
							<td colspan="14" class="body03">&nbsp;</td>
						</tr>
				</table> </c:if></td>
		</tr>
<%
			}%>

	</table>

	<!-- 单独写jquery代码 ,此处应写到最后面-->
	<script type="text/javascript">
		//页面一加载就绑定click事件
		$(function() {

			var testid = $("#hiddetestid").val();
			if (depid != 0) {
				$("#testid").val(testid);
			}

		});
	</script>

</body>
</html>
