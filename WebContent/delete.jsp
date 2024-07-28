<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" name = "form" action = "delete_db.jsp">
	<input type = "hidden"  name = "postNum" value = <%= request.getParameter("postNum") %>>
	<script>
		if(confirm("정말 삭제하시겠습니까?") != 0){
			document.form.submit();
		}
		else{
			document.location.href = "mypost.jsp";
		}
	</script>
</form>

</html>


