<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
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
	<button type="button" class = "logo" onclick = "location.href = 'frontpage.jsp'">
		<img src = "logo2.PNG" width = 200px>
	</button>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<h1><%= session.getAttribute("signedName") %>님</h1>
	<h3>반갑습니다.</h3>
	
	<%session.invalidate(); %>
	
	<br><br><br><br><br>
	<input type = "button" id = "su" onclick = "location.href = 'login.jsp'" value = "로그인하기">
	<br><br><br><br><br><br><br>
    <img src = "logo3.PNG" width = 70px>
</center>
</div>
</html>

