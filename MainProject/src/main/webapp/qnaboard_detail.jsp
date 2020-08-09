<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행, 여행지, 추천">
        <meta name="author" content="June">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>EveryAir</title>
        <link rel="stylesheet" href="css/qna_board_detail.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    </head>
    <body>
    	<%@include file="header.jsp" %>
    	<div id="main_div">
        <div id="main_section">
            <article class="main_article">
                <p>${dto.title}&nbsp;&nbsp;|<span id="freeboard"> QnA 게시판</span><span>작성자: ${dto.membernickname} | 조회수 ${dto.hit}
                <c:choose>
       				<c:when test="${sessionScope.nickname eq dto.membernickname}">
       						<a href="selectQnABoard.do?no=${dto.no}&pageNo=${param.pageNo}&status=modify">
       						<i class="xi-pen xi-0.5x"></i>수정</a> |&nbsp<button type="button"class="boardbutton" onclick="deleteQnABoard(${dto.groupnum})">
       						<i class="xi-trash-o xi-x"></i>삭제</button>
       						<input type="hidden" value="${dto.no}" name="no">
       				</c:when>
       			</c:choose>
                </span><br><span>작성일자: ${dto.wtime}</span></p>
                <span id="contents">${dto.contents}</span>
            </article>
        </div>
        <div id="listbutton">
        	<a href="listQnABoard.do?pageNo=${param.pageNo}&table=qnaboard">목록으로</a>
        </div>
	    </div>
	    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="js/board.js"></script>
    </body>
</html>