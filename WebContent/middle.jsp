<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东检验检疫（检务）网上培训系统后台管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/htlogin.css" rel="stylesheet" type="text/css" />
<script>
<!--
	function dis()
	{
		shift_status();	
	}
	
	var flag=true;
	function shift_status()
	{
		var mainFrame = top.document.getElementsByName("fs")[0];
		if(flag)
		{
			mainFrame.cols = "0,8,*";			
			document.getElementById("menuSwitch1").title='显示';
		}
		else
		{
			mainFrame.cols = "220,8,*";
			document.getElementById("menuSwitch1").title='隐藏';
		}

		flag = !flag;
	}
//-->
</script>
</head>

<body>
<table height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
     <td width="100%" height="465" align="left" background="images/ht-leftbg.jpg">
	    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
	          <td width="11" height="100%" rowspan="5" align="center" valign="middle">
		          <a title="隐藏" id="menuSwitch1" href="javascript:dis();">
				    <img src="images/ht-leftr-but.jpg" width="8" border="0" />
				  </a>
               </td>
	       </tr>
	   </table>
    </td>
   </tr>
</table>
</body>