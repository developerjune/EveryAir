<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행, 여행지, 추천">
        <meta name="author" content="June">
        <title>EveryAir</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/view_by_list.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    </head>
    <body>
   	<c:choose>
		<c:when test="${sessionScope.id eq null}">
			<script src="js/sessionNull.js"></script>
		</c:when>
		<c:otherwise>
			<%@include file="header.jsp"%>
	        <div id="view_by_region">
	            <p><img src="image/map.PNG" /><b>지역 선택</b></p>
	            <form action="viewByList.do" method="get">
	            <c:forEach var="sido" items="${listSido}">
	            	<input type="radio" id="${sido.sido}" name="sido" value="${sido.sido}">
	            </c:forEach>
	            	<input type="radio" id="all" name="sido" checked="checked" value="">
	            <section id="region_list">
	            <c:forEach var="sido" items="${listSido}">
	            	<label for="${sido.sido}"><span>${sido.sido}</span></label>
	            </c:forEach>
	            	<label for="all"><span>전체</span></label>
	            </section>
	            <div id="region_detail">
	            	<c:forEach var="sigungu" items="${listSigungu}" begin="0" end="24">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="seoul_all" name="sigungu" value="">
	                <table id="gu_of_seoul">
	                    <tr>
	                    	<c:forEach var="sigungu" items="${listSigungu}" begin="0" end="12">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                    </tr>
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="13" end="24">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                        <td><label for="seoul_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="25" end="55">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="gyungki_all" name="sigungu" value="">
	                <table id="city_of_gyungki">
	                    <tr>
	                    	<c:forEach var="sigungu" items="${listSigungu}" begin="25" end="40">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                    </tr>
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="41" end="55">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                        <td><label for="gyungki_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="56" end="65">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="inchoen_all" name="sigungu" value="">
	                <table id="gu_of_inchoen">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="56" end="65">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                        <td><label for="inchoen_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="66" end="83">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="gangwon_all" name="sigungu" value="">
	                <table id="city_of_gangwon">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="66" end="81">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                    </tr>
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="82" end="83">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                        <td><label for="gangwon_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="84" end="98">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="chungnam_all" name="sigungu" value="">
	                <table id="city_of_chungnam">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="84" end="98">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="chungnam_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="99" end="103">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="daejeon_all" name="sigungu" value="">
	                <table id="gu_of_daejeon">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="99" end="103">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="daejeon_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="105" end="115">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="chungbuk_all" name="sigungu" value="">
	                <table id="city_of_chungbuk">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="105" end="115">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="chungbuk_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="116" end="138">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="gyungbuk_all" name="sigungu" value="">
	                <table id="city_of_gyungbuk">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="116" end="131">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                    </tr>
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="132" end="138">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="gyungbuk_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="139" end="156">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="gyungnam_all" name="sigungu" value="">
	                <table id="city_of_gyungnam">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="139" end="154">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                    </tr>
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="155" end="156">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="gyungnam_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="157" end="164">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="daegu_all" name="sigungu" value="">
	                <table id="gu_of_daegu">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="157" end="164">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="daegu_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="165" end="169">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="ulsan_all" name="sigungu" value="">
	                <table id="gu_of_ulsan">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="165" end="169">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="ulsan_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="170" end="185">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="busan_all" name="sigungu" value="">
	                <table id="gu_of_busan">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="170" end="185">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="busan_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="186" end="199">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="jeonbuk_all" name="sigungu" value="">
	                <table id="city_of_jeonbuk">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="186" end="199">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="jeonbuk_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="200" end="221">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="jeonnam_all" name="sigungu" value="">
	                <table id="city_of_jeonnam">
	                	<tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="200" end="215">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
	                    </tr>
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="216" end="221">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="jeonnam_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	                <c:forEach var="sigungu" items="${listSigungu}" begin="222" end="223">
	            		<input type="radio" id="${sigungu.sigungu}" name="sigungu" value="${sigungu.sigungu}">
		            </c:forEach>
		            	<input type="radio" id="jeju_all" name="sigungu" value="">
	                <table id="city_of_jeju">
	                    <tr>
	                        <c:forEach var="sigungu" items="${listSigungu}" begin="222" end="223">
				            	<td><label for="${sigungu.sigungu}"><span>${sigungu.sigungu}</span></label></td>
				            </c:forEach>
				            <td><label for="jeju_all"><span>전체</span></label></td>
	                    </tr>
	                </table>
	                <%-- ----------------------------------------------------------------------------------- --%>
	             </div>
	                <div id="category">
	                    <input type="radio" id="tour" name="category" value="관광지">
	                    <input type="radio" id="accommodation" name="category" value="숙박시설">
	                    <input type="radio" id="restaurant" name="category" value="맛집">
	                    <input type="radio" id="allcategory" name="category" value="">
	                    <section id="catogory_buttons">
	                        <label for="tour">관광지</label>
	                        <label for="accommodation">숙박시설</label>
	                        <label for="restaurant">맛집</label>
	                        <label for="allcategory">전체</label><input type="submit" id="submitbutton" value="검색">
	                    </section>
	                </div>
	                <input type="hidden" value="Y" name="open">
	            	<input type="hidden" value="1" name="pageNo">
	            	<input type="hidden" value="content" name="table">
	            	<input type="hidden" value="contain" name="searchType">
	            	<input type="hidden" value="address" name="keywordType">
	                </form>
	                <div id="main">
	                    <c:forEach var="list" items="${requestScope.list}">
		                    <div class="contents">
	                            <a href="selectContent.do?no=${list.no}"><img class="thumbnail" src="image/contents/${list.thumbnail}" onerror="this.src='https://via.placeholder.com/100'"></a>
	                            <h3><a href="selectContent.do?no=${list.no}">${list.name}</a></h3>
	                            	${list.address}<br>
	                            	${list.phone}
	                        </div>
                        </c:forEach>
	                </div>
	            </div>
	            <c:choose>
        	<c:when test="${param.sido eq null}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='viewByList.do?pageNo=1&table=content&open=${param.open}'>처음</a>
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
        				<a href='viewByList.do?pageNo=${no}&table=content&open=${param.open}'>${no}</a>
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
	        		<a href='viewByList.do?pageNo=${pagingDTO.totalPageCnt}&table=content&open=${param.open}'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
 <%--------------------------------------------------------------------------------------------------- --%>
        	<c:when test="${param.sido ne null || param.sido eq ''}">
        		<div id='paging' class='list_n_menu'>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>처음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='viewByList.do?pageNo=1&table=content&sido=${param.sido}&sigungu=${param.sigungu}&category=${param.category}&open=${param.open}&keywordType=address&searchType=contain'>처음</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt eq 1 }">
	        		<span class='disabled'>이전</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'prev', '${param.sido}', '${param.sigungu}', '${param.category}')">이전</a>
	        	</c:otherwise>
        	</c:choose>
        	
        	<c:forEach var="no" begin="${pagingDTO.startViewPageCnt}" end="${pagingDTO.endViewPageCnt}">
        		<c:choose>
        			<c:when test="${param.pageNo eq no}">
        				<span class='current'>${no}</span>
        			</c:when>
        			<c:otherwise>
        				<a href='viewByList.do?pageNo=${no}&table=content&sido=${param.sido}&sigungu=${param.sigungu}&category=${param.category}&open=${param.open}&keywordType=address&searchType=contain'>${no}</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	
        	<c:choose>
	        	<c:when test="${pagingDTO.endViewPageCnt eq pagingDTO.totalPageCnt }">
	        		<span class='disabled'>다음</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="getParameterByNameforSearchList('pageNo', 'next', '${param.sido}', '${param.sigungu}', '${param.category}')">다음</a>
	        	</c:otherwise>
        	</c:choose>
        	<c:choose>
	        	<c:when test="${pagingDTO.startViewPageCnt + 9 ge pagingDTO.totalPageCnt }">
	        		<span class='disabled'>끝</span>
	        	</c:when>
	        	<c:otherwise>
	        		<a href='viewByList.do?pageNo=${pagingDTO.totalPageCnt}&table=content&sido=${param.sido}&sigungu=${param.sigungu}&category=${param.category}&open=${param.open}&keywordType=address&searchType=contain'>끝</a>
	        	</c:otherwise>
        	</c:choose>
        </div>
        	</c:when>
        </c:choose>
        <%@include file="footer.jsp"%>
		</c:otherwise>
		</c:choose>
		<script src="js/content.js"></script>
		<script>checkElement()</script>
    </body>
</html>