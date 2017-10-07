<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题库训练</title>

<!-- 引入jquery库 -->
<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>

<style type="text/css">
.mytable {
	display: none;
	width: 500px;
	padding: 4px;
}

/*注意：给button设置样式，要加class*/
.mybutton {
	background:#50c2ff;/*#50c2ff,33b4fa*/
	width: 100px;
	height:40px;
	border: 0px;
	color: white; /*字体颜色*/
	font-weight: bold;
	font-size: 16px;
}
</style>

</head>


<body>
<div>
	<h3>题库训练>单选/
		<c:if test="${pattern==1 }">顺序</c:if>
		<c:if test="${pattern==2 }">随机</c:if>
	</h3>
</div>


<div style="width:634px;margin:0 auto;margin-top:30px;">

<div id="divstyle">
	<input type="hidden" id="totalId" value="${traininglist.size() }" />
	<input type="hidden" id="totalId1" value="${traininglist.size()+1 }" />

	<c:forEach items="${traininglist }" var="choicebank" varStatus="idx">
		<!-- 把答案放入隐藏域 -->
		<input type="hidden" id="answer${idx.index+1 }" value="${choicebank.choice_answer }" />
		<table border="0" id="${idx.index+1}" class="mytable" >
			<tr>
				<td colspan="2">${idx.index+1}/${traininglist.size() } . ${choicebank.choice_content }</td>
			</tr>
			<tr>
				<td width="2%"><input type="radio" value="A" name="question${idx.index+1}" /></td>
				<td width="98%">A.${choicebank.choice_A }</td>
			</tr>
			<tr>
				<td><input type="radio" value="B" name="question${idx.index+1}"  /></td>
				<td>B.${choicebank.choice_B }</td>
			</tr>
			<tr>
				<td><input type="radio" value="C" name="question${idx.index+1}" /></td>
				<td>C.${choicebank.choice_C }</td>
			</tr>
			<tr>
				<td><input type="radio" value="D" name="question${idx.index+1}" /></td>
				<td>D.${choicebank.choice_D }</td>
			</tr>
		</table>

	</c:forEach>
	
	<div style="margin-top:10px; ">
		<p>
			<input type="button" class="mybutton" value="上一题" id="upQuestion"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="mybutton" value="下一题" id="downQuestion" />
			
			<input type="button" class="mybutton" value="展开答题卡" id="spread" style="float:right">
		</p>
		
		<p>
			<input type="checkbox" id="autoNext" /> 答对自动下一题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			答对【<span id="rightSpan"></span>】道&nbsp;&nbsp;&nbsp;
			答错【<span id="wrongSpan"></span>】道&nbsp;&nbsp;&nbsp;
			正确率<span id="accuracySpan"></span>% <!-- 对/(对+错) -->
		</p>
		
	</div>
	
	
	<!-- 答题卡 -->
	<div id="showIds" style="display:none;">
		<!-- Table显示滚动条，要先把table放到一个div中，div的长度和宽度要固定，控制overflow属性为scroll现在只要table的长度或是宽度大于div的长度或是宽度，滚动条就显示出来了。 -->
		<div style="width:634px; height:166px; overflow:auto;text-align:center; ">
			<table style="border-collapse:collapse ">
				
				<!-- 每行显示 -->
				<c:forEach items="${traininglist }" varStatus="number">
					
					<c:if test="${number.index mod 15 eq 0 }">
						<tr>
					</c:if>
					
					<td id="mytd${number.index+1 }" style="border:1px solid #ccc;width:38px;height:30px">${number.index+1 }</td>
					
					<c:if test="${number.index mod 15 eq 14 }">
						</tr>
					</c:if>
					
					
				
				</c:forEach>
			
			</table>
		</div>
		
	</div>
	
	
</div>

</div>

<script type="text/javascript">
	$(function(){
		
		//全局变量
		//关键变量，通过对它的控制来是实现上一题和下一题
		var start = 1;
		
		var total =  $("#totalId").val();

	
		//注意total+1，直接加1,会当做字符串相加
		//采取另一种方式，通过页面控制
		var total1 = $("#totalId1").val();
		
		
		//通过循环给<td>注册点击事件
		 for(var i=0;i<total1;i++){
			
			$("#mytd"+i).click(function(){
				
				if(start==total1){
					start--;
				}
				//将当前的隐藏，点击的显示
				$("#"+start).stop().hide();
				//$("#"+i).stop().show(); //这样写是错的，因为i已经到最后了，不可能动态改变
				
				//alert(this.innerHTML);解决办法
				//$("#"+this.innerHTML).stop().show();
				
				//改为jquery写法
				var aaa = $(this).html();
				$("#"+aaa).stop().show();
				
				//注意start重新赋值
				//start = this.innerHTML;
				start = aaa;
			});
			
		}
		
		
		//默认显示第一题
		$("#"+start).stop().show();
		
		//给上一题和下一题注入click事件
		$("#upQuestion").click(function(){
			if(start!=1) $("#"+start).stop().hide();
			
			start--;
			
			if(start==0){
				alert("已是第一道题");
				start = 1;//将start重置为1
			}else{
				$("#"+start).stop().show();
			}
			
			
			
		});
		
		
		$("#downQuestion").click(function(){
			if(start!=total) $("#"+start).stop().hide();
			
			start++;
			if(start>total){
				alert("已是最后一道题...");
			}else{
				$("#"+start).stop().show();
			}
			
			
		});
	
		
		 //全局变量,,注意不是java,不要写int,犯了几次错了
		/* int right = 0;
		int wrong = 0; */
		var right = 0;
		var wrong = 0;
		var accuracy = 100;
		//初始化的值
		$("#rightSpan").html("<font color='blue'>"+right+"</font>");
		$("#wrongSpan").html("<font color='#EE0000'>"+wrong+"</font>");
		$("#accuracySpan").html(accuracy);

		//给radio注册点击事件
		$("input:radio").click(function(){
			
			//点击后就不能再点击了
			$("input[name='question"+start+"']").attr("disabled",true);
			
			//获取相应id的正确答案,start与隐藏域id是对应的
			var answer = $("#answer"+start).val();
			
			
			//$('input:radio:checked').val();直接得到不行，只会得到第一题的答案，，要根据name来获取用户的答案
			//获取用户的答案
			var myanswer = $("input[name='question"+start+"']:checked").val();
			
			//$('input[name="testradio"]:checked').val();
			
			//$('input[name="testradio"]').filter(':checked');该方式还未测试
			
			//如果做对了
			if(myanswer==answer){
				right++;
				$("#rightSpan").html("<font color='blue'>"+right+"</font>");
				
				//答题卡的颜色
				$("#mytd"+start).css("background","#C6E2FF");
				
				//如果选中了复选框
				//$("input[type='checkbox']").is(':checked')
				if($('#autoNext').is(':checked')){
					if(start!=total) $("#"+start).stop().hide();
					start++;
					if(start>total){
						alert("已是最后一道题...");
					}else{
						$("#"+start).stop().show();
					}
				}
				
				
			}else{
				//答题卡的颜色
				$("#mytd"+start).css("background","#FF8C69");
				
				wrong++;
				$("#wrongSpan").html("<font color='#EE0000'>"+wrong+"</font>");
			} 
			
			var aaa = right/(right+wrong);
			accuracy = parseFloat(aaa.toFixed(2))*100;  //格式化一下，该函数暂时可能会有些问题
			
			//正确率
			$("#accuracySpan").html(accuracy);
			
			

		});
		
		
		
		
		
		
		//注意给$("#spread")绑定toggle事件，
		
		 //切换样式//$(selector).toggle(function1(),function2(),functionN(),...)
		$("#spread").toggle(function(){
			$("#showIds").show();
			//字 换为收起答题卡
			$("#spread").val("收起答题卡"); //注意是双引号
			
			},function(){
				$("#showIds").hide();
				
				$("#spread").val("展开答题卡"); 
				
			}
		
		); 
		
		
	});
	

</script>


</body>
</html>