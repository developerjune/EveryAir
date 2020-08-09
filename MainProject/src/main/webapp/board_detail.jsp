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
        <link rel="stylesheet" href="css/board_detail.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    </head>
    <body>
    	<%@include file="header.jsp" %>
    	<div id="main_div">
	        <div id="main_section">
	            <article class="main_article">
	                <p>${dto.title}&nbsp;&nbsp;|<span id="freeboard"> 자유게시판</span><span>작성자: ${dto.membernickname}
	                <c:choose>
	       				<c:when test="${sessionScope.nickname eq dto.membernickname}">
	       					<c:if test="${dto.notice ne 'Y'}">
	       						<a href="selectBoard.do?no=${dto.no}&pageNo=${param.pageNo}&status=modify"><i class="xi-pen xi-0.5x"></i>수정</a> |&nbsp<button type="button"class="boardbutton" onclick="deleteBoard(${dto.no}, ${fn:length(list)})"><i class="xi-trash-o xi-x"></i>삭제</button>
	       					</c:if>
	       				</c:when>
	       			</c:choose>
	                </span><br><span>작성일자: ${dto.wtime}</span></p>
	                <span id="contents">${dto.contents}</span>
	            </article>
	        </div>
	        <div id="listbutton">
	        	<a href="listBoard.do?pageNo=${param.pageNo}&table=board">목록으로</a>
	        </div>
	        <div id="comments">
		        <form action="writeComment.do" method="post">
			        <p class="comments">댓글${dto.commentCnt}개&nbsp&nbsp&nbsp조회수${dto.hit}</p>
			        <c:choose>
			        	<c:when test="${sessionScope.id eq null}">
				        	<div id="write_comment_zone">
				            	<span id="disableCommentText"><a href="login.jsp">로그인</a> 후 작성 가능합니다.</span><input type="submit" value="작성" id="disable" disabled class="writebutton"><input type="submit" value="등록" id="able" class="writebutton">
				        	</div>
			        	</c:when>
			        	<c:otherwise>
			        		<div id="write_comment_zone">
					            <input type="text" name="contents" placeholder="공개 댓글 추가" id="commentText" onkeyup="displayButton()"><input type="submit" value="등록" id="disable" disabled class="writebutton"><input type="submit" value="등록" id="able" class="writebutton">
					        	<input type="hidden" value="${param.no}" name="boardno">
					        	<input type="hidden" value="${param.pageNo}" name="pageNo">
			        		</div>
			        	</c:otherwise>
			        </c:choose>
			    </form>
				<div id="comments_zone">
	        	<c:choose>
		        	<c:when test="${fn:length(list) ne 0}">
				        	<c:forEach var="list" items="${list}" varStatus="status">
				        		<form action="modifyComment.do" method="post">
					        			<c:choose>
					        				<c:when test="${list.indentnum eq 1}">
					        					<div class="main_reply_comment_zone">
						        					<i class="xi-enter xi-x xi-flip-horizontal"></i>
						        					<b>${list.membernickname}</b>
						        					<c:if test="${list.membernickname eq dto.membernickname}">
						        						<span class="writer">작성자</span>
						        					</c:if>
						        					&nbsp;<span class="wtime">${list.wtime}</span>&nbsp;
						        					<c:if test="${sessionScope.id ne null}">
						        						<span class="button">
							        						<button type="button" class="button" id="displayReplyFormButton${status.index}" onclick="displayReplyForm('replyForm${status.index}', 'displayReplyFormButton${status.index}', 'hideReplyFormButton${status.index}')"><i class="xi-enter xi-x xi-flip-horizontal"></i>답글</button>
										        			<button type="button" class="button hideReplyFormButton" id="hideReplyFormButton${status.index}" onclick="hideReplyForm('replyForm${status.index}', 'displayReplyFormButton${status.index}', 'hideReplyFormButton${status.index}')"><i class="xi-enter xi-x xi-flip-horizontal"></i>답글취소</button>
									        			</span>
								        			</c:if>
								        			<c:choose>
								        				<c:when test="${sessionScope.nickname eq list.membernickname}">
								        					<span class="buttonzone">
								        						<input type="button" value="수정" class="button" id="modifyFormButton${status.index}"onclick="openModifyCommentForm('contents${status.index}', 'modify${status.index}', 'delete${status.index}', 'modifyButton${status.index}', 'modifyFormButton${status.index}', 'cancleButton${status.index}')">&nbsp&nbsp|&nbsp
								        						<input type="button" value="삭제" class="button" id="delete${status.index}" onclick="deleteComment(${list.no}, ${param.no}, ${list.groupnum}, ${list.indentnum}, ${param.pageNo})">
								        					</span>
								        					<input type="hidden" value="${list.no}" name="no">
								        					<input type="hidden" value="${param.no}" name="boardno">
								        					<input type="hidden" value="${param.pageNo}" name="pageNo">
								        				</c:when>
								        			</c:choose>
								        			<br><br>
								        			<c:choose>
								        				<c:when test="${list.receiver ne null}">
								        					<span id="contents${status.index}" class="contents"><span class="receiver">${list.receiver}</span>&nbsp&nbsp${list.contents}</span>
								        				</c:when>
								        				<c:otherwise>
								        					<span id="contents${status.index}" class="contents">${list.contents}</span>
								        				</c:otherwise>
								        			</c:choose>
						        					<input type="text" class="modifyForm" id="modify${status.index}" name="contents" value="${list.contents}">
								        			<input type="submit" value="수정" class="modifyButton" id="modifyButton${status.index}">
							        				<input type="button" value="취소" class="modifyButton" id="cancleButton${status.index}" onclick="closeModifyCommentForm('contents${status.index}', 'modify${status.index}', 'delete${status.index}', 'modifyButton${status.index}', 'modifyFormButton${status.index}', 'cancleButton${status.index}', '${list.contents}')">
						        				</div>
					        				</c:when>
					        				<c:otherwise>
					        					<div class="main_comment_zone">
					        					<b>${list.membernickname}</b>
					        					<c:if test="${list.membernickname eq dto.membernickname}">
					        						<span class="writer">작성자</span>
					        					</c:if>
					        					&nbsp;<span class="wtime">${list.wtime}</span>&nbsp;
					        					<c:if test="${sessionScope.id ne null}">
						        					<span class="button">
						        						<button type="button" class="button" id="displayReplyFormButton${status.index}" onclick="displayReplyForm('replyForm${status.index}', 'displayReplyFormButton${status.index}', 'hideReplyFormButton${status.index}')"><i class="xi-enter xi-x xi-flip-horizontal"></i>답글</button>
							        					<button type="button" class="button hideReplyFormButton" id="hideReplyFormButton${status.index}" onclick="hideReplyForm('replyForm${status.index}', 'displayReplyFormButton${status.index}', 'hideReplyFormButton${status.index}')"><i class="xi-enter xi-x xi-flip-horizontal"></i>답글취소</button>
							        				</span>
						        				</c:if>
							        			<c:choose>
							        				<c:when test="${sessionScope.nickname eq list.membernickname}">
							        					<span class="buttonzone">
							        						<input type="button" value="수정" class="button" id="modifyFormButton${status.index}"onclick="openModifyCommentForm('contents${status.index}', 'modify${status.index}', 'delete${status.index}', 'modifyButton${status.index}', 'modifyFormButton${status.index}', 'cancleButton${status.index}')">&nbsp;&nbsp;|&nbsp;
							        						<input type="button" value="삭제" class="button" id="delete${status.index}" onclick="deleteComment(${list.no}, ${param.no}, ${list.groupnum}, ${list.indentnum}, ${param.pageNo})">
							        					</span>
							        					<input type="hidden" value="${list.no}" name="no">
							        					<input type="hidden" value="${param.no}" name="boardno">
							        					<input type="hidden" value="${param.pageNo}" name="pageNo">
							        				</c:when>
							        			</c:choose>
							        			<br><br>
					        					<span id="contents${status.index}">${list.contents}</span>
					        					<input type="text" class="modifyForm" id="modify${status.index}" name="contents" value="${list.contents}">
							        			<input type="submit" value="수정" class="modifyButton" id="modifyButton${status.index}">
						        				<input type="button" value="취소" class="modifyCancleButton" id="cancleButton${status.index}" onclick="closeModifyCommentForm('contents${status.index}', 'modify${status.index}', 'delete${status.index}', 'modifyButton${status.index}', 'modifyFormButton${status.index}', 'cancleButton${status.index}', '${list.contents}')">
					        				</div>
					        				</c:otherwise>
					        			</c:choose>
			        			</form>
			        			<hr>
			        			<c:choose>
			        				<c:when test="${list.indentnum eq 1}">
			        					<form action="replyComment.do" method="post">
					        				<div class="replyForm" id="replyForm${status.index}">
					        					<i class="xi-enter xi-x xi-flip-horizontal"></i>
							        			<input type="text" id="reply${status.index}" class="reply" name="contents" placeholder="${list.membernickname}에게 답글 작성" onkeyup="displayReplyButton('reply${status.index}', 'replydisable${status.index}', 'replyable${status.index}')">
							        			<input id="replydisable${status.index}" class="writebutton" type="submit" value="등록" disabled>
							        			<input type="hidden" value="${list.groupnum}" name="groupnum">
							        			<input type="hidden" value="${list.stepnum}" name="stepnum">
							        			<input type="hidden" value="${param.no}" name="boardno">
							        			<input type="hidden" value="${param.pageNo }" name="pageNo">
							        			<input type="hidden" value="${list.membernickname}" name="receiver">
							        			<input type="submit" value="등록" id="replyable${status.index}" class="writebutton hidereplybutton">
							        			<hr>
						        			</div>
				        				</form>
			        				</c:when>
			        				<c:otherwise>
			        					<form action="replyComment.do" method="post">
			        						<div class="replyForm" id="replyForm${status.index}">
					        					<i class="xi-enter xi-x xi-flip-horizontal"></i>
							        			<input type="text" id="reply${status.index}" class="reply" name="contents" onkeyup="displayReplyButton('reply${status.index}', 'replydisable${status.index}', 'replyable${status.index}')">
							        			<input id="replydisable${status.index}" class="writebutton" type="submit" value="등록" disabled>
							        			<input type="hidden" value="${list.groupnum}" name="groupnum">
							        			<input type="hidden" value="${list.stepnum}" name="stepnum">
							        			<input type="hidden" value="${param.no}" name="boardno">
							        			<input type="hidden" value="${param.pageNo}" name="pageNo">
							        			<input type="submit" value="등록" id="replyable${status.index}" class="writebutton hidereplybutton">
							        			<hr>
						        			</div>
				        				</form>
			        				</c:otherwise>
			        			</c:choose>
				        	</c:forEach>
		        	</c:when>
	        	</c:choose>
	        	</div>
		    </div>
	    </div>
	    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="js/board.js"></script>
    </body>
</html>