<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上培训系统</title>

<!-- 引入jquery库 -->
<script type="text/javascript" src="JS/jquery-1.8.1.js"></script>

<!-- 单独写jquery代码 -->
<script type="text/javascript">
	//页面一加载就绑定click事件
	 $(function(){
		 
		 //页面一加载，文本框获取焦点
		 $("#uname").focus();
		
	});

</script>

<style>
*{
	padding:0px;
	margin:0px;
	}

body{
	font-family:Arial, Helvetica, sans-serif;
	background:url(images/login/backlogin.jpg) no-repeat  center;
	font-size:13px;    
	}
img{
	border:0;
	}
.lg{width:468px; height:468px; margin:100px auto; background:url(images/login/login.png) no-repeat;}
.lg_top{ height:200px; width:468px;}
.lg_main{width:400px; height:180px; margin:0 25px;}
.lg_m_1{
	width:290px;
	height:100px;
	padding:60px 55px 20px 55px;
}
.ur{
	height:37px;
	border:0;
	color:#666;
	width:236px;
	margin:4px 28px;
	background:url(images/login/user.png) no-repeat;
	padding-left:10px;
	font-size:16pt;
	font-family:Arial, Helvetica, sans-serif;
}
.pw{
	height:37px;
	border:0;
	color:#666;
	width:236px;
	margin:4px 28px;
	background:url(images/login/password.png) no-repeat;
	padding-left:10px;
	font-size:16pt;
	font-family:Arial, Helvetica, sans-serif;
}
.bn{margin-top:17px;margin-left:5px;width:330px; height:72px; background:url(images/login/enter.png) no-repeat; border:0; display:block; font-size:18px; color:#FFF; font-family:Arial, Helvetica, sans-serif; font-weight:bolder;}
.lg_foot{
	height:80px;
	width:330px;
	padding: 6px 68px 0 68px;
}

#codeinput{
	width:58px;
	height:26px;
	font-size:14pt;
	font-family:Arial, Helvetica, sans-serif;
	margin-right:10px;
}

</style>
</head>

<body class="b">
<!-- 用户名或密码错误提示 -->
${errorlogin }
${noactive }
<!-- 激活后来登录 -->
${activesuccess }

<!--激活图片 -->
<div style="float:right;margin-top:-80px;margin-right:20px">
	<input type="image" src="images/login/active.gif" onclick="window.location = 'active.jsp'" />
</div>


<div class="lg">

<form action="userslogin_login" method="POST">
    <div class="lg_top"></div>
    <div class="lg_main">
        <div class="lg_m_1">
        
        <input type="text" name="uname" id="uname" value="${uname }" class="ur" />
        <input type="password" name="upass" value="${upass }" class="pw" />
        
        <div style="margin-left:28px;margin-top:5px; height:50px;width:280px;">
        	<div style="float:left;width:200px;">
		        <input type="text" name="code" maxlength="4" id="codeinput"/>
		       	<img src="checkcode_getCode" id="pic" style="position:absolute;"/>
		   		<a href="#" style="float:right;" onclick="javascript:document.getElementById('pic').src='checkcode_getCode?rand='+new Date()" >换一张</a>  <!-- 加一个时间戳，防止缓存 -->
	   		</div>
	   		<span style="float:right;">${errorcode }</span>
        </div>
        
                
    </div>
    </div>
    <div class="lg_foot">
    <input type="submit" value="登&nbsp;录" class="bn" /></div>
</form>
</div>

</body>
</html>
