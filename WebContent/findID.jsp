<%@ page import="user.UserDAO" import="java.io.PrintWriter" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 회원가입 백엔드 --%>
    
<jsp:useBean id="user" class="user.UserData" scope="page"/>
<jsp:setProperty name="user" property="userE_mail"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>findID</title>
</head>
<body>
<div id = "mobile">
<center>
	<br><br><br><br><br><br><br><br>
	<button type="button" class = "logo" onclick = "location.href = 'frontpage.jsp'">
		<img src = "logo2.PNG" width = 200px>
	</button>
	<br><br><br>
	<%
	
	if(user.getUserE_mail()==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이메일을 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		UserDAO userDAO=new UserDAO();
		String result=userDAO.findID(user.getUserE_mail());
		
		if(result==""){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('해당 이메일로 가입된 아이디가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			session.setAttribute("foundID", result);
		}
	}
	
	out.println("<h3>회원님의 아이디는</h3><h1> "+session.getAttribute("foundID")+"</h1><h3> 입니다.</h3>");
	%>
	<br><br><br>
	<input type = "button" id = "su" onclick = "location.href = 'login.jsp'" value = "로그인하기">
	
	<br><br><br><br><br><br><br><br>
    <img src = "logo3.PNG" width = 70px>
</center>
</div>
</body>
</html>



