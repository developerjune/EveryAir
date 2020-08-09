<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="HTML Study">
		<meta name="keywords" content="HTML,CSS,XML,JavaScript">
		<meta name="author" content="June">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/board.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
		<title>Insert title here</title>
	</head>
	<body>
		<%@include file="header.jsp" %>
			<div id="mainDiv">
				<h2 id="title">QnA 게시판</h2>
				<c:choose>
					<c:when test="${sessionScope.id eq null}">
						<div id="button">
							<button class="b_btn" onclick="sessionNull()">질문하기</button>
						</div>
					</c:when>
					<c:otherwise>
						<div id="button">
							<a href="write_QnABoard.jsp" class="b_btn">질문하기</a>
						</div>
					</c:otherwise>
				</c:choose>
				<table border="1">
					<tr>
						<th>번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>조회수</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.no}</td>
							<td>
								<c:choose>
									<c:when test="${list.open eq 'N'}">
										<c:choose>
											<c:when test="${sessionScope.nickname eq '관리자'}">
												<c:choose>
													<c:when test="${list.indentnum eq 0}">
														<a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>&nbsp;<img class="lock" src="image/lock.png"/>
													</c:when>
													<c:when test="${list.indentnum eq 1}">
														&nbsp;&nbsp;&nbsp;<i class="xi-enter xi-x xi-flip-horizontal"></i><a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>&nbsp;<img class="lock" src="image/lock.png"/>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${sessionScope.nickname ne list.membernickname}">
												<c:choose>
													<c:when test="${sessionScope.nickname eq list.receiver}">
														<c:choose>
															<c:when test="${list.indentnum eq 0}">
																<a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>
															</c:when>
															<c:when test="${list.indentnum eq 1}">
																&nbsp;&nbsp;&nbsp;<i class="xi-enter xi-x xi-flip-horizontal"></i><a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>
															</c:when>
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${list.indentnum eq 0}">
																${list.title}&nbsp;<img class="lock" src="image/lock.png"/>
															</c:when>
															<c:when test="${list.indentnum eq 1}">
																&nbsp;&nbsp;&nbsp;<i class="xi-enter xi-x xi-flip-horizontal"></i>${list.title}&nbsp;<img class="lock" src="image/lock.png"/>
															</c:when>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<a class="myquestion" href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>&nbsp;<img class="lock" src="image/lock.png"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${list.indentnum eq 0}">
												<c:choose>
													<c:when test="${list.membernickname eq sessionScope.nickname}">
														<a class="myquestion" href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>
													</c:when>
													<c:otherwise>
														<a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${sessionScope.nickname eq '관리자'}">
														&nbsp;&nbsp;&nbsp;<i class="xi-enter xi-x xi-flip-horizontal"></i><a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>
													</c:when>
													<c:when test="${sessionScope.nickname eq list.receiver}">
														&nbsp;&nbsp;&nbsp;<i class="xi-enter xi-x xi-flip-horizontal"></i><a href="selectQnABoard.do?no=${list.no}&pageNo=${param.pageNo}&status=view">${list.title}</a>
													</c:when>
													<c:otherwise>
														&nbsp;&nbsp;&nbsp;<i class="xi-enter xi-x xi-flip-horizontal"></i>${list.title}&nbsp;<img class="lock" src="image/lock.png"/>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${list.membernickname}</td>
							<td>${list.wtime}</td>
							<td>${list.hit}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="searchZone">
				<div id="mainsearch">
					<form action="listQnABoard.do" method="get" onsubmit="return checkValue()">
						<select name="term" id="term" onchange="displayDateForm()">
							<option value="all">전체기간</option>
							<option value="day">1일</option>
							<option value="week">1주</option>
							<option value="month">1개월</option>
							<option value="year">1년</option>
							<option value="selectDate" id="selectDate">기간선택</option>
						</select>
						<span id="dateform"><input type="date" id="startdate" name="startdate">~<input type="date" id="enddate" name="enddate"></span>
						<select name="keywordType">
							<option value="titleandcontents">제목+내용</option>
							<option value="title">제목만</option>
							<option value="contents">내용만</option>
							<option value="membernickname">작성자</option>
						</select>
						<input type="search" id="keyword" name="keyword">
						<input type="hidden" value="1" name="pageNo">
						<input type="hidden" value="qnaboard" name="table">
						<input type="submit" value="검색">
						<input type="button" value="초기화" id="resetButton" onclick="resetQnABoard()">
					</form>
				</div>	
			</div>
			<div id='paging' class='list_n_menu'>
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<span class='normal'>처음</span>
					<span class='normal'>이전</span>
					<span class='normal'>1</span>
					<span class='normal'>다음</span>
					<span class='normal'>끝</span>
				</c:when>
				<c:when test="${param.keyword eq null}">
					<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
			        		<span class='disabled'>처음</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href='listQnABoard.do?pageNo=1&table=qnaboard'>처음</a>
			        	</c:otherwise>
	        		</c:choose>
		        	<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
			        		<span class='disabled'>이전</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href="#" onclick="getParameterByNameforList('pageNo', 'prev', 'qnaboard')">이전</a>
			        	</c:otherwise>
		        	</c:choose>
		        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
		        		<c:choose>
		        			<c:when test="${param.pageNo eq no}">
		        				<span class='current'>${no}</span>
		        			</c:when>
		        			<c:otherwise>
		        				<a href='listQnABoard.do?pageNo=${no}&table=qnaboard'>${no}</a>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:forEach>
		        	<c:choose>
			        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
			        		<span class='disabled'>다음</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href="#" onclick="getParameterByNameforList('pageNo', 'next', 'qnaboard')">다음</a>
			        	</c:otherwise>
		        	</c:choose>
		        	<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
			        		<span class='disabled'>끝</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href='listQnABoard.do?pageNo=${pagingDTO.totalPageCnt}&table=qnaboard'>끝</a>
			        	</c:otherwise>
		        	</c:choose>
				</c:when>
				<c:when test="${param.keyword ne null}">
					<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
			        		<span class='disabled'>처음</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href='listQnABoard.do?pageNo=1&keywordType=${param.keywordType}&keyword=${param.keyword}&table=qnaboard'>처음</a>
			        	</c:otherwise>
	        		</c:choose>
		        	<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
			        		<span class='disabled'>이전</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'prev', '${param.term}', '${param.keywordType}', '${param.keyword}', '${param.startdate}', '${param.enddate}', 'qnaboard')">이전</a>
			        	</c:otherwise>
		        	</c:choose>
		        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
		        		<c:choose>
		        			<c:when test="${param.pageNo eq no}">
		        				<span class='current'>${no}</span>
		        			</c:when>
		        			<c:otherwise>
		        				<a href='listQnABoard.do?pageNo=${no}&keywordType=${param.keywordType}&keyword=${param.keyword}&table=qnaboard'>${no}</a>
		        			</c:otherwise>
		        		</c:choose>
		        	</c:forEach>
		        	<c:choose>
			        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
			        		<span class='disabled'>다음</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'next', '${param.term}', '${param.keywordType}', '${param.keyword}', '${param.startdate}', '${param.enddate}', 'qnaboard')">다음</a>
			        	</c:otherwise>
		        	</c:choose>
		        	<c:choose>
			        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
			        		<span class='disabled'>끝</span>
			        	</c:when>
			        	<c:otherwise>
			        		<a href='listQnABoard.do?pageNo=${pagingDTO.totalPageCnt}&keywordType=${param.keywordType}&keyword=${param.keyword}&table=qnaboard''>끝</a>
			        	</c:otherwise>
		        	</c:choose>
				</c:when>
			</c:choose>
        	</div>
       	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script src="js/board.js"></script>
	</body>
</html>