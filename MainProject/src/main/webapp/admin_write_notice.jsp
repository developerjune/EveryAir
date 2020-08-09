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
		<link rel="stylesheet" href="css/write_notice.css" type="text/css" />
		<title>Insert title here</title>
	</head>
	<body>
		<%@include file="admin_header.jsp" %>
		<h3>공지사항 작성</h3>
		<div id="content_section">
			<form action="adminWriteNotice.do" method="post" onsubmit="return checkBlank()">
				<table>
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>제목</th><td><input type="text" id="title" name="title"/></td>
					</tr>
					<tr>
						<th>내용</th><td><textarea id="contents" name="contents"></textarea></td>
					</tr>
				</table>
				<input type="hidden" value="Y" name="notice">
				<input type="submit" value="등록" class="modifybutton">
			</form>
		</div>
		<script src="js/adminBoardPage.js"></script>
	</body>
</html>