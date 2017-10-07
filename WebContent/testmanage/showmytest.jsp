<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查看试卷</title>

<!--该句只是导库-->
	<script type="text/javascript" src="/mywebtraining/JS/jquery-1.8.1.js"></script>
	
	


<style>

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

<!-- 加一个判断条件 -->
<c:if test="${not empty testmessage }">
	<div style="margin:0 auto; margin-top:120px; padding-top:50px; padding-left:20px; border:1px solid #ccc;width:320px;height:100px">
		<h2>${testmessage }</h2>
	
	</div>

</c:if>


<c:if test="${empty testmessage }">
	<center>

<div style="width:780;margin:0 auto">
<table width="779" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr> <!-- xxxxx -->
    <td align="left" valign="top" class="body01"><table width="756" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="body02 body03">当前位置：&gt;&gt;查看试卷 </td> 
      </tr>
      <tr>
        <td class="body02 body05">${test_name }</td>
      </tr>
     
    
      <tr><!-- 开始1 -->
        <td align="center" class="body02 body06"><!-- 开始2 -->
        <br/>
        <p>一、单选题</p>
        
        <!-- 一道题就是一个table --><!-- ====================循环开始======================== -->
        <c:forEach items="${showsinglelist }" var="showtest" varStatus="no">
        	
        	<table cellspacing="0" cellpadding="0" align="center" border="0">
          <tbody>
            <tr>
              <td width="149">&nbsp;</td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430">&nbsp;</td>
            </tr>
            
            <tr>
              <td valign="bottom" width="149">
              	<!-- 答案-->
             	<span >正确答案：${showtest.choice_answer }</span>
             	<br/><br/>
              <table cellspacing="0" cellpadding="0" width="130" align="right" 
                  border="0">
                  <tbody>
                  	<span >我的答案：${showtest.my_answer }</span>
                  </tbody>
              </table></td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430"><table cellspacing="0" cellpadding="0" width="420" border="0">
                  <tbody>
                    <tr>
                      <td class="zhengwen" align="left">
                      	<c:if test="${showtest.choice_answer!=showtest.my_answer }"><font color="red">${no.index+1 }.${showtest.choice_content }()</font></c:if>	
                      	<c:if test="${showtest.choice_answer==showtest.my_answer }">${no.index+1 }.${showtest.choice_content }()</c:if>	
                      </td>
                    </tr>
                    <tr>
                      <td class="zhengwen" align="left">
                      	A. ${showtest.choice_A }<br />
                        B. ${showtest.choice_B }<br />
                        C. ${showtest.choice_C }<br />
                        D. ${showtest.choice_D }</td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
          </tbody>
        </table>
        
        
   </c:forEach><!-- ====================循环结束======================== -->
        
         <br/><br/>
         <p>二、多选题</p>
          
          
          <!-- 一道题就是一个table --><!-- ====================循环开始======================== -->
        <c:forEach items="${showmultiplelist }" var="showtest" varStatus="no">
        	
        	<table cellspacing="0" cellpadding="0" align="center" border="0">
          <tbody>
            <tr>
              <td width="149">&nbsp;</td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430">&nbsp;</td>
            </tr>
            
            <tr>
              <td valign="bottom" width="149">
              	<!-- 答案-->
             	<span>正确答案：${showtest.choice_answer }</span>
             	<br/><br/>
              <table cellspacing="0" cellpadding="0" width="130" align="right" 
                  border="0">
                  <tbody>
                   		<span>我的答案：${showtest.my_answer }</span>
                  </tbody>
              </table></td>
              <td width="1" bgcolor="#EDEDEB"></td>
              <td width="20">&nbsp;</td>
              <td width="430"><table cellspacing="0" cellpadding="0" width="420" border="0">
                  <tbody>
                    <tr>
                      <td class="zhengwen" align="left">
                      	<c:if test="${showtest.choice_answer!=showtest.my_answer }"><font color="red">${no.index+1 }.${showtest.choice_content }()</font></c:if>	
                      	<c:if test="${showtest.choice_answer==showtest.my_answer }">${no.index+1 }.${showtest.choice_content }()</c:if>	
                      </td>
                    </tr>
                    <tr>
                      <td class="zhengwen" align="left">
                      	A. ${showtest.choice_A }<br />
                        B. ${showtest.choice_B }<br />
                        C. ${showtest.choice_C }<br />
                        D. ${showtest.choice_D }</td>
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
        	&nbsp;
        </td>
      </tr>
      
      
      
      <tr>
        <td height="49" align="center" valign="middle" class="body02 body06">广东检验检疫（检务）网上培训系统版权所有 粤ICP备12345678号 </td>
      </tr>
    </table></td>
  
  
  </tr><!-- xxxxx -->

</table>
</div>
</center>
	

</c:if>



</body>



</html>
