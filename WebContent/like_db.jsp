<%@ page language="java" import="java.io.PrintWriter" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv = "refresh" content = "0; url = mainpage.jsp">
<title>Insert title here</title>
</head>
<body>
<%
	int postNum, likeNum = Integer.parseInt(request.getParameter("likeNum"));
	int cnt=0, new_num=0, likeCnt=-151656;
	String title, content;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	String sql_update;
	
	postNum = Integer.parseInt(request.getParameter("postNum"));
	String userID=(String)session.getAttribute("userID");
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from post where postNum = " + postNum;
		rs = stmt.executeQuery(sql);
	}

	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	
	while(rs.next()){
		if(rs.getString("postNum").equals(postNum)){
			likeNum =  rs.getInt("likeNum");
			break;
		}
	}
	
	try{ // 좋아요한거 2번 표시하지 않게 함
		sql="select like_check from likedb where postNum = '"+postNum+"' and userID = '"+userID+"'";
		rs=stmt.executeQuery(sql);
	} catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	if(rs.next()){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('같은 게시글에 좋아요를 2번 누를 수 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
	
	likeNum++;
	
	sql_update = "update post set likeNum = '" + likeNum + "' where postNum = " + postNum;
	try{ // 게시물의 좋아요 수 증가
		stmt.executeUpdate(sql_update);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	userID = request.getParameter("userID");
	
	sql="select * from userdata";
	try{
		rs=stmt.executeQuery(sql);
	} catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	while(rs.next()){
		if(rs.getString("userID").equals(userID)){
			likeCnt=rs.getInt("likeCnt");
			break;
		}
	}
	++likeCnt;
	
	sql_update="update userdata set likeCnt = "+likeCnt+" where userID = '"+userID+"'";
	try{
		stmt.executeUpdate(sql_update);
	} catch(Exception e){
		out.println("DB 연동 오류입니다.: "+e.getMessage());
	}
	
	userID=(String)session.getAttribute("userID");
	
	sql = "select max(dbNum) as max_num, count(*) as cnt from likedb";
	try{
		rs=stmt.executeQuery(sql);
	} catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}

	if(rs.next()){
		cnt=Integer.parseInt(rs.getString("cnt"));
		if(cnt!=0) new_num=Integer.parseInt(rs.getString("max_num"));
	}
	++new_num;
	
	sql_update="insert into likedb values("+new_num+", "+postNum+", '"+userID+"', 1)";
	out.println(sql_update);
	try{
		stmt.executeUpdate(sql_update);
	} catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	}
%>	

</body>
</html>