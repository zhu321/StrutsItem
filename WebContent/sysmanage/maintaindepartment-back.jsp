<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东检验检疫（检务）网上培训系统后台管理系统</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />
<script>

</script>
</head>

<body topmargin="0" leftmargin="0">
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
			<td class="body01"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="4" background="../images/ht-body02.jpg"
							class="body03">查询条件</td>
					</tr>
					<tr>
						<td width="25%" class="body06">部门代码：</td>
						<td width="27%" class="body04"><input name="dep_id" id="dep_id"
							type="text" class="bodytext" /></td>
						<td width="21%" class="body06">部门名称：</td>
						<td width="23%" class="body04"><input name="dep_name" id="dep_name"
							type="text" class="bodytext" /></td>
					</tr>
					<tr>
						<td colspan="4" class="body03"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="" height="35">&nbsp;</td>
									<td width="10%"><input type="image"
										src="../images/ht-but-add.jpg" name="Submit223"
										onclick="window.location='addDepart.html?id='+document.all.txtid.value+'&name='+document.all.txtname.value;" /></td>
									<td width="10%"><input type="image"
										src="../images/ht-but-check.jpg" name="Submit222" /></td>
									<td width="10%"><input type="image"
										src="../images/ht-but-del.jpg" name="Submit224"
										onclick="del();" /></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td class="body01a"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="5" background="../images/ht-body02.jpg"
							class="body03">查询结果</td>
					</tr>
					<tr>
						<td width="5%" align="center" class="body05">选择</td>
						<td width="38%" align="center" class="body05">部门代码</td>
						<td width="27%" align="center" class="body05">部门名称</td>
						<td width="30%" align="center" class="body05">操作</td>
					</tr>
					<tr>
						<td class="body03"><input type="checkbox" name="chk"
							value="checkbox1" /></td>
						<td class="body03"><a href="#"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;">1001</a></td>
						<td class="body03">部门one</td>
						<td align="center" class="body03"><input type="image"
							src="../images/ht-but-del.jpg" name="Submit224"
							onclick="if(!confirm('确实要删除吗？')){return false;};this.parentNode.parentNode.style.display='none';" "/>
							<input type="image" src="../images/ht-but-adit.jpg"
							name="Submit22"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;" />
						</td>
					</tr>
					<tr>
						<td class="body03"><input type="checkbox" name="chk"
							value="checkbox2" /></td>
						<td class="body03"><a href="#"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;">1002</a></td>
						<td class="body03">部门two</td>
						<td align="center" class="body03"><input type="image"
							src="../images/ht-but-del.jpg" name="Submit224"
							onclick="if(!confirm('确实要删除吗？')){return false;};this.parentNode.parentNode.style.display='none';" />
							<input type="image" src="../images/ht-but-adit.jpg"
							name="Submit22"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;" />
						</td>
					</tr>
					<tr>
						<td class="body03"><input type="checkbox" name="chk"
							value="checkbox3" /></td>
						<td class="body03"><a href="#"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;">1003</a></td>
						<td class="body03">部门three</td>
						<td align="center" class="body03"><input type="image"
							src="../images/ht-but-del.jpg" name="Submit224"
							onclick="if(!confirm('确实要删除吗？')){return false;};this.parentNode.parentNode.style.display='none';" />
							<input type="image" src="../images/ht-but-adit.jpg"
							name="Submit22"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;" />
						</td>
					</tr>
					<tr>
						<td class="body03"><input type="checkbox" name="chk"
							value="checkbox4" /></td>
						<td class="body03"><a href="#"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;">1004</a></td>
						<td class="body03">部门four</td>
						<td align="center" class="body03"><input type="image"
							src="../images/ht-but-del.jpg" name="Submit224"
							onclick="if(!confirm('确实要删除吗？')){return false;};this.parentNode.parentNode.style.display='none';" />
							<input type="image" src="../images/ht-but-adit.jpg"
							name="Submit22"
							onclick="window.location='viewdepart.html?id='+this.parentNode.parentNode.childNodes[1].firstChild.innerHTML+'&name='+this.parentNode.parentNode.childNodes[2].innerHTML;" />
						</td>
					</tr>

				</table></td>
		</tr>
	</table>
</body>
</html>
