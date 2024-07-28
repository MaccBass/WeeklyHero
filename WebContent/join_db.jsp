<%@ page import="user.UserDAO" import="java.io.PrintWriter" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 회원가입 백엔드 --%>>
    
<jsp:useBean id="user" class="user.UserData" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userE_mail"/>
<!DOCTYPE html>
<html>
<body>
<%	
	String confirmPW1=request.getParameter("userPW");
	String confirmPW2=request.getParameter("userPW2");
	
	if(!confirmPW1.equals(confirmPW2)){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 같지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	if(user.getUserID()==null || user.getUserPW()==null || user.getUserName()==null || user.getUserE_mail()==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('모든 항목을 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		UserDAO userDAO=new UserDAO();
		int result=userDAO.join(user);
		
		if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			session.setAttribute("signedName", user.getUserName());
			script.println("history.back()");
			script.println("</script>");
		} else{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			session.setAttribute("signedName", user.getUserName());
			script.println("location.href='welcome.jsp'");
			script.println("</script>");
		}
	}
	
%>
</body>
</html>