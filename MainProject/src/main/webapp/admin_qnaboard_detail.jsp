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
		<link rel="stylesheet" href="css/admin_qna_detail.css" type="text/css" />
		<title>Insert title here</title>
	</head>
	<body>
		<%@include file="admin_header.jsp" %>
		<h3>Question</h3>
		<div id="content_section">
				<table class="questiontable">
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>제목</th><td><input type="text" id="title" name="title" value="${questionDTO.title}" readonly/></td>
					</tr>
					<tr>
						<th>내용</th><td><textarea id="contents" name="contents" readonly>${questionDTO.contents}</textarea></td>
					</tr>
				</table>
				<c:choose>
					<c:when test="${answerDTO.title eq null}">
						<a class="questionlistbutton" href="adminListQnABoard.do?pageNo=${param.pageNo}&table=qnaboard">목록</a>
						<a class="answerbutton" href="adminSelectQuestion.do?no=${questionDTO.no}&pageNo=${param.pageNo}">답변</a>
					</c:when>
					<c:otherwise>
						<input type="button" class="alertbutton" value="답변" onclick="alreadyAnswer()">
					</c:otherwise>
				</c:choose>
		</div>
		<c:if test="${answerDTO.title ne null}">
		<h3>Answer</h3>
		<div id="content_section">
			<form action="adminModifyAnswer.do" method="post" onsubmit="return checkBlank()">
				<table>
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>제목</th><td><input type="text" id="answertitle" name="title" value="${answerDTO.title}"/></td>
					</tr>
					<tr>
						<th>내용</th><td><textarea id="answercontents" name="contents">${answerDTO.contents}</textarea></td>
					</tr>
				</table>
				<input type="hidden" value="${answerDTO.no}" name="no">
				<input type="hidden" value="${answerDTO.groupnum}" name="groupnum">
				<input type="hidden" value="${param.pageNo}" name="pageNo">
				<a class="listbutton" href="adminListQnABoard.do?pageNo=${param.pageNo}&table=qnaboard">목록</a><input class="modifybutton" type="submit" value="수정"><input class="deletebutton" type="button" value="삭제" onclick="confirmDeleteAnswer(${answerDTO.no}, ${param.pageNo}, ${param.groupnum})">
			</form>
		</div>
		</c:if>
		<script src="js/qnaDetailPage.js"></script>
	</body>
</html>