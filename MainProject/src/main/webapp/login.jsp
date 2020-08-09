<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/login.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
    </head>
    <body>
        <p id="title"><a href="main.jsp">EveryAir</a></p>
        <form name="loginform">
	        <div id="login_form">
	            <p><input type="text" id="id" name="id" placeholder="아이디" onkeyup="enterkey()"/></p>
	            <p><input type="password" id="password" name="pw" placeholder="비밀번호" onkeyup="enterkey()"/></p>
	            <input type="hidden" name="url">
	            <p><a href='javascript:void(0);' onclick="login()">로그인</a></p>
	            <p><a href="register.jsp" id="register">회원가입</a>
	        </div>
        </form>
        <%@include file="footer.jsp" %>
        <script src="js/loginPage.js"></script>
    </body>
</html>