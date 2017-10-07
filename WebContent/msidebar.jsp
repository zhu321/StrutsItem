<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东检验检疫（检务）网上培训系统后台管理系统</title>
<link href="css/htlogin.css" rel="stylesheet" type="text/css" />

</head>
<style type="text/css">
<!--
*{margin:0;padding:0;border:0;}
body {
	font-family: arial, 宋体, serif;
	font-size:12px;
}
div { border:0px;}
#nav {
	width:177px;
    line-height: 29px; 
	list-style-type: none;
	text-align:left;
    /*定义整个ul菜单的行高和背景色*/
}

/*==================一级目录===================*/
#nav a {
	width: 177px; 
	display: block;
	padding-left:32px;
	/*Width(一定要)，否则下面的Li会变形*/
}

#nav li {
	border-bottom:#FFF 1px solid; /*下面的一条白边*/
	float:left;
	/*float：left,本不应该设置，但由于在Firefox不能正常显示
	继承Nav的width,限制宽度，li自动向下延伸*/
}
#nav a:link  {
	color:#666; text-decoration:none;
}
#nav a:visited  {
	color:#666;text-decoration:none;
}
#nav a:hover  {
	color:#FFF;text-decoration:none;font-weight:bold;
}

/*==================二级目录===================*/
#nav li ul {
	list-style:none;
	text-align:left;
}
#nav li ul a{
         padding-left:60px;
         width:150px;	
	/* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/
}

/*下面是二级目录的链接样式*/


#nav li ul a:link  {
	color:#666; text-decoration:none; padding-left:60px;
}
#nav li ul a:visited  {
	color:#666;text-decoration:none;
}
#nav li ul a:hover {
	color:#69030A;
	text-decoration:none;
	font-weight:normal;

	/* 二级onmouseover的字体颜色、背景色*/
}

/*==============================*/
#nav li:hover ul {
	left: auto;
}
#nav li.sfhover ul {
	left: auto;
}
#content {
	clear: left; 
}
#nav ul.collapsed {
	display: none;
}
-->

#PARENT{
	width:150px;
	padding-left:0px;
}
</style>
<body topmargin="0" leftmargin="0">
<table width="20%" height="465px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td id="menu" width="20%" align="left" valign="top" background="images/ht-leftbg.jpg"><table width="220" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="219"><img src="images/ht-left01.jpg" width="219" height="45"/>
	

	</td>
	</tr>
<tr>
    <td align="left"  valign="bottom" background="images/ht-leftbg.jpg"><table width="220" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="left01">
		<div id="PARENT">
              <ul id="nav">


			<!----学员信息管理--->
			 <li>
                 <div id="d5" style="background-image:url(images/ht-left05.jpg)">
				<a href="#Menu=ChildMenu5" onclick="DoMenu('ChildMenu5','d5')">学员信息管理</a></div>
                <ul id="ChildMenu5" class="collapsed">
		 
		 
		   <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="usersConditionAction_getconditions" target="mainFrame">学员管理</a></div>
                  </li>
		 
		 <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="summary/studysum.html" target="mainFrame">学习情况统计查询</a></div>
                  </li>
                
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="summary/talksum.html" target="mainFrame">讨论情况统计</a></div>
                  </li>
		
		  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="testmanage/userscore.jsp" target="mainFrame">我的成绩</a></div>
                  </li>
       
                </ul>
                </li>
			<!---学员信息管理结束-->

		
		
				<!----------------------------2----------------------------------------->
		<li>
                 <div id="d2" style="background-image:url(images/ht-left05.jpg)">
				<a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2','d2')">培训管理</a></div>
                <ul id="ChildMenu2" class="collapsed">
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="javascript:showsubmenu(submenu33,tree33);top.go();">培训教材管理</a></div>
                <div id="submenu33" style="DISPLAY: none">

					   <table align=center>
                         <tbody>
		                    <span id="tree33">&nbsp;&nbsp;&nbsp;读取中...</span>
				          </tbody>
			           </table>
		</div>		
                  </li>
<!--
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="body_trainning/insertquestion.html" target="mainFrame">习题管理</a></div>
                  </li>
//-->
                </ul>
                </li>
				<!------------------------------6------------------------------------>
		<li>
                 <div id="d6" style="background-image:url(images/ht-left05.jpg)">
				<a href="#Menu=ChildMenu6" onclick="DoMenu('ChildMenu6','d6')">考试管理</a></div>
                <ul id="ChildMenu6" class="collapsed">
                <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="selectDepartmentAction_selectdepart?flag=2" target="mainFrame">成绩管理</a></div>
                  </li>
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="testmanage/bankmanage.jsp" target="mainFrame">题库管理</a></div>
                  </li>
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="selectDepartmentAction_selectdepart?flag=1" target="mainFrame">试卷管理</a></div>
                  </li>
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="selectDepartmentAction_selectdepart" target="mainFrame">自动生成试卷</a></div>
                  </li>
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="selectDepartmentAction_selectdepart?flag=3" target="mainFrame">手动生成试卷</a></div>
                  </li>
                </ul>
                </li>
		

				<!------------------------------3 ----------------------------------->
                <li>
                 <div id="d3" style="background-image:url(images/ht-left05.jpg)">
				<a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3','d3')">系统管理</a></div>
               
                <ul id="ChildMenu3" class="collapsed">
                 
		   <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="body_sys/sysnoticelist.html" target="mainFrame">系统通告</a></div>
                  </li>
                
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="sysmanage/maintaindepartment.jsp" target="mainFrame">部门维护</a></div>
                  </li>
                
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="maintainTestpaperAction_showConditions" target="mainFrame">试卷维护</a></div>
                  </li>
                 
                
                  <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="body_sys/main6.html" target="mainFrame">相关链接网站</a></div>
                  </li>
		
		   <li>
                    <div style="background-image:url(images/ht-left04.jpg) "><a href="body_sys/setParam.html" target="mainFrame">XXXXX</a></div>
                  </li>
           
                </ul>
                </li>

				<!------------------------------5 ----------------------------------->
               

              </ul>
          </div>
		
		</td>
      </tr>

    </table></td>
</tr>
</table>
</td>


</tr>


      <tr>
        <td valign="bottom" background="images/ht-leftbg.jpg"><img src="images/ht-left06.jpg" width="220" height="17" /></td>
      </tr>
</table>
</body>

<script type=text/javascript>
var LastLeftID = "";

function menuFix() {
	var obj = document.getElementById("nav").getElementsByTagName("li");
	
	for (var i=0; i<obj.length; i++) {
		obj[i].onmouseover=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseDown=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseUp=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
		}
	}
}

function DoMenu(emid,divid)
{
	for(var i=0;i<document.getElementsByTagName("div").length;i++)//处理图形变换
	{
		if(document.getElementsByTagName("div")[i].style.backgroundImage=="url(images/ht-left03.jpg)")
		{
			document.getElementsByTagName("div")[i].style.backgroundImage="url(images/ht-left05.jpg)";
		}
	}
	document.getElementById(divid).style.backgroundImage="url(images/ht-left03.jpg)";
	var obj = document.getElementById(emid);	
	obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
	if((LastLeftID!="")&&(emid!=LastLeftID))	//关闭上一个Menu
	{
		document.getElementById(LastLeftID).className = "collapsed";
		document.getElementById(divid).style.backgroundImage="url(images/ht-left05.jpg)";
	}
	LastLeftID = emid;
}

function GetMenuID()
{

	var MenuID="";
	var _paramStr = new String(window.location.href);

	var _sharpPos = _paramStr.indexOf("#");
	
	if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
	{
		_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
	}
	else
	{
		_paramStr = "";
	}
	
	if (_paramStr.length > 0)
	{
		var _paramArr = _paramStr.split("&");
		if (_paramArr.length>0)
		{
			var _paramKeyVal = _paramArr[0].split("=");
			if (_paramKeyVal.length>0)
			{
				MenuID = _paramKeyVal[1];
			}
		}
		/*
		if (_paramArr.length>0)
		{
			var _arr = new Array(_paramArr.length);
		}
		
		//取所有#后面的，菜单只需用到Menu
		//for (var i = 0; i < _paramArr.length; i++)
		{
			var _paramKeyVal = _paramArr[i].split('=');
			
			if (_paramKeyVal.length>0)
			{
				_arr[_paramKeyVal[0]] = _paramKeyVal[1];
			}		
		}
		*/
	}
	
	if(MenuID!="")
	{
		DoMenu(MenuID)
	}
}

function menuFix() {
	var obj = document.getElementById("nav").getElementsByTagName("li");
	
	for (var i=0; i<obj.length; i++) {
		obj[i].onmouseover=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseDown=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseUp=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
		}
	}
}

function showsubmenu(menu,tree){
var innerHTML="";

    if(menu.style.display==""){
	  menu.style.display="none";
	}else{
	  menu.style.display="";
	}
		if(tree==tree33){
		 innerHTML+="<tr><td><a href='body_trainning/textbook.html' target='mainFrame'>- 检务</a></td></tr>";
		 innerHTML+="<tr><td><a href='body_trainning/textbook.html' target='mainFrame'>- 食品</a></td></tr>";
		 innerHTML+="<tr><td><a href='body_trainning/textbook.html' target='mainFrame'>- 动检</a></td></tr>";
		 innerHTML+="<tr><td><a href='body_trainning/textbook.html' target='mainFrame'>- 植检</a></td></tr>";
		 innerHTML+="<tr><td><a href='body_trainning/textbook.html' target='mainFrame'>- 财务</a></td></tr>";
		 innerHTML+="<tr><td><a href='body_trainning/textbook.html' target='mainFrame'>- 统计</a></td></tr>";
		}
		tree.innerHTML=innerHTML;	
  }
</script>
</html>