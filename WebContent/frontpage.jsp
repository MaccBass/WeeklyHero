<%@ page language="java" import="java.io.PrintWriter" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<!-- 로그인후 나오는 화면 -->
<head>
<meta charset="UTF-8">
<title>frontpage</title>
<link rel = "stylesheet" type = "text/css" href = "IdealIdea.css">
<style type="text/css">
   @font-face{
      font-family:"NanumSquare_acL";
      src: url("NanumSquare_acL.ttf") format("truetype");
      font-style: normal;
      font-weight: normal;
   }
   body{color: #000000; font-family: "NanumSquare_acL"; font-size: 20px; line-height: 20px;}
</style>
</head>
<body>
<div id = "mobile">
<center>
	<br>
	<button type="button" class = "logo" onclick = "location.href = 'frontpage.jsp'">
		<img src = "logo2.PNG" width = 200px>
	</button>
    <br><br><br><br><br>
    <div id = "front_board"><!-- 배경이미지: 일주일마다 바꿔주기 --> 
    	<div id = "img1">
    		<br>This week,<br><br><br><br><br>
    		<font style = "color: #b1e198;">Save</font><br><br><br><br><br>
	    	"Electricity"<br><br>
	    </div>
	    <div id = "img2"><!-- 주제 설명 -->
   		 	전기는 석탄이나 석유 등 1차 에너지원을 주원료로 하여 열효율이 40% 정도인 발전기를 통하여 생산해 내는 고급에너지원이다.<br><br>
			이러한 고급에너지가 1차원 에너지인 난방에너지로 대량사용 된다면 국가적으로도 크나큰 손실이 아닐 수 없다. 요즘처럼 전기 사용량이 급격하게 증가하는 시점에서 꼭 필요한 것은 국민들의 에너지 절약의식이다.<br><br>
			전기 절약을 통하여 개인에 대한 경제적인 절감효과는 물론이려니와 최근 대두되는 지구온난화를 방지하는데 일조하는 효과가 있다.
   		</div>
    	<div id = "img3"><!-- 랭킹 -->
    		<font style = "color: #b1e198; font-size: 30px; text-align: center;">Ranking</font><br><br><br>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "changjin0605", "idealidea1!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select userName from userdata order by likeCnt desc";
		rs = stmt.executeQuery(sql);
	}	
	catch(Exception e){
		out.println("DB 연동 오류입니다.: " + e.getMessage());
	}
	
	int i = 1;
	
	while(rs.next() && i < 6){
		out.println("<font style = 'text-align: left;'>" + i + ". &nbsp&nbsp" + rs.getString("userName") + "</font><br><br>");
		i++;
	}
    		
%>

    	</div>
 
  	<div id = "how">
  		박스를 터치해주세요
  	</div>
  
    </div>   
    
    <div id = "week">12월 07일 ~ 12월 13일</div>
    <button id = "startbtn" onclick = "location.href = 'mainpage.jsp'">시작</button>
    <br>
    <img src = "logo3.PNG" width = 70px>
    
</center>
    
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
            $("#img1").show();
            $("#img2").hide();
            $("#img3").hide();
            $("#img1").click(function(){
                $("#img1").hide();
                $("#img2").show();
            });
            $("#img2").click(function(){
                $("#img3").show();
                $("#img2").hide();
            });
            $("#img3").click(function () {
                $("#img3").hide();
                $("#img1").show();
            });
        }); 
</script>
</html>
