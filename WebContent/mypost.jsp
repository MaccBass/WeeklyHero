<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<!-- 메인페이지 -->
<html>
<head>
<meta charset="UTF-8">
<title>mypost</title>
<link rel="stylesheet" type="text/css" href="IdealIdea.css"/>
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
	<button type="button" class="toprofile" onclick = "location.href = 'mypage.jsp'">
		<img src="<%= new_path %>" width = 30px>
	</button>
	<hr width = 100% color = #b1e198 size = 2px>
	
	<!-- --------------------------------------------------------------------------------------------------- -->
	
	<center>
		<h3>내가 작성한 글</h3>
		<div class ="board1">
		<table id = "post_tbl">
		
		<%
			String imgPath, newPath;
			int postNum, likeNum;
			int rownum = 0;
			String sql1 = null;
	
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
				conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				sql1 = "select * from post order by postNum desc";
				rs = stmt.executeQuery(sql1);
			}
			catch(Exception e){
				out.println("DB 연동 오류입니다.: " + e.getMessage());
			}
				rs.beforeFirst();
				
				while(rs.next())
				{
					if(rs.getString("userID").equals(session.getAttribute("userID"))){
						imgPath = rs.getString("img"); 
						newPath = imgPath.replaceAll("/changjin0605/tomcat/webapps/ROOT/", ""); 
		
		%>
		<tr>
			<td>
				<%-- <img src = "<%= imgPath %>" width = "340px"></img> --%>
				<img src = "<%= newPath %>" width = "334px"></img>
			</td>
		</tr>
		
		<tr>
			<td style = "width: 10px; text-align: left; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
				<h4>&nbsp&nbsp&nbsp<%= rs.getString("title") %></h4>
			</td>
			<td style = "width: 180px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
				<a href = "post_read.jsp?postNum=<%= rs.getString("postNum") %>" style = "text-decoration:none">
					<%= rs.getString("content") %>&nbsp
				</a>
			</td>
			<td style = "text-align: right">
				<form method = "post" action = "like_db.jsp">
				<div>
					<input type = "hidden" name = "postNum" value = <%= rs.getInt("postNum") %>>
					<input type = "hidden" name = "likeNum" value = <%= rs.getInt("likeNum") %>>
					<img src = "like.PNG" width = 20px>
					&nbsp<%= rs.getInt("likeNum") %>&nbsp
				</div>			
				</form>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<font style = "font-size: 3px;"><br>&nbsp&nbsp&nbsp&nbsp<%= rs.getString("time") %></font>
				<hr width = 100% color = #b1e198 size = 1px>
			</td>
			<td style = "text-align: right">
				<form action = "modify.jsp" method = "post">
					<input type = "hidden" name = "postNum" value = <%= rs.getInt("postNum") %>>
					<input type = "submit" value = "수정하기" style = "border: none; background-color: white; font-size: 3px; cursor: pointer;">
				</form>
				<form action = "delete.jsp" method = "post">
					<input type = "hidden" name = "postNum" value = <%= rs.getInt("postNum") %>>
					<input type = "submit" value = "삭제하기" style = "border: none; background-color: white; font-size: 3px; cursor: pointer;"><br>
				</form>
				<hr width = 100% color = #E6E6E6 size = 1px>
			</td>
		</tr>	

		<%
					}
			}
		%>
					
		</table>
	
		<%
			stmt.close();
			conn.close();
		%>
		</div>
	</center>
</div>
</body>
</html>