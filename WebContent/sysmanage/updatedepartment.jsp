<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改部门</title>
<link href="../css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 引入jquery库 -->
<script type="text/javascript" src="../JS/jquery-1.8.1.js"></script>



</head>
<body onload="getdata();">
<table  border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td width="10%" height="401" rowspan="2" align="left" valign="top" bgcolor="#D8F0FD">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td background="../images/ht-body01.jpg" class="body02">当前位置：系统管理-部门维护-修改部门</td>
            </tr>
        </table></td>
      </tr>
      
      <!-- ===========================注意jsp到jsp,数据接收用 param.参数============================================= -->
            
      <form action="operDeparmentAction_updateDep" method="post">
      
      <!-- 查询的条件放入隐藏域里面 -->
      <input type="text" name="selectdepart.dep_id" value="${param.sdep_id }" />
      <input type="text" name="selectdepart.dep_name" value="${param.sdep_name }" />
      
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="4" background="../images/ht-body02.jpg" class="body03">修改部门</td>
            </tr>
            <tr>
              <td width="10%" class="body06">部门代码：</td>
              <td width="20%" class="body04">
              <input name="department.dep_id" value="${param.dep_id }" type="text" class="bodytext" readonly /></td>
            </tr>
            
            <tr>
              <td width="10%" class="body06">部门名称：</td>
              <td width="20%" class="body04">
              <input name="department.dep_name" value="${param.dep_name }" type="text" class="bodytext" /></td>
            </tr>
      
            <tr>
              <td colspan="4" class="body03">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="74%" height="35">&nbsp;</td>
                    <td width="13%"><input type="image" src="../images/ht-but-adit.jpg"/></td>
                    <td width="13%"><input type="image" src="../images/ht-but-back.jpg" onclick="window.history.back(1);"/></td>
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
