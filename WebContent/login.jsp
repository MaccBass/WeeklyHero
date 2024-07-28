<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 로그인 화면 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel = "stylesheet" type = "text/css" href = "IdealIdea.css">
<style type="text/css">
	@font-face{
		font-family:"NanumSquareRoundL";
		src: url("NanumSquareRoundL.ttf") format("truetype");
		font-style: normal;
		font-weight: normal;
	}
	body{color: #000000; font-family: "NanumSquareRoundL"; font-size: 20px; line-height: 20px;}
</style>
</head>
<body>
<div id = "mobile">
<center>
	<br><br><br><br>
	<img src = "logo1.PNG" width = 177.6px><br><br><br>
	<form method = "post" action = "authentication.jsp">
		<input type = "text" id = "login" name = "userID" placeholder = " ID" required = "true"><br>
		<input type = "password" id = "login" name = "userPW" placeholder = " PW" required = "true"><br>
		<input type = "submit" id = "btn1" value = "로그인"><br>
	</form>
	<button type = "button" id = "btn2" onclick = "location.href = 'join.jsp'">회원가입</button>
	<button type = "button" id = "btn2" onclick = "location.href = 'find.jsp'">ID/PW 찾기</button>
	<br><br><br><br><br><br><br>
	<img src = "logo3.PNG" width = 70px;>
</center>
</div> 

<%
	String ID = request.getParameter("id");
	session.setAttribute("ID", ID);
%>
</body>
</html>

