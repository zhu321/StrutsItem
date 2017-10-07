<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东检验检疫（检务）网上培训系统后台管理系统</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />
<link href="/webtraining/My97DatePicker/skin/default/datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/webtraining/My97DatePicker/WdatePicker.js"></script>

<script>
	function selectPost(b){
		var v = document.getElementById("post");
		if(v.style.display=="none"){
			v.style.display="";
		}
		else{
			v.style.display="none";
			if(b==1)
				document.all.se.innerHTML="检务-签证岗;食品-证单管理岗";
			else
				document.all.se.innerHTML="";
		}
	}
</script>
</head>

<body topmargin="0" leftmargin="0">
	
	<!-- =========================注意表单========================- -->
	<form action="operUsersAction_addusers" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="4" background="../images/ht-body02.jpg" class="body03">详细信息</td>
            </tr>
            <tr>
              <td width="15%" class="body06">用户名：</td>
              <td width="33%" class="body04"><input name="users.u_name" type="text" class="bodytext" /></td>
              <td width="16%" class="body06">密码：</td>
              <td width="36%" class="body04"><input name="users.u_pass" type="text" class="bodytext" /></td>
            </tr>
            <tr>
              <td class="body06">性别：</td>
              <td class="body04"><input type="radio" name="users.u_sex" value="男"/> 男
                <input type="radio" name="users.u_sex" value="女"/>女 </td>
              <td class="body06">学历：</td>
              <td class="body04"><select name="users.u_educational" class="bodytext01">
                <option value="">--不限--</option>
                <option value="高中">高中</option>
                <option value="专科">专科</option>
                <option value="本科">本科</option>
                <option value="研究生">研究生</option>
                <option value="硕士">硕士</option>
                <option value="博士">博士</option>
                <option value="双硕士">双硕士</option>
                <option value="双博士">双博士</option>
              </select></td>
            </tr>
            <tr>
              <td class="body06">专业：</td>
              <td class="body04"><select name="users.u_major" class="bodytext01">
                <option value="">--不限--</option>
                <option value="计算机">计算机</option>
                <option value="财务会计 ">财务会计</option>
                <option value="金融">金融</option>
                <option value="英语">英语</option>
                <option value="律师">律师</option>
              </select> </td>
              <td class="body06">出生日期：</td>
              <td class="body04"><input name="users.u_birth" type="text" class="Wdate" onfocus="new WdatePicker(this)" /></td>
            </tr>
			 <tr>
               <td width="21%" class="body06">所属部门：</td>
              <td width="23%" class="body04"><select name="users.dep_id" class="bodytext01">
                <option value="">- 不限定 -</option>
                <option value="1">检务部</option>
                <option value="2">食品部</option>
                <option value="3">动检部</option>
                <option value="4">植检部</option>
                <option value="5">财务部</option>
                <option value="6">统计部</option>
              </select></td>
              <td class="body06">待定：</td>
              <td class="body04"><a href="#" onclick="selectPost(0);">选择</a>&nbsp;&nbsp;&nbsp;<label id="se"></label></td>
            </tr>
            <tr>
              <td colspan="4" class="body03"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="81%" height="35">&nbsp;</td>
                    <td width="10%"><input type="submit" value="添加" /></td>
                    <td width="9%"><input type="button" value="返回"  onclick="javascript:history.back()"/></td>
                  </tr>
              </table></td>
            </tr>

        </table>
	</form><!-- ========================结束=====================- -->
	
	
	<div id="post" style="position:absolute;left:320px;top:165px;display:none">
		<table bgcolor="#ffffff">
		<tr>
			<td class="body06" align="center"><a href="#" onclick="selectPost(1);">确定</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="selectPost(0);">取消</a></td>
		</tr>
		<tr>
			<td class="body04">检务</td>
		</tr>
		<tr>
			<td class="body06">
				<input type="checkbox" />报检岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />计费岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />签证岗&nbsp;&nbsp;
				<input type="checkbox" />放行岗&nbsp;&nbsp;
				<input type="checkbox" />档案管理岗&nbsp;&nbsp;<br/>
				<input type="checkbox" />流程管理岗&nbsp;&nbsp;
				<input type="checkbox" />证单管理岗&nbsp;&nbsp;
				<input type="checkbox" />印章管理岗&nbsp;&nbsp;
				<input type="checkbox" />综合管理岗
			</td>
		</tr>
		<tr>
			<td class="body04">食品</td>
		</tr>
		<tr>
			<td class="body06">
				<input type="checkbox" />报检岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />计费岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />签证岗&nbsp;&nbsp;
				<input type="checkbox" />放行岗&nbsp;&nbsp;
				<input type="checkbox" />档案管理岗&nbsp;&nbsp;<br/>
				<input type="checkbox" />流程管理岗&nbsp;&nbsp;
				<input type="checkbox" />证单管理岗&nbsp;&nbsp;
				<input type="checkbox" />印章管理岗&nbsp;&nbsp;
				<input type="checkbox" />综合管理岗
			</td>
		</tr>
		<tr>
			<td class="body04">动检</td>
		</tr>
		<tr>
			<td class="body06">
				<input type="checkbox" />报检岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />计费岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />签证岗&nbsp;&nbsp;
				<input type="checkbox" />放行岗&nbsp;&nbsp;
				<input type="checkbox" />档案管理岗&nbsp;&nbsp;<br/>
				<input type="checkbox" />流程管理岗&nbsp;&nbsp;
				<input type="checkbox" />证单管理岗&nbsp;&nbsp;
				<input type="checkbox" />印章管理岗&nbsp;&nbsp;
				<input type="checkbox" />综合管理岗
			</td>
		</tr>
		<tr>
			<td class="body04">植检</td>
		</tr>
		<tr>
			<td class="body06">
				<input type="checkbox" />报检岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />计费岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />签证岗&nbsp;&nbsp;
				<input type="checkbox" />放行岗&nbsp;&nbsp;
				<input type="checkbox" />档案管理岗&nbsp;&nbsp;<br/>
				<input type="checkbox" />流程管理岗&nbsp;&nbsp;
				<input type="checkbox" />证单管理岗&nbsp;&nbsp;
				<input type="checkbox" />印章管理岗&nbsp;&nbsp;
				<input type="checkbox" />综合管理岗
			</td>
		</tr>
		<tr>
			<td class="body04">财务</td>
		</tr>
		<tr>
			<td class="body06">
				<input type="checkbox" />报检岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />计费岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />签证岗&nbsp;&nbsp;
				<input type="checkbox" />放行岗&nbsp;&nbsp;
				<input type="checkbox" />档案管理岗&nbsp;&nbsp;<br/>
				<input type="checkbox" />流程管理岗&nbsp;&nbsp;
				<input type="checkbox" />证单管理岗&nbsp;&nbsp;
				<input type="checkbox" />印章管理岗&nbsp;&nbsp;
				<input type="checkbox" />综合管理岗
			</td>
		</tr>
		<tr>
			<td class="body04">统计</td>
		</tr>
		<tr>
			<td class="body06">
				<input type="checkbox" />报检岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />计费岗&nbsp;&nbsp;&nbsp;
				<input type="checkbox" />签证岗&nbsp;&nbsp;
				<input type="checkbox" />放行岗&nbsp;&nbsp;
				<input type="checkbox" />档案管理岗&nbsp;&nbsp;<br/>
				<input type="checkbox" />流程管理岗&nbsp;&nbsp;
				<input type="checkbox" />证单管理岗&nbsp;&nbsp;
				<input type="checkbox" />印章管理岗&nbsp;&nbsp;
				<input type="checkbox" />综合管理岗
			</td>
		</tr>
</table>
	</div>

</body>
</html>

