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
<%
	int postNum;
	String sql, time = "", title = "", content = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	postNum = Integer.parseInt(request.getParameter("postNum"));
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from post";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류 입니다.: " + e.getMessage());
	}
	
	while(rs.next()){
		if(postNum == rs.getInt("postNum")){
			title = rs.getString("title");
			content = rs.getString("content");
			time = rs.getString("time");
		}
	}
%>
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
			<textarea id = "title" readonly><%= title %></textarea><br>
			<textarea id = "content" readonly><%= content %></textarea>
		</div>
		
	</center>
</div>
</body>
</html>