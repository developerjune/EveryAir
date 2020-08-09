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
		<h3>답변 작성</h3>
		<div id="content_section">
			<form action="adminAnswerQuestion.do" method="post" onsubmit="return checkBlank()">
				<table>
					<colgroup>
						<col style="width: 154px;">
						<col style="width: auto;">
					</colgroup>
					<tr>
						<th>제목</th><td><input type="text" id="title" name="title" value="${dto.title}"/></td>
					</tr>
					<tr>
						<th>내용</th><td><textarea id="contents" name="contents">${dto.contents}&#13;-------------------------------------------------------------&#13;&#13;Reply To&nbsp;${dto.membernickname}.&#13;&#13;안녕하세요 ${dto.membernickname}님. EveryAir 입니다.&#13;&#13;</textarea></td>
					</tr>
				</table>
				<input type="hidden" value="${dto.no}" name="no">
				<input type="hidden" value="${dto.groupnum}" name="groupnum">
				<input type="hidden" value="${dto.stepnum}" name="stepnum">
				<input type="hidden" value="${dto.indentnum}" name="indentnum">
				<input type="hidden" value="답변" name="category">
				<input type="hidden" value="${dto.open}" name="open">
				<input type="hidden" value="${dto.membernickname}" name="receiver">
				<input type="hidden" value="Y" name="answer">
				<input type="hidden" value="${param.pageNo}" name="pageNo">
				<a class="replyformlistbutton" href="adminListQnABoard.do?pageNo=${param.pageNo}&table=qnaboard">목록</a><input class="answerbutton" type="submit" value="답변">
			</form>
		</div>
		<script src="js/adminBoardPage.js"></script>
	</body>
</html>