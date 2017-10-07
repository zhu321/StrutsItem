<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*,com.cn.entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门维护</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 引入jquery库 -->
<script type="text/javascript" src="../JS/jquery-1.8.1.js"></script>


</head>

<body topmargin="0" leftmargin="0">
<!-- 提示信息 -->
${adddepmessage }

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td background="../images/ht-body01.jpg" class="body02">当前位置：系统管理-部门维护</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			
			<form action="selectDepartmentAction_selectDep" method="post"> <!-- =======================表单开始=========================== -->
					<tr>
						<td colspan="4" background="../images/ht-body02.jpg"
							class="body03">查询条件</td>
					</tr>
					<tr>
						<td width="25%" class="body06">部门代码：</td>
						<input type="hidden" name="depid" id="hiddepid"  value="${selectdepart.dep_id }" />
						<td width="27%" class="body04"><input name="selectdepart.dep_id" id="dep_id"
							type="text" class="bodytext" /></td>
						<td width="21%" class="body06">部门名称：</td>
						<td width="23%" class="body04"><input name="selectdepart.dep_name" id="dep_name" value="${selectdepart.dep_name }"
							type="text" class="bodytext" /></td>
					</tr>
					<tr>
						<td colspan="4" class="body03"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="" height="35">&nbsp;</td>
									
									<td width="10%"><input type="image"
										src="../images/ht-but-check.jpg" name="Submit222" /></td>
						</form> <!-- ==============表单在此处结束，因为下面的type="image"会影响表单的提交====================== -->
						
									<td width="10%"><input type="image"
										src="../images/ht-but-add.jpg"
										onclick="window.location='adddepartment.jsp'" /></td>
									
								</tr>
							</table></td>
					</tr>
					
				
				</table></td>
		</tr>
		
		
		
		
<!-- =====================查询结果显示========================== -->		
<!-- 试试java代码控制，因为下面的test="${empty deplist }既可判断null,也能判断empty，不好操作 -->
<%
	//用非耦合的方式放，可以用耦合的方式取
	List<Department> deplist = (List<Department>)request.getAttribute("deplist");
	
	if(deplist != null){
		%>
		
		<tr>
			<td class="body01a">
			
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			
				<tr>
	              <td colspan="2" background="/mywebtraining/images/ht-body02.jpg" class="body03"><h3>查询结果</h3> 
	              <td colspan="2" background="/mywebtraining/images/ht-body02.jpg" class="body03">
							<c:if test="${empty deplist }">
								<h3>当前还没有数据</h3>
							</c:if>
		              
		              </td>	
	            </tr>
					
			<c:if test="${not empty deplist }">		
					
					<tr>
						<td width="38%" align="center" class="body05">部门代码</td>
						<td width="27%" align="center" class="body05">部门名称</td>
						<td width="30%" align="center" class="body05">操作</td>
					</tr>
					
					
					<c:forEach items="${deplist }" var="department" varStatus="idx">
						<tr>
						
						<td class="body03"><a href="#">${department.dep_id }</a></td>
						<td class="body03">${department.dep_name }</td>
						
						<td align="center" class="body03">
						<input type="image" src="../images/ht-but-del.jpg" onclick="window.location='operDeparmentAction_deleteDep?department.dep_id=${department.dep_id }&selectdepart.dep_id=${selectdepart.dep_id }&selectdepart.dep_name=${selectdepart.dep_name }'"/>
						
						<!-- onclick="if(!confirm('确实要删除吗？')){return false;};this.parentNode.parentNode.style.display='none';" -->	 
						<!-- onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;" -->
						
						<input type="image" src="../images/ht-but-adit.jpg" onclick="window.location = 'updatedepartment.jsp?dep_id=${department.dep_id }&dep_name=${department.dep_name }&sdep_id=${selectdepart.dep_id }&sdep_name=${selectdepart.dep_name }'"  />
						
						</td>
					</tr>
					
					</c:forEach>
					
					
					
			</c:if>
				</table></td>
		</tr>
		
		
		
		<%
	}
%>	
		
		
	</table>
	
	
<!-- 单独写jquery代码 ,此处应写到最后面-->
<script type="text/javascript">
	//页面一加载就绑定click事件
	 $(function(){
		 
		var depid = $("#hiddepid").val();
		if(depid != 0){
			$("#dep_id").val(depid);			
		}
		 
	});

</script>
</body>
</html>
