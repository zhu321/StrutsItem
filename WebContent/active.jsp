<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户激活</title>

<!-- 引入jquery库 -->
<script type="text/javascript" src="JS/jquery-1.8.1.js"></script>

<!-- 单独写jquery代码 -->
<script type="text/javascript">
	//页面一加载就绑定click事件
	 $(function(){
		 
		 //页面一加载，文本框获取焦点
		 $("#uname").focus();
		
	});
	
	//ajax
	$(function(){
		$("#upass").blur(function(){
			//$("#check").html('');用不着该句
			$.ajax({
				//请求地址
				url:'checkActive_checkusers', //逗号分割
				//请求参数,ajaxname是传递给action的参数的名称，而不是下面的文本框的uname
				data:{ajaxuname:$("#uname").val(),ajaxupass:$("#upass").val()},
				//回调函数，一般只要求成功,,注意：此data 与上面的data是不一样的
				success:function(data){
					$("#check").html(data);
			
				}
				
				
			});
			
		});
		
		
	});
	
	
	//确认密码
	function confirmpass(){
		
		var newpass = $("#newpass").val();
		var okpass = $("#okpass").val();
		
		//清空提示
		$("#confirm").html('');
		
		//!okpass.equals(newpass)是错误写法
		if(okpass != newpass){
			$("#confirm").html("<font color='#EE0000' size='2'>*两次密码不一致</font>");
			//$("#okpass").focus();不获取焦点了
		}else{
			if(okpass.trim() != ''){
				$("#confirm").html("<font color='gray' size='2'>√</font>");	
			}
			
		}
	}
	

</script>

<style type="text/css">
body {
	background-color: #fafafa;
}

fieldset {
	width: 404px;
	padding: 20px;
	background-color: white;
}

label {
	width: 100px;
	text-align: right;
	float: left;
}

#myactive {
	margin-top:10px;
	margin-left:50px;
	height: 30px;
	width: 120px;
	border: 0px;
	color: white;
	background-color: #00cd00;
	font-weight: bold; /*加粗*/
	font-size: 16px;
}
</style>

</head>
<body>
	<!-- 激活提醒 -->
	${noactive }

	<div style="width:400px;margin:0 auto;margin-top:120px ">
		<form action="usersActive_active" method="post" >
			<fieldset>
			<legend>激活</legend>
			<p>
				<label>用户名：</label>
				<input type="text" name="uname" id="uname" />
			</p>
			<p>
				<label>初始密码：</label>
				<input type="password" name="upass" id="upass"/>
				<span id="check"></span>
			</p>
			<p>
				<label>新密码：</label>
				<input type="password" name="newpass" id="newpass" />
			</p>
			<p>
				<label>确认密码：</label>
				<input type="password" name="okpass" id="okpass" onblur="confirmpass()" />
				<span id="confirm"></span>
			</p>
			<p>
				<input type="submit" value="激&nbsp;&nbsp;活" id="myactive" />
			</p>
			</fieldset>
		</form>
	</div>

</body>
</html>