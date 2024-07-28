<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int postNum;
	Connection conn = null;
	Statement stmt = null;
	
	postNum = Integer.parseInt(request.getParameter("postNum"));

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql1 = "delete from post where postNum = '" + postNum + "'";
		stmt.executeUpdate(sql1);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
%>	

<script>
	alert("게시글이 삭제되었습니다.");
	document.location.href = "mypost.jsp";
</script>

</body>
</html>