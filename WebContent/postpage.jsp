<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>postpage</title>
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
		
		<form method = "post" action = "postpage_db.jsp">
		<div id="board4">
			<input type = "text" id = "title" name = "title" placeholder = "제목"><br>
			<textarea id = "content" name = "content" placeholder = "내용"></textarea>
			<input type = "hidden" name = "userID" value = <%= session.getAttribute("userID") %>>
		</div>
		<button id = "post" type="post">이미지 업로드</button>
		
	<br><br><img src="logo3.PNG" width = 70px>
	</center>
</div>
</body>
</html>