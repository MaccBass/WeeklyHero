<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv = "refresh" content = "0; url = addImage.jsp">
<title>Insert title here</title>
</head>
<body>
<%
	int temp, cnt;
	int new_postNum = 0;
	int likeNum;
	String title, content, time, userID;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs1 = null;
	String sql_update1;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql1 = "select max(postNum) as maxNum, count(*) as cnt from post";
		rs1 = stmt.executeQuery(sql1);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	while(rs1.next()){
		cnt = Integer.parseInt(rs1.getString("cnt"));
		if(cnt != 0)
			new_postNum = Integer.parseInt(rs1.getString("maxNum"));
	}
	
	new_postNum++;
	likeNum = 0;
	title = request.getParameter("title");
	content = request.getParameter("content");
	userID = request.getParameter("userID");
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh: mm: ss");
	
	time = sf.format(now);

	sql_update1 = "insert into post values('" + new_postNum + "', '" + userID + "', '" + likeNum + "', '" 
				+ title + "', '" + content + "','" + time + "','" + "profile_sample.png" + "')";
	try{
		stmt.executeUpdate(sql_update1);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	
%>	

</body>
</html>