<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试成绩显示</title>

	<style>
		body{
			background: #fafafa;
		}
		li{
			list-style:none ;
			padding:5px;
			font-size:1.2em;
		}
		
		p{
			font-size:1.4em; /*浏览器默认16px=1em*/
		}
	
	   /*注意：给button设置样式，要加id*/
		#mybutton{
			margin-left:240px;
			background: #00cd00;
			width:80px;
			padding:5px 20px;
			border: 0px;
			color: white; /*字体颜色*/
			font-weight: bold;
			font-size: 16px;
		}
		
	
	</style>
</head>

<body topmargin="0" leftmargin="0">
	
	<div style="width:600px; margin:0 auto; margin-top:100px; padding:10px; border:1px solid #ccc; background-color: white" > 
		<!-- 按总分的比例来判断：优秀、良好、中等、及格 --> 
		<p>本次考试总分为：${totalScore }分， 你的成绩为${score }分,
			<c:if test="${score >= totalScore*0.9 }">成绩优秀！</c:if>
			<c:if test="${score >= totalScore*0.8 && score < totalScore*0.9}">成绩良好！</c:if>
			<c:if test="${score >=totalScore*0.6 && score < totalScore*0.8}">成绩合格！</c:if>
			<c:if test="${score < totalScore*0.6}">考试不合格，请下次重考!</c:if>
		</p>
		
		<ul>
			<li>总题数：${singletotal + mutipletotal }&nbsp;道</li>
			<li>单选题：${singletotal }&nbsp;道&nbsp;&nbsp;正确：${onecount }道&nbsp;&nbsp;错误：${error1 }道</li>
			<li>多选题：${mutipletotal }&nbsp;&nbsp;道&nbsp;&nbsp;&nbsp;正确：${twocount }道&nbsp;&nbsp;&nbsp;错误：${error2 }道</li>
			<li>合计得分：${onecount }*${singleScore } + ${twocount }*${multipleScore } = ${score }</li>
		</ul>	
		
		<!-- 点击确定后就去"我的成绩吧",去不成，跳出框架后没办法跳回来，只能重新进入了,/mywebtraining/uindex.jsp -->
		<input type="button" id="mybutton"  value="确&nbsp;&nbsp;定" onclick="window.location.href = '/mywebtraining/uindex.jsp'" />
		
		
	</div>
	
</body>

</html>
