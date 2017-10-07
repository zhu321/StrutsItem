<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学员管理</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 是一个日期插件，将以前datepacker文件夹的删除，将My97DatePicker文件夹复制过来，修改路径 -->
<link href="/mywebtraining/My97DatePicker/skin/default/datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mywebtraining/My97DatePicker/WdatePicker.js"></script>

<!-- 导入jquery库 -->
<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>

<script>

	$(function(){
		//重置功能
		$("#myreset").click(function(){
			$("#uid").val('');
			$("#uname").val('');
			
			//设置下拉列表别选中
			//jquery提供了val()方法设置或返回表单字段的值，因此将下拉框的某元素设为当前选中值，只需设置用val()方法设置下拉框的值即可。
			 $("#selector1").val("0");
			 $("#selector2").val("0");
			 $("#selector3").val("0");
			
			 //设置单选按钮
			 $("#radio").attr("checked",true);
			
			$("#u_birth1").val('');
			$("#u_birth2").val('');
			$("#startDate").val('');
			$("#endDate").val('');
		});
		
	});


	//全选按钮
	/* function checkalluid(){
		var checkall = document.getElementById("checkall");
		
		var checkuser = document.getElementsByName("checkuser");
		
		for(var i=0;i<checkuser.length;i++){
			checkuser[i].checked = checkall.checked;
		}
		
	} */
	
	$(function(){
		$("#selectAll").click(function() {
			//这里也可以直接用this,原生js语句 
			if ($(this)[0].checked) {
				$('[name=checkuser]:checkbox').attr("checked", true);
			} else {
				$('[name=checkuser]:checkbox').attr("checked", false);
			}
		});
		
	

		 //删除选中的用户
		$("#delselectusers").click(function() {

			var selectuid = "";  //千万注意不是String selectuid;
			
			//var myanswer = $("input[name='question1']:checked").val();可用
			//var myanswer = $("input[name='question"+start+"']:checked").val();获取参数也行start
			
			//获取选择的用户id,,循环遍历
			$("[name=checkuser]:checkbox").each(function(i, obj) {
				if(this.checked){
					if (i == 0) {
						selectuid += obj.value;
					} else {
						selectuid += "," + obj.value;
					}
				}
				
			});

			//给隐藏域赋值
			$("#checkuid").val(selectuid);
			
			//获取page的值
			var hidePage = $("#hidePage").val();
			
			//提交表单
			$("#myform").action = "optUsersAction_delUsersBySelect?page="+hidePage;//更改提交路径
			$("#myform").submit();

		}); 
		

	});

	/* $("input:checkbox:checked").val()
	或者
	$("input:[type='checkbox']:checked").val();
	或者
	$("input:[name='ck']:checked").val();//此写法可能有些问题 */

	
	
</script>


<style type="text/css">
	#uname{
		width:56%;
		margin-right:5px;
	}
</style>



</head>





<body topmargin="0" leftmargin="0">
<!--用来接收批量导入后返回到该页面时，提示导入成功或失败的信息 -->
${inputusersMessage }


<table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td background="/mywebtraining/images/ht-body01.jpg" class="body02">当前位置：系统管理-学员信息维护</td>
            </tr>
        </table></td>
      </tr>
      
      
      <tr>
        <td class="body01">
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        
        	<!-- page隐藏域，删除选中时用 -->
     	 	<input type="hidden" id="hidePage" value="${page }" />
        
         <!-- ================================注意表单================================= -->
     	 <form action="selectUsersAction_selectusers" id="myform" method="post">
     	 
     	 	<!-- 加多两个隐藏域(注意page隐藏域不能写到表单里面，会影响条件查询)，作为下面的删除选中的用 -->
     	 	<input type="hidden" name="checkuid" id="checkuid"> <!-- 通过js获取值，然后赋值 -->
            
            <tr>
              <td colspan="4" background="/mywebtraining/images/ht-body02.jpg" class="body03">查询条件</td>
            </tr>
            <tr> 
              <td width="25%" class="body06">学员编号：</td>  <!-- 编号是唯一的，回显没有意义 -->
              <td width="27%" class="body04"><input name="users.u_id" id="uid" type="text" class="bodytext" /></td>
              <td width="21%" class="body06">所属部门：</td>
              <td width="23%" class="body04">
              <select name="users.dep_id" id="selector1" class="bodytext01" id="depid">
                <option value="0" ${users.dep_id == 0? 'selected':'' }>- 不限 -</option>
                
                <c:forEach items="${deplist }" var="department">
                	<option value="${department.dep_id }" ${users.dep_id==department.dep_id? 'selected':'' }>${department.dep_name }</option>
                </c:forEach>
                
              </select></td>
            </tr>
            
            <tr>
              <td class="body06">学员学历：</td>
              <td class="body04"><select name="users.edu_id" id="selector2" class="bodytext01">
                <option value="0" ${users.edu_id == 0? 'checked':'' }>- 不限 -</option>
                
                <c:forEach items="${edulist }" var="educational">
                	<option value="${educational.edu_id }" ${users.edu_id==educational.edu_id? 'selected':'' } >${educational.edu_name }</option>
                </c:forEach>
                
              </select></td>
               <td class="body06">学员专业：</td>
              <td class="body04"><select name="users.major_id" id="selector3" class="bodytext01">
                <option value="0" ${users.major_id==0? 'checked':'' }>- 不限  -</option>
                
                <c:forEach items="${majorlist }" var="major">
                	<option value="${major.major_id }" ${users.major_id==major.major_id?'selected':'' }>${major.major_name }</option>
                </c:forEach>
                
              </select>              
              </td>
            </tr>
           
            <tr>
              <td class="body06">学员姓名：</td>
              <td class="body04">
              <input name="users.u_name" value="${users.u_name }" type="text"  id="uname" />  <!-- class="bodytext" -->
              </td>
              
              <td class="body06">性别：</td>
              <td class="body04"><input type="radio" name="users.u_sex" value="男" ${users.u_sex == '男'?'checked':'' }/>男
              <input type="radio" name="users.u_sex" value="女" ${users.u_sex == '女'?'checked':'' }/>女
              <input type="radio" name="users.u_sex" id="radio" value="" ${users.u_sex == ''?'checked':'' }/>不限
              </td>
            </tr>
			 <tr>
              <td class="body06">生日时间从：</td>
              <td class="body04"><input name="u_birth1" id="u_birth1" value="${u_birth1 }" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen'})" />
              </td>
              <td class="body06">到：</td>
              <!-- <td class="body04"><input name="u_birth2" type="text" class="Wdate" onfocus="new WdatePicker(this)"/></td> -->
              <td class="body04"><input name="u_birth2" id="u_birth2" value="${u_birth2 }" type="text" class="Wdate" onfocus="WdatePicker({skin:'whyGreen'})"/></td>
			 </tr>
			 <tr>
              <td class="body06">激活时间从：</td>
              <td class="body04"><input name="active_time1" value="${active_time1 }" type="text" id="startDate" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\') || \'new Date()\'}'})"/></td>
              <td class="body06">到：</td>
              <td class="body04"><input name="active_time2" value="${active_time2 }" type="text" id="endDate" class="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'new Date()'})" /></td>
			 </tr>
			
            <tr>
              <td colspan="4" class="body03">
	              <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td width="60%" height="35">&nbsp;</td>
	                  
	                   <!-- 查询按钮，提交表单 ，63行-->
	                   	<td width="6%"><input type="button" value="&nbsp;&nbsp;重&nbsp;置&nbsp;&nbsp;" id="myreset" /></td>
	                    <td width="10%"><input type="image" src="/mywebtraining/images/ht-but-check.jpg" name="Submit222" /></td>
	     
	      </form> <!-- ==================表单结束,因为下面的会影响到表单的提交================== -->
	                    
	                    <!-- 批量导入，onclick="window.document.location='inputmoreuser.jsp';" -->
	                    
	                   <td width="11%"><input type="image" src="/mywebtraining/images/ht-but-pldr.jpg" name="Submit224" onclick="window.document.location='/mywebtraining/usermanage/inputmoreuser.jsp';"/></td>
	                  
	                  <!--   添加按钮，onclick="window.document.location='editstu.html'" -->
	                    <td width="10%"><input type="image" src="/mywebtraining/images/ht-but-add.jpg" name="Submit223"  onclick="window.document.location='/mywebtraining/usersConditionAction_getconditions?conditionFlag=1'"/></td>
	                   
	                    <!-- 删除按钮 -->
	                    <!-- <td width="9%"><input type="image" src="/mywebtraining/images/ht-but-del.jpg" name="Submit224" /></td>
	                  -->
	                  </tr>
	              </table>
              </td>
           
            </tr>
            
             
            
        </table></td>
      </tr>
      <tr>
        <td class="body01a">
        
        <!-- 标识符 -->
        <c:if test="${empty uflag }">
        	<!-- 显示查询结果的table， -->
        <table width="100%" border="1" bordercolor="#97B1D4"  cellspacing="0" cellpadding="0" style="font-family:'宋体'">
           
           
            <tr>
              <td colspan="4" background="/mywebtraining/images/ht-body02.jpg" class="body03"><h3>查询结果</h3> 
              <td colspan="10" background="/mywebtraining/images/ht-body02.jpg" class="body03">
              	<!-- 测试一下jstl能不能得到数据 -->
					<c:if test="${empty userslist }">
						<h3>当前还没有数据！</h3>
					</c:if>
              
              </td>	
            </tr>
        
         
         
         <%-- <s:if test="userslist==null || userslist.isEmpty()">
         	you
         </s:if> --%>
            
     <c:if test="${not empty userslist }">
             
            <tr style="background-color: #5DC7FB;font-size:14px;font-weight:bold; height:30px;color:white;">
              <td align="center">
              	<input type="checkbox" name="selectAll" id="selectAll" />全选
              </td>
              <td align="center">编号</td>
			  <td align="center">用户名</td>
              <td align="center">密码</td>
              <td align="center">性别</td>
              <td align="center">生日</td>
              <td align="center">部门</td>
              <td align="center">学历</td>
              <td align="center">专业</td>
              <td align="center">激活状态</td>
              <td align="center">激活日期</td>
              <td align="center">最后登录时间</td>
              <td align="center">登录次数</td>
			  <td align="center">操&nbsp;&nbsp;作</td>
            </tr>
      
      <!-- ===========================注意表单放到循环外面============================ -->
      
     	<c:forEach items="${userslist }" var="myusers" varStatus="idx" >
            
            	<!-- 给行设置不同的样式 -->
            	<!-- 偶数行 -->
            	<c:if test="${idx.index mod 2 eq 1 }">
            		 <tr style="background-color:#9FD6FF">
            	</c:if>
            	
            	<!-- 奇数行 -->
            	<c:if test="${idx.index mod 2 eq 0 }">
            		 <tr style="background-color:#D8F0FD">
            	</c:if>
            	
	              <td height="35" align="center">
	              	<!-- 复选框value="${users.u_id } -->
	              	<input type="checkbox" name="checkuser" value="${myusers.u_id }" />
	              </td>
	              
	              <td align="center"><a href="stuinfo.html">${myusers.u_id }</a></td>
	              <td align="center">${myusers.u_name }</td>
	              <td align="center">${myusers.u_pass }</td>
	              <td align="center">${myusers.u_sex }</td>
	              <td align="center">${myusers.u_birth }</td>
				  <td align="center">${myusers.dep_id }</td>
				  <td align="center">${myusers.edu_id }</td>
				  <td align="center">${myusers.major_id }</td>
				  <td align="center">${myusers.active_state }</td>
				  <td align="center">${myusers.active_time }</td>
				  <td align="center">${myusers.last_login }</td>
				  <td align="center">${myusers.login_times }</td>
				  <td align="center" nowrap="nowrap">
			 
			
				
				 <!-- 删除用户，在哪一页删除就要回到哪一页去,试试用button来提交 -->
				 <%--  <input type="button" value="delete" onclick="submitForm('${users.u_id }')"/> --%>
			
			<!-- 关于当前查询的条件，OperUsersAction只负责转发，真正接收的是SelectAllUsersAction -->
			<input type="image" src="/mywebtraining/images/ht-but-del.jpg" 
				onclick="window.location='optUsersAction_delOneusers?operusers.u_id=${myusers.u_id }&users.u_id=${users.u_id }&users.dep_id=${users.dep_id }&users.edu_id=${users.edu_id }&users.major_id=${users.major_id }&users.u_name=${users.u_name }&users.u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }&page=${page }'"/>
			
			
			<input type="image" src="/mywebtraining/images/ht-but-adit.jpg" 
				onclick="window.location='optUsersAction_selectOneUsers?operusers.u_id=${myusers.u_id }&u_id=${users.u_id }&dep_id=${users.dep_id }&edu_id=${users.edu_id }&major_id=${users.major_id }&u_name=${users.u_name }&u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }&page=${page }'"/>
	
	            
	            </tr>
   
            
            <!-- foreach到此结束-->
            </c:forEach>
           
           
           
           <!-- 因为foreach已经结束，所以超链接的值要从action中获取 -->
            <tr>
              <td colspan="14" class="body03">
              	<div style="float:left;">
              		<!-- 选择删除用户，利用上面的条件回显 -->
              		<input type="button" id="delselectusers" value="删除选中" />
              		
              	</div>
				<div style="float:right; margin-right:15px">
					<span style="padding-right:8px">
					
						<a href="selectUsersAction_selectusers?users.u_id=${users.u_id }&users.dep_id=${users.dep_id }&users.edu_id=${users.edu_id }&users.major_id=${users.major_id }&users.u_name=${users.u_name }&users.u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }&page=1">首页</a>
						<!-- 用jstl来判断 -->
						<c:if test="${page == 1 }"> <!-- 如果是第一页，就没有上一页 -->
							<a><font color='gray'>上一页</font></a>
						</c:if>
						<c:if test="${page > 1 }">
							<a href="selectUsersAction_selectusers?users.u_id=${users.u_id }&users.dep_id=${users.dep_id }&users.edu_id=${users.edu_id }&users.major_id=${users.major_id }&users.u_name=${users.u_name }&users.u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }&page=${page-1 }">上一页</a>
						</c:if>
						
						<c:if test="${page == maxpage }">
							<a><font color='gray'>下一页</font></a>
						</c:if>
						<c:if test="${page != maxpage }">
							<a href="selectUsersAction_selectusers?users.u_id=${users.u_id }&users.dep_id=${users.dep_id }&users.edu_id=${users.edu_id }&users.major_id=${users.major_id }&users.u_name=${users.u_name }&users.u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }&page=${page+1 }">下一页</a>
						</c:if>
						
						<a href="selectUsersAction_selectusers?users.u_id=${users.u_id }&users.dep_id=${users.dep_id }&users.edu_id=${users.edu_id }&users.major_id=${users.major_id }&users.u_name=${users.u_name }&users.u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }&page=${maxpage }">尾页</a>
						&nbsp;第${page }页/共${maxpage }页&nbsp;&nbsp;共${total }条记录
					
					 <!-- ============================注意表单================================ -->
					<!-- 注意转到多少页也要把所有的条件参数带上，不然获取不到 -->
					<form style="display:inline" action="selectUsersAction_selectusers?users.u_id=${users.u_id }&users.dep_id=${users.dep_id }&users.edu_id=${users.edu_id }&users.major_id=${users.major_id }&users.u_name=${users.u_name }&users.u_sex=${users.u_sex }&u_birth1=${u_birth1 }&u_birth2=${u_birth2 }&active_time1=${active_time1 }&active_time2=${active_time2 }" method="post">
						<input type="text" name="skipPage" size="5" />
						<input type="submit" value="转到.." />
					</form><!-- ===========结束============= -->
					</span>
				</div>

			  </td>
            </tr>
            
             
        </table>
        
        </c:if>
        </c:if>
        
            
        
       
        
        </td>
      </tr>
    </table>
</body>
</html>

