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
<body onload="getdata();">
<table  border="0" cellspacing="0" cellpadding="0">
      <tr>
    <td width="10%" height="401" rowspan="2" align="left" valign="top" bgcolor="#D8F0FD">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td background="../images/ht-body01.jpg" class="body02">当前位置：系统管理-学员管理-批量导入</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="body01"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="4" background="../images/ht-body02.jpg" class="body03">详细信息</td>
            </tr>
            
          <!-- 表单开始 -->
            <form action="inputUsersAction_inputexcel" method="post" enctype="multipart/form-data">
            
            <tr>
              <td colspan="4" align="center"><input type="file" name="userupload" /></td>
            </tr>
            <tr>
              <td colspan="4" class="body03"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="40%" height="35">&nbsp;</td>
                    
                    <!-- <td width="16%"><input type="image" src="../images/ht-but-add.jpg" name="Submit223"  onclick="alert('添加成功！');document.all.txtid.value='';document.all.txtname.value='';document.all.txtid.focus();"/></td> -->
                    <td width="20%"><input type="image" src="../images/ht-but-add.jpg" name="Submit223"/></td>
                    
                    <td width="20%"><input type="image" src="../images/ht-but-back.jpg" name="Submit23" onclick="window.history.back(1);return false;"/></td>
                  </tr>
                 
              </form><!-- 表单结束 --> 
                 
              </table></td>
            </tr>
        </table></td>
      </tr>
      
    </table>
</td>
</tr></table>
</body>
</html>