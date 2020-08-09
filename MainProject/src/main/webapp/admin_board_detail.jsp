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
		<link rel="stylesheet" href="css/write_notice.css" type="text/css" />
		<title>Insert title here</title>
	</head>
	<body>
		<%@include file="admin_header.jsp" %>
		<h3>Question</h3>
		<form action="adminModifyBoard.do" method="post">
			<div id="content_section">
				<table class="questiontable">
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>제목</th><td><input type="text" id="title" name="title" value="${dto.title}"/></td>
					</tr>
					<tr>
						<th>내용</th><td><textarea id="contents" name="contents">${dto.contents}</textarea></td>
					</tr>
				</table>
				<input type="hidden" value="${dto.no}" name="no">
				<a class="questionlistbutton" href="adminListBoard.do?pageNo=${param.pageNo}&table=board">목록</a>
				<input class="answerbutton" type="submit" value="수정">
			</div>
		</form>
	</body>
</html>