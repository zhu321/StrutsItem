<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东检验检疫（检务）网上培训系统后台管理系统</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 是一个日期插件，将以前datepacker文件夹的删除，将My97DatePicker文件夹复制过来，修改路径 -->
<link href="/mywebtraining/My97DatePicker/skin/default/datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mywebtraining/My97DatePicker/WdatePicker.js"></script>

<!-- 导入jquery库 -->
<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>

</head>

<body topmargin="0" leftmargin="0">


	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="4" background="/mywebtraining/images/ht-body02.jpg" class="body03">详细信息</td>
            </tr>
           
            <!-- =================================================- -->
            <form action="optUsersAction_updateUsers" method="post">
            
            	<!-- 加多1个隐藏域，把当前页传递走，OperUsersAction只负责转发，真正接收的是SelectAllUsersAction -->
            	<input type="text" name="page" value="${param.page }" />
            	
            	<!-- 将所有的条件都放入隐藏域里,它是跟SelectAllUsersAction的参数对应的(只是条件)，不是从items="${userslist }"集合里面取的 -->
            	<input type="hidden" name="users.u_id" value="${param.u_id }" />
            	<input type="hidden" name="users.dep_id" value="${param.dep_id }" />
            	<input type="hidden" name="users.edu_id" value="${param.edu_id }" />
            	<input type="hidden" name="users.major_id" value="${param.major_id }" />
            	<input type="hidden" name="users.u_name" value="${param.u_name }" />
            	<input type="hidden" name="users.u_sex" value="${param.u_sex }" />
            	<input type="hidden" name="u_birth1" value="${param.u_birth1 }" />
            	<input type="hidden" name="u_birth2" value="${param.u_birth2 }" />
            	<input type="hidden" name="active_time1" value="${param.active_date1 }" />
            	<input type="hidden" name="active_time2" value="${param.active_date2 }" />
            	
            
             <tr>
              <td width="15%" class="body06">编号(readonly)：</td>
              <td width="33%" class="body04"><input name="operusers.u_id" value="${editusers1.u_id }" type="text" readonly="readonly"/></td>
              <td width="15%" class="body06">用户名：</td>
              <td width="33%" class="body04"><input name="operusers.u_name" value="${editusers1.u_name }" type="text" /></td>
              </tr>
            <tr>
              <td width="16%" class="body06">密码：</td>
              <td width="36%" class="body04"><input name="operusers.u_pass" value="${editusers1.u_pass }" type="text" /></td>
              <td class="body06">性别：</td>
              <td class="body04"><input type="text" name="operusers.u_sex" value="${editusers1.u_sex }"/>
            </tr>
            <tr>
            	<td class="body06">出生日期：</td>
              	<td class="body04"><input name="operusers.u_birth" value="${editusers1.u_birth }" type="text"/></td>
             	<td width="21%" class="body06">所属部门：</td>
              	<td width="23%" class="body04"><input type="text" name="operusers.dep_id" value="${editusers1.dep_id }"/></td>
             </tr>
            <tr> 
            	<td class="body06">学历：</td>
              <td class="body04"><input type="text" name="operusers.edu_id" value="${editusers1.edu_id }"/></td>
              <td class="body06">专业：</td>
              <td class="body04"><input type="text" name="operusers.major_id" value="${editusers1.major_id }"/></td>
              </tr>
              
            <tr> 
            	<td class="body06">激活状态(readonly)：</td>
              <td class="body04"><input type="text" value="${editusers1.active_state }" readonly="readonly"/></td>
              <td class="body06">激活日期(readonly)：</td>
              <td class="body04"><input type="text"  value="${editusers1.active_time }" readonly="readonly"/></td>
              </tr>
              
              
            <tr> 
            	<td class="body06">最后登录时间(readonly)：</td>
              <td class="body04"><input type="text" value="${editusers1.last_login }" readonly="readonly"/></td>
              <td class="body06">登录次数(readonly)：</td>
              <td class="body04"><input type="text" value="${editusers1.login_times }" readonly="readonly"/></td>
              </tr>
            
            <tr>
              <td colspan="4" class="body03"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="81%" height="35">&nbsp;</td>
                    <td width="10%">
                    
                    <input type="image" src="/mywebtraining/images/ht-but-save.jpg" name="Submit22"/></td>
            
             </form><!-- ===========表单结束，不要到下面结束，因为下面的type="image"会影响表单的提交=============== -->
                    
                    <td width="9%"><input type="image" src="/mywebtraining/images/ht-but-back.jpg" name="Submit23"  onclick="javascript:history.back()"/></td>
                  </tr>
              </table></td>
            </tr>

        </table>
	

</body>
</html>

