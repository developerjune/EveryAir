<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/admin_list_board.css" type="text/css" />
    </head>
    <body>
    	<div id="loading">
    		<img id="loading-image" src="image/ajax-loader.gif" alt="Loading..." />
    	</div>
    	<c:choose>
    		<c:when test="${sessionScope.id eq null}">
				<script src="js/sessionNull.js"></script>
			</c:when>
			<c:when test="${sessionScope.id ne 'administrator'}">
				<script src="js/preventConnection.js"></script>
			</c:when>
			<c:otherwise>
    	<%@include file="admin_header.jsp" %>
        <h3>QnA 게시판 목록</h3>
        <form action="adminListQnABoard.do" method="get" onsubmit="return checkValue()">
	        <div id="search_zone">
	            <table id="search_table">
	                <tr>
	                    <th>기간</th>
	                    <td>
	                    	<input type="radio" id="all" name="term" value="all" checked>
	                    	<input type="radio" id="today" name="term" value="day">
	                        <input type="radio" id="week" name="term" value="week">
	                        <input type="radio" id="month" name="term" value="month">
	                        <input type="radio" id="year" name="term" value="year">
	                        <input type="radio" id="selectDate" name="term" value="selectDate">
	                        <label for="all">전체</label>
	                        <label for="today">1일</label>
	                        <label for="week">1주</label>
	                        <label for="month">1개월</label>
	                        <label for="year">1년</label>
	                        <span id="calender"><input type="date" id="startdate" name="startdate">~<input type="date" id="enddate" name="enddate"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <th>키워드</th>
	                    <td>
	                        <select name="keywordType">
	                            <option value="titleandcontents">제목+내용</option>
	                            <option value="title">제목</option>
	                            <option value="contents">내용</option>
	                            <option value="category">카테고리</option>
	                            <option value="membernickname">작성자</option>
	                        </select>
	                        <input type="text" id="keyword" name="keyword">
	                    </td>
	                </tr>
	            </table>
	            <input type="hidden" value="1" name="pageNo">
	            <input type="hidden" value="qnaboard" name="table">
	            <input type="submit" value="검색"><input type="button" onclick="resetPage()" value="초기화">
	        </div>
        </form>
        <div id="deleteButton">
        	<span class="list_n_menu"><input type="button" value="선택삭제" onclick="removeQuestionCheck('multi', 0)"></span>
        	<c:choose>
        		<c:when test="${param.keyword eq null}">
        			<span class="status">질문글수: 총 ${pagingDTO.totalCnt}</span><br>
        		</c:when>
        		<c:otherwise>
        			<span class="status">검색된 질문글수: 총 ${pagingDTO.totalCnt}</span><br>
        		</c:otherwise>
        	</c:choose>
        	<span class="status">총 ${pagingDTO.totalPageCnt}페이지 중 ${param.pageNo}페이지</span>
        </div>
        <div id="main_table">
        <table id="list_table">
            <tr>
                <td><input type="checkbox" id="mainCheck" onclick="checkAll()"></td>
                <td>답변여부</td>
                <td>번호</td>
                <td>카테고리</td>
                <td>제목</td>
                <td>작성자</td>
                <td>작성일자</td>
                <td>조회수</td>
                <td>비고</td>
            </tr>
        <c:forEach var="list" items="${list}" varStatus="status">
            <tr>
            	<td><input type="checkbox" name="noArr" value="${list.groupnum}"></td>
            	<c:choose>
            		<c:when test="${list.answer eq 'N'}">
            			<td><span class="waiting">대기</span></td>
            		</c:when>
            		<c:otherwise>
            			<td><span class="complete">완료</span></td>
            		</c:otherwise>
            	</c:choose>
            	<td>${list.no}</td>
            	<td>${list.category}</td>
            	<td>${list.title}</td>
            	<td>${list.membernickname}</td>
            	<td>${list.wtime}</td>
            	<td>${list.hit}</td>
            	<td class='list_n_menu'>&nbsp;&nbsp;<a href="adminSelectQnABoard.do?groupnum=${list.groupnum}&pageNo=${param.pageNo}">조회</a><input type="button" value="삭제" onclick="removeQuestionCheck('single', ${list.groupnum})"></td>
            </tr>
        </c:forEach>
        </table>
        </div>
        <c:choose>
        	<c:when test="${param.term eq null}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='adminListQnABoard.do?pageNo=1&table=adminqnaboard'>처음</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>이전</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforList('pageNo', 'prev')">이전</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
        		<c:choose>
        			<c:when test="${param.pageNo eq no}">
        				<span class='current'>${no}</span>
        			</c:when>
        			<c:otherwise>
        				<a href='adminListQnABoard.do?pageNo=${no}&table=adminqnaboard'>${no}</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
	        		<span class='disabled'>다음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforList('pageNo', 'next')">다음</a>
	        	</c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
	        		<span class='disabled'>끝</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='adminListQnABoard.do?pageNo=${pagingDTO.totalPageCnt}&table=adminqnaboard'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
 <%--------------------------------------------------------------------------------------------------- --%>
        	<c:when test="${param.term ne null}">
        		<div id='paging' class='list_n_menu'>
					<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
			        		<span class='disabled'>처음</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href='adminListQnABoard.do?pageNo=1&term=${param.term}&keywordType=${param.keywordType}&keyword=${param.keyword}&startdate=${param.startdate}&enddate=${param.enddate}&table=adminqnaboard'>처음</a>
			        	</c:otherwise>
	        		</c:choose>
		        	<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
			        		<span class='disabled'>이전</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'prev', '${param.term}', '${param.keywordType}', '${param.keyword}', '${param.startdate}', '${param.enddate}')">이전</a>
			        	</c:otherwise>
		        	</c:choose>
		        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
		        		<c:choose>
		        			<c:when test="${param.pageNo eq no}">
		        				<span class='current'>${no}</span>
		        			</c:when>
		        			<c:otherwise>
		        				<a href='adminListQnABoard.do?pageNo=${no}&term=${param.term}&keywordType=${param.keywordType}&keyword=${param.keyword}&startdate=${param.startdate}&enddate=${param.enddate}&table=adminqnaboard'>${no}</a>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:forEach>
		        	<c:choose>
			        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
			        		<span class='disabled'>다음</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'next', '${param.term}', '${param.keywordType}', '${param.keyword}', '${param.startdate}', '${param.enddate}')">다음</a>
			        	</c:otherwise>
		        	</c:choose>
		        	<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
			        		<span class='disabled'>끝</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href='adminListQnABoard.do?pageNo=${pagingDTO.totalPageCnt}&term=${param.term}&keywordType=${param.keywordType}&keyword=${param.keyword}&startdate=${param.startdate}&enddate=${param.enddate}&table=adminqnaboard'>끝</a>
			        	</c:otherwise>
		        	</c:choose>
		        	</div>
				</c:when>
        </c:choose>
        </c:otherwise>
    	</c:choose>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    	<script src="js/adminQnABoardPage.js"></script>
    	<script src="js/confirmDeleteQna.js"></script>
    </body>
</html>