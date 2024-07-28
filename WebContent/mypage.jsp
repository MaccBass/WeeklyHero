<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
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
	String imgPath, newPath = "";
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
			imgPath = rs.getString("profile"); 
			newPath = imgPath.replaceAll("/changjin0605/tomcat/webapps/ROOT/", ""); 
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
		<div id="board2">
			<br>
			
			<button type="button" class="myprofile" onclick = "location.href = 'profile.jsp'">
				<img src="<%= newPath %>" width = 80px>
			</button><br>
			
			<%-- <img src = "<%= profile_path %>" width = 80px onclick = "location.href = 'profile.jsp'"
			style = "cursor: pointer;"><br> --%>
			
			<div id = "profile_name"><%= session.getAttribute("userName") %></div>
			<br>
			<div id = "mypage1">
				<div id = "mypage_btn" onclick = "location.href = 'mypost.jsp'">
					&nbsp&nbsp&nbsp<img src = "mypage1.png" width = "15px">
					내가 작성한 글 
				</div><br>
				<div id = "mypage_btn" onclick = "location.href = 'mylike.jsp'">
					&nbsp&nbsp&nbsp<img src = "mypage2.png" width = "15px">
					내가 좋아요한 글 
				</div><br>
				<div id = "mypage_btn" onclick = "location.href = 'myhistory.jsp'">
					&nbsp&nbsp&nbsp<img src = "mypage3.png" width = "15px">
					리워드
				</div>
			</div>
		</div>
		
<%
	int likeCnt;

	try{
		String sql = "select * from userdata";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	while(rs.next()){
		if(rs.getString("userID").equals(session.getAttribute("userID"))){
			likeCnt =  rs.getInt("likeCnt");
			break;
		}
	}
	
%>	
		<div id="board3">
			<div id = "mypage2">
			<br>이번주 나의 절약 점수는?<br><br>
			<!-- 트로피 이미지 -->
			<img src = "ranking_sample.png" width = "50px"><br>
			<!-- 점수 -->
			<div id = "profile_name">
				<%= rs.getInt("likeCnt")*10 %><small> 점</small>
			</div>
			</div>
		</div>
		<button type = "button" id = "logoutbtn" onclick = "location.href = 'logout.jsp'">로그아웃</button><br>
		<img src="logo3.PNG" width = 70px>
	</center>
</div>
</body>
</html>