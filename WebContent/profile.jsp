<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile page</title>
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
	String profile_path = "", new_path = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql_update;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select * from userdata";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	while(rs.next()){
		if(rs.getString("userID").equals(session.getAttribute("userID"))){
			profile_path = rs.getString("profile");
			new_path = profile_path.replaceAll("/changjin0605/tomcat/webapps/ROOT/", ""); 
			break;
		}
	}
	
%>	
<div id = "mobile">
	<br>
	<button type="button" class="camera" onclick = "location.href = 'postpage.jsp'">
		<img src="camera.png" width = 30px>
	</button>
	<button type="button" class = "logo" onclick = "location.href = 'frontpage.jsp'">
		<img src = "logo4.PNG" width = 160px>
	</button>
	<button type="button" class="toprofile" onclick = "location.href = 'mainpage.jsp'">
		<img src="home.PNG" width = 25px>
	</button>
	<hr width = 100% color = #b1e198 size = 2px><br>
	<center>
		<img src = "thisweek.PNG" width = 300px><br><br>
		<div id ="board4">
			<br>
			<img src = "<%= new_path %>" width = 80px onclick = "location.href = 'profile.jsp'"><br>
			<div id = "profile_name"><%= session.getAttribute("userName") %></div>
			<br><br>
			<form method="post" enctype="multipart/form-data" action="updateProfile.jsp">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input type = "file" name = "filename1" size = 40px><br><br>
				<input type = "submit" id = "btn1" value = "프로필 바꾸기">
			</form>
		</div>
		

		<img src="logo3.PNG" width = 70px>
	</center>
</div>
</body>
</html>