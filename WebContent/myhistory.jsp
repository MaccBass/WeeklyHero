<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myhistory</title>
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
	<button type="button" class="camera" onclick = "location.href = 'mainpage.jsp'">
		<img src="home.PNG" width = 25px>
	</button>
	<button type="button" class = "logo" onclick = "location.href = 'frontpage.jsp'">
		<img src = "logo4.PNG" width = 160px>
	</button>
	<button type="button" class="toprofile" onclick = "location.href = 'mypage.jsp'">
		<img src="<%= new_path %>" width = 30px>
	</button>
	<hr width = 100% color = #b1e198 size = 2px>
	<center>
		<h3>리워드 보관함</h3>
	
		<div id="board1">
		<br>
		<table class="myhistory_table">
			<thead>
				<tr>
					<th class = "th-1">날짜</th>
					<th>주제</th>
					<th>순위</th>
					<th>보상</th>
				</tr>
			</thead>
		
<%
	int rewardNum, ranking;
	String subject, week, userID;

	userID = (String)session.getAttribute("userID");
	
	try{
		String sql = "select * from reward";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	while(rs.next()){
		
		if(rs.getString("userID").equals(session.getAttribute("userID"))){
%>	
		<!-- 아래는 순위 목록 -->
			<tbody>
<!-- while문, echo~로 db에서 순위 불러오기, 참고: https://kevinthegrey.tistory.com/33 -->
				<tr>
					<td><%= rs.getString("week") %></td>
					<td><%= rs.getString("subject") %></td>
					<td><%= rs.getInt("ranking") %>&nbsp 등</td>
					<td>
		<!-- 프사 누르면 레이어 팝업창 띄우기, 참고: https://gopae02.tistory.com/92 -->
				<%-- 		<a href="javascript:ViewLayer();">
							<img src= "<%= rs.getString("img") %>" width = 50px style="cursor.hand;" onclick="">
						</a>
						 --%>
		<!-- 팝업창 띄우기 못 하겠어요ㅠㅠㅠㅠㅠ -->
					<!-- 	<div id="pop"> -->
							<img src="<%= rs.getString("img") %>" width = 50px style="cursor.hand;" onclick="">
						
					<!-- 	<script>
						function ViewLayer(){
							if(document.getElementByld("pop").style.display=="none"){document.getElementById("pop").style.display='inline'}
							else document.getElementById("pop").style.display='none'}
						}
						</script> -->
					</td>
				</tr>
			</tbody>
	<%
		}
	}
%>
		</table>
		
		</div>
	</center>

</div>


</body>
</html>