<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행 여행지 추천">
        <meta name="author" content="June">
        <title>EveryAir</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/content_detail.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
    </head>
    <body>
    <c:choose>
    	<c:when test="${sessionScope.id eq null}">
			<script src="js/sessionNull.js"></script>
		</c:when>
		<c:otherwise>
			<%@include file="header.jsp"%>
        <div id="title">
        <pre><b>                                                              ${dto.name}</b>                                                                          찜하기<label class="checkbox-wrap"><input type="checkbox"><i class="check-icon"></i></label>   조회수 ${dto.hit}</pre>
        </div>
        <div id="container">
        <c:forEach var="list" items="${list}">
            <div class="mySlides">
                <img src="image/contents/${list.name}" class="mainImage">
            </div>
        </c:forEach>
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>

            <div class="row">
            <c:forEach var="list" items="${list}" varStatus="status">
                <div class="column">
                    <img class="demo cursor" src="image/contents/${list.name}" onclick="currentSlide(${status.index+1})">
                </div>
            </c:forEach>
            </div>
            <div id="description">
            	<h3>상세 정보</h3>
	            	<pre>전화번호: ${dto.phone}

홈페이지: <a class="url" href="${dto.url}">${dto.url}</a>

${dto.description}</pre>
        	</div>
        </div>
        <%@include file="footer.jsp"%>
		</c:otherwise>
		</c:choose>
        <script src="js/content.js"></script>
    </body>
</html>