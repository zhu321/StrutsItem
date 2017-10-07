<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户在线考试</title>

<!--该句只是导库-->
	<script type="text/javascript" src="/JS/jquery-1.8.1.js"></script>
	
	<script type="text/javascript">
	
	//把获取单选和多选的答案单独写一个方法，下面当考试时间结束时，也要获取答案提交表单
	function getsingleanswer(){
		// $("input[type='radio']").each(function (i){});
				
				//应该获取所有的radio,然后每4题判断一下有没有按钮被选中
				
				var j = 0;//计数
				var slength =  $("input:radio").length;
				
				var singlestr = "";
				$("input:radio").each(function(i, obj){
					
					//根据索引判断时第几道题,每道题都判断,i从0开始，为了方便判断 +1
					if( 0 <= (i+1) % 4 < 4){
						if(obj.checked){
							singlestr += obj.value;
							
						}else{
							j++;
							//还要再判断，j==4表示该题没做
							if(j==4)	singlestr += "null";
						} //else结束  
						
						//另外一个if
						//注意：只要(i+1) % 4 == 0即表示一道题完了，，此处是重点
						if ((i + 1) % 4 == 0){
							j = 0; //j重置为0
							
							//每题结束后加一个分号，再判断一下最后一不加分号
							if(i != slength-1) singlestr += ",";
						}
							

					}//if( 0 <= (i+1) % 4 < 4)结束

				}); //循环结束

				//alert(singlestr);
				$("#singleanswer").val(singlestr);//给隐藏域赋值
				
	}
	
	
	function getmultipleanswer(){
		
				//获取复选框的值
				var multiplestr = "";
				var n = 0;
				var mlength = $("input:checkbox").length; //总共的checkbox
				//alert(mlength);
				$("input[type='checkbox']").each(function(i, obj) {
					if (0 <= (i + 1) % 4 < 4) {
						if (obj.checked) { //如果被选中
							multiplestr += obj.value;
						} else {
							n++;
							//还要再判断，n==4表示该题没做
							if (n == 4)
								multiplestr += "null";
						}

						//另外一个if
						//注意：只要(i+1) % 4 == 0即表示一道题完了，，此处是重点
						if ((i + 1) % 4 == 0) {
							n = 0; //此时n再从0开始
							
							//multiplestr += ",";//不同于单选题，多选题要在每道题结束后加个分号
							//再加一个判断，最后一个不加分号
							if(i != mlength-1)  multiplestr += ",";
							
						}

					} //if(0 <= (i+1) % 4 < 4)结束

				});

				//alert(multiplestr);
				$("#multipleanswer").val(multiplestr);//给隐藏域赋值
		
	}
	
	
	
		
		//页面一加载就绑定事件,$(function () { }); 
		$(function(){
			$("#jiaojuan").click(function(){
				
				getsingleanswer(); //调用方法
				getmultipleanswer();
				
				//交卷
				$("#fullpage").show();
				$("#waitimg").show();
				
				//提交表单
				$("#handpaper").submit();

			}); //click结束

		});
	</script>


<style>
#fullpage {
	display: none;/*blank*/
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #eeeeee;
	opacity: 0.7;/*0-1,0为完全隐藏*/
}

#message {
	display: none;
	position: fixed;
	top: 0;
	right: 0;
	width: 300px;
	margin-right: 320px;
	margin-top: 180px;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: white;
}

#waitimg{
	display:none;
	position: fixed;
	top: 0;
	right: 0;
	margin:150px 500px;
}

body {
	margin: 0 auto;
	padding: 0;
	font-size: 12px;
	color: #666;
	background-color: #FFF;
	font-family: Arial, "宋体";
}

* {
	margin: 0px;
	padding: 0px;
}

form {
	margin: 0px;
	padding: 0px;
}

a:link {
	COLOR: #22397d;
	TEXT-DECORATION: none
}

a:visited {
	COLOR: #22397d;
	TEXT-DECORATION: none
}

a:hover {
	COLOR: #913000;
	TEXT-DECORATION: underline
}

.body01 {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #CCCCCC;
	padding-left: 22px;
}

.body02 {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #EDEDEB;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #CCCCCC;
}

.body03 {
	height: 25px;
	padding-left: 8px;
	font-size: 12px;
	color: #000066;
	text-align: left;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #EDEDEB;
	background-color: #F8F5F5;
}

.body04 {
	height: 25px;
	padding-left: 8px;
	font-size: 12px;
	color: #000066;
	text-align: left;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #EDEDEB;
}

.body05 {
	height: 35px;
	font-size: 18px;
	font-weight: bolder;
	color: #000;
	text-align: center;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #EDEDEB;
}

.body06 {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: ##EDEDEB;
}

.bottom {
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-right-color: #CCCCCC;
	border-bottom-color: #CCCCCC;
	border-left-color: #CCCCCC;
	text-align: center;
}
</style>
</head>

<body topmargin="0" leftmargin="0">

<center>

<!--大div，时间结束，系统自动提交试卷-->
<div id="fullpage"> </div>
<div id="message" >
	<font size="4">考试时间结束，系统自动提交试卷！</font><br/><br/>
	<img src="/mywebtraining/images/login.gif"/>
</div>
<div>
	<img id="waitimg" width="99" height="99" src="images/wait.gif"/> <!-- 点击交卷 -->
</div>


<div style="width:780;margin:0 auto">
<table width="779" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/kstop.jpg" width="779" height="140" /></td>
  </tr>
  
  <tr> <!-- xxxxx -->
    <td align="left" valign="top" class="body01"><table width="756" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="body02 body03">当前位置：&gt;&gt; 在线考试</td>
      </tr>
      <tr>
      	<input type="hidden" id="countdown" value="${countdown }" />
        <td class="body02 body04">试卷编号：[${testid }]&nbsp;| &nbsp; &nbsp;考试日期：[ ${formateDate } ] &nbsp;| &nbsp; &nbsp;考试时间[${maintaintest.totaltime }分钟 ] 
         &nbsp; |&nbsp;&nbsp;剩余时间：[<span id="timespan"></span>] (注意：试卷在规定时间到后自动提交) </td>
      </tr>
      <tr>
        <td class="body02 body05">${testname }</td>
      </tr>
     
     
     
     <form action="answerAction_checkAnswer" id="handpaper" method="post">
     
     <!-- 点击交卷，将所有的答案获取，拼接成字符串放到隐藏域里面,$("#handpaper").submit() -->
     <input type="hidden" name="singleanswer" id="singleanswer"  />
     <input type="hidden" name="multipleanswer"  id="multipleanswer"/>
     
     <!-- 试卷编号也放入隐藏域 -->
     <input type="hidden" name="testid" value="${testid }" />
     
     
     
      <tr><!-- 开始1 -->
        <td align="center" class="body02 body06"><!-- 开始2 -->
        <br/>
        <p>一、单选题(共${maintaintest.single_quantity }道题，每题${maintaintest.single_grade }分)</p>
        
        <!-- 一道题就是一个table --><!-- ====================循环开始======================== -->
        <c:forEach items="${usinglelist }" var="choicebank" varStatus="no">
        	
        	<table cellspacing="0" cellpadding="0" align="center" border="0">
          <tbody>
            <tr>
              <td width="149">&nbsp;</td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430">&nbsp;</td>
            </tr>
            
            <tr>
              <td valign="bottom" width="149"><table cellspacing="0" cellpadding="0" width="130" align="right" 
                  border="0">
                  <tbody>
                    <tr>  <!-- ========此处是单选按钮上面的字========== -->
                      <td><div align="center"></div></td>
                      <td class="kaos"><div align="center">A</div></td>
                      <td class="kaos"><div align="center">B</div></td>
                      <td class="kaos"><div align="center">C</div></td>
                      <td class="kaos"><div align="center">D</div></td>
                    </tr>
                    <tr>
                      <td><div class="wenzi" align="center">${no.index+1 }.</div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="radio" value="A" 
                              name="sanswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="radio" value="B" 
                              name="sanswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="radio" value="C" 
                              name="sanswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="radio" value="D" 
                              name="sanswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                    </tr>
                  </tbody>
              </table></td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430"><table cellspacing="0" cellpadding="0" width="420" border="0">
                  <tbody>
                    <tr>
                      <td class="zhengwen" align="left">${no.index+1 }.${choicebank.choice_content }()</td>
                    </tr>
                    <tr>
                      <td class="zhengwen" align="left">
                      	A. ${choicebank.choice_A }<br />
                        B. ${choicebank.choice_B }<br />
                        C. ${choicebank.choice_C }<br />
                        D. ${choicebank.choice_D }</td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
          </tbody>
        </table>
        
        
   </c:forEach><!-- ====================循环结束======================== -->
        
         <br/><br/>
         <p>二、多选题(共${maintaintest.multiple_quantity }道题，每题${maintaintest.multiple_grade }分)</p>
          
          
          <!-- 一道题就是一个table --><!-- ====================循环开始======================== -->
        <c:forEach items="${umultiplelist }" var="choicebank" varStatus="no">
        	
        	<table cellspacing="0" cellpadding="0" align="center" border="0">
          <tbody>
            <tr>
              <td width="149">&nbsp;</td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430">&nbsp;</td>
            </tr>
            
            <tr>
              <td valign="bottom" width="149"><table cellspacing="0" cellpadding="0" width="130" align="right" 
                  border="0">
                  <tbody>
                    <tr>  <!-- ========此处是单选按钮上面的字========== -->
                      <td><div align="center"></div></td>
                      <td class="kaos"><div align="center">A</div></td>
                      <td class="kaos"><div align="center">B</div></td>
                      <td class="kaos"><div align="center">C</div></td>
                      <td class="kaos"><div align="center">D</div></td>
                    </tr>
                    <tr>
                      <td><div class="wenzi" align="center">${no.index+1 }.</div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="checkbox" value="A" 
                              name="manswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="checkbox" value="B" 
                              name="manswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="checkbox" value="C" 
                              name="manswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                      <td><div align="center">
                          <table>
                            <tbody>
                              <tr>
                                <td><input type="checkbox" value="D" 
                              name="manswer${no.index+1 }" /></td>
                              </tr>
                            </tbody>
                          </table>
                      </div></td>
                    </tr>
                  </tbody>
              </table></td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430"><table cellspacing="0" cellpadding="0" width="420" border="0">
                  <tbody>
                    <tr>
                      <td class="zhengwen" align="left">${no.index+1 }.${choicebank.choice_content }()</td>
                    </tr>
                    <tr>
                      <td class="zhengwen" align="left">
                      	A. ${choicebank.choice_A }<br />
                        B. ${choicebank.choice_B }<br />
                        C. ${choicebank.choice_C }<br />
                        D. ${choicebank.choice_D }</td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
          </tbody>
        </table>
        
        
   </c:forEach><!-- ====================循环结束======================== -->
          
          
          </td><!-- 结束2 -->
     
      </tr><!-- 结束1 -->
     
      <tr>
        <td height="35" align="center" valign="middle" class="body02 body06">
        <table width="157" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10" align="center">&nbsp;</td>  <!-- 设定一个id -->
            <td width="147" align="center"><input type="button" id="jiaojuan" value=" 交卷 " /></td>
          </tr>
        </table></td>
      </tr>
      
      </form>
      
      
      
      <tr>
        <td height="49" align="center" valign="middle" class="body02 body06">广东检验检疫（检务）网上培训系统版权所有 粤ICP备12345678号 </td>
      </tr>
    </table></td>
  
  
  </tr><!-- xxxxx -->

</table>
</div>
</center>
</body>




<!-- ==========注意：页面一加载就获取值时，script不能写到<head>里，要放到最后面============= -->
<script type="text/javascript">
	
	//setInterval(function(),时间间隔);
	
	//var total = $("#testtotal").text();//获取设置的时间，单位是分钟
	//var total = $("#total").html();
	//alert(total);
	//设置考试时间
	//var totaltime = total * 60; //单位是s
	
	//换了隐藏域，单位是秒
	var totaltime = $("#countdown").val();
	
	var stop = setInterval(function() {
		
		if(totaltime >= 0){
			//计算出时、分、秒
			var minute = Math.floor(totaltime / 60);
			var seconds = totaltime % 60;
			
			if(minute >= 60){//有hour
				//var hour = minute / 60;//minute / 60=1.6666666666666667
				//Math.floor方法:对数值向下取整
				var hour = Math.floor(minute/60);
				//重新计算分钟数
				minute = Math.floor((totaltime - hour*60*60)/60);
				
				$("#timespan").html(hour + ":" + minute + ":" + seconds);
			
			}else if(minute >= 1){//没有hour，但有minute
				$("#timespan").html("0:" + minute + ":" + seconds);
				
			}else{
				$("#timespan").html("0:0:" + seconds);
			
			}
			
			totaltime--;//注意不要忘了
			
		}else{
			//考试结束
			//alert("考试时间结束，系统自动交卷");
			//setTimeout("alert('考试时间结束，系统自动交卷')",5000);//停留5s提交,只是为了看看效果，真实情况不用这样，直接提交就好
			$("#fullpage").show();
			$("#message").show();
			
			//setTimeout(function()(),3000);
			setTimeout(function(){
				//$("#message").hide();
				
				//提交表单，还要获取答案
				getsingleanswer(); //调用方法
				getmultipleanswer();
				
				//提交表单
				$("#handpaper").submit();
				
			},3000);
				
			//clearInterval(stop);
		}
		
 	 }, 1000);//setInterval(function(),时间间隔);
 	
 	 
</script>


</html>
