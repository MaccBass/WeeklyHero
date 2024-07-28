<%@ page import="user.UserDAO" import="java.io.PrintWriter" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 로그인 과정 페이지, 성공시 frontpage.jsp로 이동 -->
    
<jsp:useBean id="user" class="user.UserData" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userName"/>
<!DOCTYPE html>
<html>
<body>
<%
	UserDAO userDAO=new UserDAO();
	int result=userDAO.login(user.getUserID(), user.getUserPW());
	if(result==1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		session.setAttribute("userID", user.getUserID());
		session.setAttribute("userName", userDAO.getUserDatabyID(user.getUserID()));
		script.println("location.href='frontpage.jsp'");
		script.println("</script>");
	} else if(result==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(result==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(result==-2){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>