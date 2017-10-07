<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加部门</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 引入jquery库 -->
<script type="text/javascript" src="../JS/jquery-1.8.1.js"></script>

<!-- 单独写jquery代码 -->
<script type="text/javascript">
	//页面一加载就绑定click事件
	 $(function(){
		 
		 //页面一加载，文本框获取焦点
		$("#dep_name").focus();
		 
	});

</script>


</head>
<body onload="getdata();">
<table  border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td width="10%" height="401" rowspan="2" align="left" valign="top" bgcolor="#D8F0FD">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td background="../images/ht-body01.jpg" class="body02">当前位置：系统管理-部门维护-添加部门</td>
            </tr>
        </table></td>
      </tr>
      
      
      <form action="operDeparmentAction_addDep" method="post">
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="4" background="../images/ht-body02.jpg" class="body03">详细信息</td>
            </tr>
            <tr>
              <td width="10%" class="body06">部门名称：</td>
              <td width="20%" class="body04"><input name="department.dep_name" id="dep_name" type="text" class="bodytext" /></td>
            </tr>
      
            <tr>
              <td colspan="4" class="body03">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="74%" height="35">&nbsp;</td>
                    <td width="13%"><input type="image" src="../images/ht-but-add.jpg" name="Submit223"  /></td>
                    <!-- onclick="alert('添加成功！');document.all.txtid.value='';document.all.txtname.value='';document.all.txtid.focus();" -->
                    <td width="13%"><input type="image" src="../images/ht-but-back.jpg" name="Submit23" onclick="window.history.back(1);"/></td>
                  </tr>
              </table></td>
            </tr>
            
            </form>
            
        </table></td>
      </tr>
      
    </table>
</td>
</tr></table>
</body>
