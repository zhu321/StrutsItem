<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登录</title>
<link href="css/htlogin.css" rel="stylesheet" type="text/css" />

<!-- 引入jquery库 -->
<script type="text/javascript" src="JS/jquery-1.8.1.js"></script>

<!-- 单独写jquery代码 -->
<script type="text/javascript">
	//页面一加载就绑定click事件
	 $(function(){
		 
		 //页面一加载，文本框获取焦点
		$("#m_name").focus();
		 
		//注意：type="image"是onclick事件
		$("#myreset").click(function(){
			$("#m_name").val(""); //val即可得到值，也可赋值
			$("#m_pass").val("");
			
			//再让文本框获取焦点
			$("#m_name").focus();
			
			return false;//重点
		});
		
		
		
	});

</script>

</head>

<body topmargin="0" leftmargin="0">

<!-- 登录错误提示 -->
${mloginerror }

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="768" align="center" valign="middle" background="images/bg.jpg" class="bodytable"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="550" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/top.jpg" width="550" height="103" /></td>
      </tr>
      <tr>
        <td><table width="550" border="0" cellspacing="0" cellpadding="0">
     
     
     <!-- ==================表单开始,带上回显========================= -->  
     <form action="managerLoginAction_mlogin" method="post">
          <tr>
            <td width="14"><img src="images/body01.jpg" width="14" height="230" /></td>
            <td width="530" align="left" valign="top" background="images/body-bg.jpg"><table width="516" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="images/body03.jpg" width="516" height="78" /></td>
              </tr>
              <tr>
                <td><table width="516" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="147"><img src="images/body04.jpg" width="147" height="127" /></td>
                    <td width="300" align="left" valign="top" background="images/body05.jpg"><table width="300" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="60" class="user01">用户名：</td>
                        <td colspan="2" align="left" valign="middle"><input id="m_name" name="m_name" value="${m_name }" type="text" class="user02" /></td>
                        </tr>
                      <tr>
                        <td class="user01">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                        <td colspan="2" align="left" valign="middle"><input id="m_pass" name="m_pass" value="${m_pass }" type="password" class="user02" /></td>
                        </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td width="70" height="30" valign="bottom"><input type="image" src="images/but-01.jpg"/></td>
                        <td width="161" valign="bottom"><input type="image" src="images/but-02.jpg" id="myreset"/></td>
                      </tr>
                </form><!-- ==========表单结束========== -->
                      
                      
                    </table></td>
                    <td width="69"><img src="images/body06.jpg" width="16" height="127" /></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td width="10"><img src="images/body02.jpg" width="15" height="230" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="left" valign="top"><table width="550" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="19"><img src="images/body07.jpg" width="19" height="236" /></td>
            <td width="525" background="images/body08.jpg">&nbsp;</td>
            <td width="10"><img src="images/body09.jpg" width="15" height="236" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
