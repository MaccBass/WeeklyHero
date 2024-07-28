<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--회원가입 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" type = "text/css" href = "IdealIdea.css">
<style type="text/css">
	@font-face{
		font-family:"NanumSquare_acL";
		src: url("NanumSquare_acL.ttf") format("truetype");
		font-style: normal;
		font-weight: normal;
	}
	body{color: #000000; font-family: "NanumSquare_acL"; font-size: 20px; line-height: 20px;}
</style>
<title>find</title>
</head>
<body>
<div id = "mobile">
<center>
	<br>
	<img src = "logo2.PNG" width = 200px>
    <br><br><br>
    
    <div id = "signup">
   	<form method="post" action="findID.jsp">
   		<a class = "signup_font">이메일 입력</a><br>
   		<input id = "su_insert" type = "text" name = "userE_mail"><br><br>
   		<input type = "submit" id = "su" value = "ID 찾기"><br><br><br><br><br>
	</form>
	
	<form method="post" action="findPW.jsp">
		<a class = "signup_font">아이디 입력</a><br>
   		<input id = "su_insert" type = "text" name = "userID"><br><br>
   		<a class = "signup_font">이메일 입력</a><br>
   		<input id = "su_insert" type = "text" name = "userE_mail"><br><br>
   		<input type = "submit" id = "su" value = "PW 찾기">
	</form>
	</div>
	
	<br><br>
    <img src = "logo3.PNG" width = 70px>
</center>
</div>
</body>
</html>


