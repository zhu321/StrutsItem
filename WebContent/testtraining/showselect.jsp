<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center style="margin-top:80px;">
	<div style="border:1px solid #ccc;width:300px;height:70px;padding:50px;">
		
		<form action="testtrainingAction_training" target="_blank" method="post">
			<p>
				类型：<input type="radio" name="questionType" value="1" checked="checked" />单选
					<input type="radio" name="questionType" value="2" />多选
			</p>
			<p>
				方式：<input type="radio" name="pattern" value="1" checked="checked" />顺序
					<input type="radio" name="pattern" value="2" />随机
			</p>
			<p>
				<input type="submit" value="确定" />
			</p>
		</form>
	</div>
	<div style="border:1px solid #ccc;width:300px;heigth:150px;padding:50px;">
		<a href="autoCreateTestpaper_userMockExamination" target="_blank">模拟考试</a>
	</div>
</center>


</body>
</html>