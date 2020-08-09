<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="HTML Study">
		<meta name="keywords" content="HTML,CSS,XML,JavaScript">
		<meta name="author" content="June">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/id_check_form.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>휴대폰 번호 인증</h2>
		<form method="get" action="sendSMS.do" onsubmit="return checkPhoneNumberLength()">
			휴대폰 번호:<input type="text" name="phonenumber" id="phonenumber" >
			<input type="submit" value="인증 번호 받기">
		</form>
		<script src="js/checkInfo.js"></script>
	</body>
</html>