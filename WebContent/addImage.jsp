<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시판 </title>
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
	<br>
	<button type="button" class="camera" onclick = "location.href = 'postpage.jsp'">
		<img src="camera.png" width = 30px>
	</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<button type="button" class = "logo" onclick = "location.href = 'frontpage.jsp'">
		<img src = "logo4.PNG" width = 160px>
	</button>
	<button type="button" class="toprofile" onclick = "location.href = 'mainpage.jsp'">
		<img src="home.PNG" width = 25px>
	</button>
	<hr width = 100% color = #b1e198 size = 2px><br>
	
<!-- --------------------------------------------------------------------------------------------------- -->
	
	<center>
		<img src = "thisweek.PNG" width = 300px><br><br>
		<div id="board4">
			<form method="post" enctype="multipart/form-data" action="addImage_db.jsp">
			<input type = "file" name = "filename1" size = 40px>
		</div>
		<input type = "submit" id = "post" value = "공유">
		</form>
	</center>
</div>
</body>
</html>