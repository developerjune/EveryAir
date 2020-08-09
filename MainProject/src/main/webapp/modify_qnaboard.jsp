<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행, 여행지, 추천">
        <meta name="author" content="June">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/reset.css">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
		<link rel="stylesheet" href="css/common.css">
		<link rel="stylesheet" href="css/sub.css">
		<title>EveryAir</title>
	</head>
	<body>
	<c:choose>
		<c:when test="${sessionScope.id eq null}">
			<script src="js/sessionNull.js"></script>
		</c:when>
		<c:otherwise>
			<%@ include file="header.jsp" %>
				<form class="inquiry_form" action="modifyQnA.do" method="post" onsubmit="return checkBlank()">
			    <div id="edit_wrap">
			       <h2>문의글 수정</h2><a href="listQnABoard.do?pageNo=1&table=qnaboard" class="inquiryLi_btn">전체 문의 리스트</a>
			       <p>이미 답변이 작성된 글을 수정하는 경우 답변이 다소 늦을 수 있는 점 양해 부탁드립니다.</p>
			            <table>
			            	<colgroup>
			            		<col width="7%">
			            		<col width="93%">
			            	</colgroup>
			                <tr>
			                    <td>분류<span class="form_red">*</span></td>
			                    <td>
			                    	<select name="category" id="category">
			                    		<option value="">선택</option>
			                    		<option value="컨텐츠 추가 요청" id="addContents">컨텐츠 추가 요청</option>
			                    		<option value="홈페이지 오류" id="errorPage">홈페이지 오류</option>
			                    		<option value="기타" id="etc">기타</option>
			                    	</select>
			                    </td>
			                </tr>
			                <tr>
			                    <td>제목<span class="form_red">*</span></td>
			                    <td><input style="width:100%" type="text" name="title" id="title" value="${dto.title}"/></td>
			                </tr>
			            </table>
			            <textarea rows="15" cols="100" name="contents" id="contents" placeholder="문의 내용을 입력하세요.">${dto.contents}</textarea>
			            <span id="opentext">공개여부</span><span class="form_red">*</span>&nbsp;&nbsp;
			    		<input type="radio" id="Y" name="open" value="Y">
			    		<label for="Y" class="open"><div class="checkbutton"><span class="blank" id="yspan">&nbsp;&nbsp;</span><img src="image/check.png" id="ycheck"></div>공개</label>
			    		<input type="radio" id="N" name="open" value="N">
			    		<label for="N" class="open"><div class="checkbutton"><span class="blank" id="nspan">&nbsp;&nbsp;</span><img src="image/check.png" id="ncheck"></div>비공개</label>
			    		<span id="description">*비공개시 관리자만 열람이 가능합니다.</span>
			    </div>
			    <div class="wrapper">
				    <div class="edit_btn">
				    	<a class="w_btn" href="selectQnABoard.do?no=${param.no}&pageNo=${param.pageNo}&status=view">돌아가기</a>
				    	<input type="hidden" value="${dto.no}" name="no">
				    	<input type="hidden" value="${param.pageNo}" name="pageNo">
				        <input class="b_btn" type="submit" value="수정하기">
				    </div>
			    </div>
			    </form>
			</c:otherwise>
		</c:choose>
	    <script src="js/QnABoard.js"></script>
	    <script>autoCheck('${dto.category}', '${dto.open}')</script>
	</body>
</html>