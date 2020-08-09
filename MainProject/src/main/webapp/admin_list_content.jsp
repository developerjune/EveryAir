<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/list_content.css" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
    	<c:choose>
    		<c:when test="${sessionScope.id eq null}">
				<script src="js/sessionNull.js"></script>
			</c:when>
			<c:when test="${sessionScope.id ne 'administrator'}">
				<script src="js/preventConnection.js"></script>
			</c:when>
			<c:otherwise>
    	<%@include file="admin_header.jsp" %>
        <h3 id="title">공개 컨텐츠 목록</h3>
        <form action="adminListContent.do" method="get" onsubmit="return checkValue()">
        	<div id="search_form">
	            <table id="search_table" border="1">
	                <tbody>
	                    <tr>
	                        <th>검색분류</th>
	                        <td>
	                        	<select name="keywordType">
	                        		<option value="name" id="name">컨텐츠명</option>
	                        		<option value="address" id="address">주소</option>
	                        		<option value="phone" id="phone">전화번호</option>
	                        	</select>
	                        </td>
	                        <th>검색방식</th>
	                        <td>
	                        	<select name="searchType">
	                        		<option value="contain" id="contain">검색어 포함</option>
	                        		<option value="match" id="match">검색어 일치</option>
	                        	</select>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td colspan="4">
	                            <div class="box">
  								<div class="container-2">
								      <span class="icon"><i class="fa fa-search"></i></span>
								      <input type="search" name="keyword" id="search" placeholder="Search..." />
								</div>
							</div>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	            <div id="button">
	            	<input type="hidden" value="Y" name="open">
	            	<input type="hidden" value="1" name="pageNo">
	            	<input type="hidden" value="content" name="table">
	                <input type="submit" value="검색"><input type="button" onclick="resetListPage()" value="초기화">
	            </div>
        	</div>
        </form>
        <div id="deleteButton">
        	<span class="list_n_menu"><input type="button" value="선택삭제" onclick="removeContentCheck('multi', 0, ${param.pageNo}, '${param.open}')"></span>
        	<c:choose>
        		<c:when test="${param.keyword eq null}">
        			<span class="status">컨텐츠수: 총 ${pagingDTO.totalCnt}개</span><br>
        		</c:when>
        		<c:otherwise>
        			<span class="status">검색된 컨텐츠수: 총 ${pagingDTO.totalCnt}개</span><br>
        		</c:otherwise>
        	</c:choose>
        	<span class="status">총 ${pagingDTO.totalPageCnt}페이지 중 ${param.pageNo}페이지</span>
        </div>
        <div>
        	<div id="main_table">
            <table id="list_table">
                <tr>
                    <th><input type="checkbox" id="mainCheck" onclick="checkAll()"></th>
                    <th>썸네일</th>
                    <th>번호</th>
                    <th>컨텐츠명</th>
                    <th>주소</th>
                    <th>유선번호</th>
                    <th>분류</th>
                    <th>등록일자</th>
                    <th>조회수</th>
                    <th>비고</th>
                </tr>
            <c:forEach var="list" items="${list}">
            	<tr>
	            	<td><input type="checkbox" name="noArr" value="${list.no}"></td>
	            	<td><img src="image/contents/${list.thumbnail}"></td>
	            	<td>${list.no}</td>
	            	<td>${list.name}</td>
	            	<td>${list.address}</td>
	            	<td>${list.phone}</td>
	            	<td>${list.category}</td>
	            	<td>${list.registdate}</td>
	            	<td>${list.hit}</td>
	            	<td class='list_n_menu'><a href="adminSelectContent.do?no=${list.no}">수정</a><input type="button" value="삭제" onclick="removeContentCheck('single', ${list.no}, ${param.pageNo}, '${param.open}')"></td>
            	</tr>
        	</c:forEach>
            </table>
            </div>
        </div>
        <c:choose>
        	<c:when test="${param.keyword eq null}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='adminListContent.do?pageNo=1&table=content&open=${param.open}'>처음</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>이전</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforList('pageNo', 'prev', '${param.open}')">이전</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
        		<c:choose>
        			<c:when test="${param.pageNo eq no}">
        				<span class='current'>${no}</span>
        			</c:when>
        			<c:otherwise>
        				<a href='adminListContent.do?pageNo=${no}&table=content&open=${param.open}'>${no}</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
	        		<span class='disabled'>다음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforList('pageNo', 'next', '${param.open}')">다음</a>
	        	</c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
	        		<span class='disabled'>끝</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='adminListContent.do?pageNo=${pagingDTO.totalPageCnt}&table=content&open=${param.open}'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
 <%--------------------------------------------------------------------------------------------------- --%>
        	<c:when test="${param.keyword ne null}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='adminListContent.do?pageNo=1&table=content&searchType=${param.searchType}&keywordType=${param.keywordType}&keyword=${param.keyword}&open=${param.open}'>처음</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>이전</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'prev', '${param.searchType}', '${param.keywordType}', '${param.keyword}', '${param.open}')">이전</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
        		<c:choose>
        			<c:when test="${param.pageNo eq no}">
        				<span class='current'>${no}</span>
        			</c:when>
        			<c:otherwise>
        				<a href='adminListContent.do?pageNo=${no}&table=content&searchType=${param.searchType}&keywordType=${param.keywordType}&keyword=${param.keyword}&open=${param.open}'>${no}</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
	        		<span class='disabled'>다음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'next', '${param.searchType}', '${param.keywordType}', '${param.keyword}', '${param.open}')">다음</a>
	        	</c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
	        		<span class='disabled'>끝</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='adminListContent.do?pageNo=${pagingDTO.totalPageCnt}&table=content&searchType=${param.searchType}&keywordType=${param.keywordType}&keyword=${param.keyword}&open=${param.open}'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
        </c:choose>
        </c:otherwise>
    	</c:choose>
        <script src="js/adminContentPage.js"></script>
        <script src="js/confirmDeleteContent.js"></script>
    </body>
</html>