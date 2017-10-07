<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.cn.entity.*" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷维护</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 导入jquery库 -->
<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>

<script type="text/javascript">
	$(function(){
		//计算总分
		$(".teststyle").blur(function(){
			var total = $("#single_quantity").val() * $("#single_grade").val() + $("#multiple_quantity").val() * $("#multiple_grade").val();
			
			//赋值
			$("#totalscore").val(total);
			
		});
		
		
	});


</script>

<style type="text/css">
	.teststyle{ font-size:12px; color:#000; width:90%; line-height:14px;}
</style>
</head>

<body topmargin="0" leftmargin="0">
<!-- 提示信息 -->
${adddepmessage }

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td background="/mywebtraining/images/ht-body01.jpg" class="body02">当前位置：系统管理-试卷维护</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			
			<form action="maintainTestpaperAction_addtestCondition" method="post"> <!-- =======================表单开始,目前暂不做查询,直接做添加=========================== -->
					<tr>
						<td colspan="4" background="/mywebtraining/images/ht-body02.jpg"
							class="body03">添加条件</td>
					</tr>
					<tr>
						<td width="25%" class="body06">单选题数量：</td>
						<td width="27%" class="body04"><input name="maintaintestpaper.single_quantity"  id="single_quantity"
							type="text" class="teststyle" /></td>
						<td width="21%" class="body06">每题分数：</td>
						<td width="23%" class="body04"><input name="maintaintestpaper.single_grade" id="single_grade"
							type="text" class="teststyle" /></td>
					</tr>
					<tr>
						<td width="25%" class="body06">多选题数量：</td>
						<td width="27%" class="body04"><input name="maintaintestpaper.multiple_quantity"  id="multiple_quantity"
							type="text" class="teststyle" /></td>
						<td width="21%" class="body06">每题分数：</td>
						<td width="23%" class="body04"><input name="maintaintestpaper.multiple_grade" id="multiple_grade"
							type="text" class="teststyle" /></td>
					</tr>
					<tr>
						<td width="25%" class="body06">总分：</td>  <!-- 总分是通过计算得到的 -->
						<td width="27%" class="body04"><input name="maintaintestpaper.totalscore" id="totalscore" type="text" class="bodytext" readonly="readonly" /></td>
						<td width="25%" class="body06">考试时间(单位：分钟)</td>  <!-- 总分是通过计算得到的 -->
						<td width="27%" class="body04"><input name="maintaintestpaper.totaltime" type="text" class="bodytext"/></td>
					</tr>
					
					
					<tr>
						<td colspan="4" class="body03"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="" height="35">&nbsp;</td>
									
									<td width="10%"><input type="image"
										src="/mywebtraining/images/ht-but-add.jpg" name="Submit223"
										onclick="window.location='adddepartment.jsp?'" /></td>
									
						</form> <!-- ==============表单在此处结束====================== -->
						
								</tr>
							</table></td>
					</tr>
					
				
				</table></td>
		</tr>
		
		
		
		
<!-- =====================查询结果显示========================== -->		

		<tr>
			<td class="body01a">
			
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			
				<tr>
	              <td colspan="4" background="/mywebtraining/images/ht-body02.jpg" class="body03"><h3>查询结果</h3> 
	              <td colspan="6" background="/mywebtraining/images/ht-body02.jpg" class="body03">
							<c:if test="${empty conditionlist }">
								<h3>当前还没有数据</h3>
							</c:if>
		              
		              </td>	
	            </tr>
					
			<c:if test="${not empty conditionlist }">		
					
					<tr>
						<td width="9%" align="center" class="body05">maintain_id</td>
						<td width="9%" align="center" class="body05">single_quantity</td>
						<td width="9%" align="center" class="body05">single_grade</td>
						<td width="9%" align="center" class="body05">multiple_quantity</td>
						<td width="9%" align="center" class="body05">multiple_grade</td>
						<td width="9%" align="center" class="body05">totalscore</td>
						<td width="9%" align="center" class="body05">totaltime</td>
						<td width="18%" align="center" class="body05">maintain_time</td>
						<td width="14%" align="center" class="body05">操作</td>
					</tr>
					
					
					<c:forEach items="${conditionlist }" var="maintaintestpaper" varStatus="idx">
						<tr>
						
						<td class="body03"><a href="#">${maintaintestpaper.maintain_id }</a></td>
						<td class="body03">${maintaintestpaper.single_quantity }</td>
						<td class="body03">${maintaintestpaper.single_grade }</td>
						<td class="body03">${maintaintestpaper.multiple_quantity }</td>
						<td class="body03">${maintaintestpaper.multiple_grade }</td>
						<td class="body03">${maintaintestpaper.totalscore }</td>
						<td class="body03">${maintaintestpaper.totaltime}</td>
						<td class="body03">${maintaintestpaper.maintain_time }</td>
						
						
						<td align="center"  class="body03">待定</td>
						
						<!-- <td align="center" class="body03"><input type="image"
							src="/mywebtraining/images/ht-but-del.jpg" name="Submit224"
							onclick="if(!confirm('确实要删除吗？')){return false;};this.parentNode.parentNode.style.display='none';" />
							<input type="image" src="/mywebtraining/images/ht-but-adit.jpg"
							name="Submit22"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;" />
						</td> -->
					</tr>
					
					</c:forEach>
					
					
					
			</c:if>
				</table></td>
		</tr>

		
		
	</table>
</body>
</html>
