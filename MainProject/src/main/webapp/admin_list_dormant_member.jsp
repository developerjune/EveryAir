<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/admin_member_list.css" type="text/css" />
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
        <h3 id="title">휴면 회원 목록</h3>
        <form action="memberSearchList.adminMember" method="get" onsubmit="return checkValue()">
        	<div id="search_form">
	            <table id="search_table" border="1">
	                <tbody>
	                    <tr>
	                        <th>검색분류</th>
	                        <td>
	                        	<select name="keywordType">
	                        		<option value="id">아이디</option>
	                        		<option value="nickname">닉네임</option>
	                        		<option value="email">이메일</option>
	                        		<option value="phonenumber">휴대폰번호</option>
	                        	</select>
	                        </td>
	                        <th>검색방식</th>
	                        <td>
	                        	<select name="searchType">
	                        		<option value="contain">검색어 포함</option>
	                        		<option value="match">검색어 일치</option>
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
	            	<input type="hidden" value="N" name="denied">
	            	<input type="hidden" value="1" name="pageNo">
	            	<input type="hidden" value="member" name="table">
	                <input type="submit" value="검색"><input type="button" onclick="resetListDormantPage()" value="초기화">
	            </div>
        	</div>
        </form>
        <div id="deleteButton">
        	<span class="list_n_menu"><input type="button" value="선택삭제" onclick="removeMemberCheck('multi', 0, ${param.pageNo}, '${param.denied}')"></span>
        	<c:choose>
        		<c:when test="${param.keyword eq null}">
        			<span class="status">휴면 회원수: 총 ${totalCnt}명</span><br>
        		</c:when>
        		<c:otherwise>
        			<span class="status">검색된 회원수: 총 ${totalCnt}명</span><br>
        		</c:otherwise>
        	</c:choose>
        	<span class="status">총 ${totalPageCnt}페이지 중 ${param.pageNo}페이지</span>
        </div>
        <div id="main_table">
        <table id="list_table">
            <tr>
                <td><input type="checkbox" id="mainCheck" onclick="checkAll()"></td>
                <td>번호</td>
                <td>아이디</td>
                <td>닉네임</td>
                <td>이메일</td>
                <td>휴대폰번호</td>
                <td>가입일자</td>
                <td>비고</td>
            </tr>
            <c:forEach var="list" items="${list}">
             <tr>
             	<td><input type="checkbox" name="noArr" value="${list.no}"></td>
             	<td>${list.no}</td>
             	<td>${list.id}</td>
             	<td>${list.nickname}</td>
             	<td>${list.email}</td>
             	<td>${list.phonenumber}</td>
             	<td>${list.subscriptiondate}</td>
             	<td class='list_n_menu'><a href="memberSelect.adminMember?no=${list.no}&pageNo=${param.pageNo}&denied=${param.denied}">수정</a><input type="button" value="삭제" onclick="removeMemberCheck('single', ${list.no}, ${param.pageNo}, '${param.denied}')"></td>
             </tr>
            </c:forEach>
        </table>
        </div>
        <c:choose>
        	<c:when test="${param.keyword eq null}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='memberList.adminMember?pageNo=1&table=member&denied=${param.denied}'>처음</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
	        	<c:when test="${startViewPageCnt eq 1 }">
	        		<span class='disabled'>이전</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforList('pageNo', 'prev', '${param.denied}')">이전</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="no" begin="${startViewPageCnt}" end="${endViewPageCnt}">
        		<c:choose>
        			<c:when test="${param.pageNo eq no}">
        				<span class='current'>${no}</span>
        			</c:when>
        			<c:otherwise>
        				<a href='memberList.adminMember?pageNo=${no}&table=member&denied=${param.denied}'>${no}</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:choose>
	        	<c:when test="${endViewPageCnt eq totalPageCnt }">
	        		<span class='disabled'>다음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforList('pageNo', 'next', '${param.denied}')">다음</a>
	        	</c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${startViewPageCnt + 9 ge totalPageCnt }">
	        		<span class='disabled'>끝</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='memberList.adminMember?pageNo=${totalPageCnt}&table=member&denied=${param.denied}'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
 <%--------------------------------------------------------------------------------------------------- --%>
        	<c:when test="${param.keyword ne null}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='memberSearchList.adminMember?pageNo=1&table=member&searchType=${param.searchType}&keywordType=${param.keywordType}&keyword=${param.keyword}&denied=${param.denied}'>처음</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
	        	<c:when test="${startViewPageCnt eq 1 }">
	        		<span class='disabled'>이전</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'prev', '${param.searchType}', '${param.keywordType}', '${param.keyword}', '${param.denied}')">이전</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="no" begin="${startViewPageCnt}" end="${endViewPageCnt}">
        		<c:choose>
        			<c:when test="${param.pageNo eq no}">
        				<span class='current'>${no}</span>
        			</c:when>
        			<c:otherwise>
        				<a href='memberSearchList.adminMember?pageNo=${no}&table=member&searchType=${param.searchType}&keywordType=${param.keywordType}&keyword=${param.keyword}&denied=${param.denied}'>${no}</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:choose>
	        	<c:when test="${endViewPageCnt eq totalPageCnt }">
	        		<span class='disabled'>다음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'next', '${param.searchType}', '${param.keywordType}', '${param.keyword}', '${param.denied}')">다음</a>
	        	</c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${startViewPageCnt + 9 ge totalPageCnt }">
	        		<span class='disabled'>끝</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='memberSearchList.adminMember?pageNo=${totalPageCnt}&table=member&searchType=${param.searchType}&keywordType=${param.keywordType}&keyword=${param.keyword}&denied=${param.denied}'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
        	<c:otherwise>
        		<span class='disabled'>처음</span><span class='disabled'>이전</span><a href="#">0</a><span class='disabled'>다음</span><span class='disabled'>끝</span>
        	</c:otherwise>
        </c:choose>
        </c:otherwise>
    	</c:choose>
        <script src="js/adminMemberPage.js"></script>
        <script src="js/confirmDeleteMember.js"></script>
        <script>autoSelect('${param.keywordType}', '${param.searchType}', '${param.keyword}')</script>
    </body>
</html>