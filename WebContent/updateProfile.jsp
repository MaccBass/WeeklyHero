<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<meta charset="UTF-8">
<meta http-equiv = "refresh" content = "0; url = mypage.jsp">

<%
request.setCharacterEncoding("UTF-8");
String realFolder = "";
String filename1 = "";
int maxSize = 1024*1024*5;
String encType = "UTF-8";
String savefile = "img";
ServletContext scontext = getServletContext();
realFolder = scontext.getRealPath(savefile);

try{
 	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
	 	String file1 = (String)files.nextElement();
	filename1 = multi.getFilesystemName(file1);
} catch(Exception e) {
		e.printStackTrace();
	}

String fullpath = realFolder + "\\" + filename1;

String newpath;

newpath = fullpath.replaceAll("\t", "\\t");
newpath = fullpath.replaceAll("\\\\", "/");
 
 /* --------------------------------------------------------------------DB-------------------------------------------------------------------- */
 
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs1 = null;
	String sql_update1;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select *from userdata";
		rs1 = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("이미지 DB 연동 오류입니다.: " + e.getMessage());
	}
	
	sql_update1 = "update userdata set profile = '" + newpath + "' where userID = '" + (String)session.getAttribute("userID") + "'";
	
	try{
		stmt.executeUpdate(sql_update1);
	}
	catch(Exception e){
		out.println(sql_update1);
		out.println("이미지 2 DB 연동 오류입니다.: " + e.getMessage());
	}
	
%>

<title>Insert title here</title>
</head>
<body>
</body>
</html>
