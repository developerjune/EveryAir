<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="HTML Study">
		<meta name="keywords" content="HTML,CSS,XML,JavaScript">
		<meta name="author" content="June">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/admin_member_modify.css" type="text/css">
		<title>Insert title here</title>
	</head>
	<body>
		<%@include file="admin_header.jsp" %>
		<h3>회원 정보 수정</h3>
        <div id="main_content" >
        	<form action="adminModifyMember.do" method="post" onsubmit="return checkInfo()">
	        	<table border="1">
	        		<tr>
	        			<td>ID</td><td><input type="text" id="id" name="id" value="${dto.id}"></td>
	        		</tr>
	        		<tr>
	        			<td>PW</td><td><input type="text" id="password" name="pw" value="${dto.pw}"></td>
	        		</tr>
	        		<tr>
	        			<td>닉네임</td><td><input type="text" id="nickname" name="nickname" value="${dto.nickname}"></td>
	        		</tr>
	        		<tr>
	        			<td>이메일</td><td><input type="text" id="email" name="email" value="${dto.email}"></td>
	        		</tr>
	        		<tr>
	        			<td>전화번호</td><td><input type="text" id="phoneNumber" name="phonenumber" value="${dto.phonenumber}"></td>
	        		</tr>
	        		<tr>
	        			<td>계정상태</td>
	        			<td>
		        			<select name="denied">
		        			<c:choose>
							<c:when test="${dto.denied eq 'Y'}">
			            		<option value="Y" selected>Y</option>
			            		<option value="N">N</option>
			            	</c:when>
			            	<c:when test="${dto.denied eq 'N'}">
			            		<option value="Y">Y</option>
			            		<option value="N" selected>N</option>
			            	</c:when>
			            	</c:choose>
		            		</select>
	            		</td>
	        		</tr>
	        	</table>
	        	<div id="button">
            	<input type="hidden" value="${param.no}" name="no">
            	<input type="hidden" value="${param.denied}" name="pagedenied">
                <input type="submit" value="수정">
            </div>
        	</form>
        </div>
        <script src="js/checkInfo.js"></script>
	</body>
</html>