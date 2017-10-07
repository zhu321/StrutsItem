<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上培训后台管理系统</title>
<link href="/mywebtraining/css/htlogin.css" rel="stylesheet" type="text/css" />
<script>

</script>
</head>

<frameset rows="17%,*,4%" name="firFrame">
	<frameset cols="100%,*">
		<frame name="topFrame" src="mtop.jsp" scrolling="no"  framespacing="0"   frameborder="0"  />
	</frameset>
	<frameset name="fs" cols="220,8,*">

		<frame name="sidebarFrame" src="msidebar.jsp" scrolling="auto"  noresize framespacing="0"   frameborder="0"  />
		<frame name="midFrame" src="middle.jsp"  noresize framespacing="0"   frameborder="0"  />
		<frame name="mainFrame" src="message.jsp" scrolling="yes"  noresize framespacing="0"   frameborder="0"  />
	</frameset>
	<frameset cols="100%,*">
		<frame name="bottomFrame" src="bottom.jsp" scrolling="no"  framespacing="0"   frameborder="0"  />
	</frameset>
</frameset>
</body>
</html>
