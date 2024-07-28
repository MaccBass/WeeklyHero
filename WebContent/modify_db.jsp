<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv = "refresh" content = "0; url = mypost.jsp">
<title>Insert title here</title>
</head>
<body>
<%
	int postNum;
	String userID = "", title = "", content = "", time = "";
	Connection conn = null;
	Statement stmt = null;
	
	content = request.getParameter("content");
	postNum = Integer.parseInt(request.getParameter("postNum"));
	title = request.getParameter("title");

	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql1 = "update post set title = '" + title + "', content = '" + content + "' where postNum = " + postNum;
		stmt.executeUpdate(sql1);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
%>	

</body>
</html>