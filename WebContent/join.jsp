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
		font-family:"NanumSquareRoundL";
		src: url("NanumSquareRoundL.ttf") format("truetype");
		font-style: normal;
		font-weight: normal;
	}
	body{color: #000000; font-family: "NanumSquareRoundL"; font-size: 20px; line-height: 20px;}
</style>
<title>join</title>
</head>
<body>
<div id = "mobile">
<center>
	<br>
	<img src = "logo2.PNG" width = 200px>
   	<br><br>
    <div id = "signup">
   	<form method="post" action="join_db.jsp">
   		<a class = "signup_font">아이디</a><br>
   		<input id = "su_insert" type = "text" name = "userID"><br><br>
   		
   		<a class = "signup_font">비밀번호</a><br>
   		<input id = "su_insert" type = "password" name = "userPW"><br><br>
   		
   		<a class = "signup_font">비밀번호 확인</a><br>
   		<input id = "su_insert" type = "password" name = "userPW2"><br><br>
   		
   		<a class = "signup_font">닉네임</a><br>
   		<input id = "su_insert" type = "text" name = "userName"><br>
   		
   		<a class = "signup_font">이메일</a><br>
   		<input id = "su_insert" type = "text" name = "userE_mail"><br><br>
   		<br>
   		<input type = "submit" id = "su" value = "회원가입">
	</div>
	</form>
    <img src = "meaning2.PNG" width = 250px>
</center>
</div>
</body>
</html>