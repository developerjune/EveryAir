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
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
		<title>EveryAir</title>
	</head>
	<body>
		<div id="popup_wrap">
	        <div class="login_wrap">
	            <div class="popup_login">
	                <h1>LOGIN</h1>
	                <form name="memberLogin" method="post" action="loginOK.do" onsubmit="return checkInfo()">
	                    <input type="text" id="id" name="id" placeholder="ID" />
	                    <input type="password" id="pw" name="pw" placeholder="PW" />
	                    <input class="login_sub" type="submit" value="로그인">
	                </form>
	                <span id="wrongmessage">아이디 혹은 비밀번호가 잘못되었습니다.</span>
	                <ul class="mainul">
	                    <li><a href="register.jsp">지금 회원가입</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <c:choose>
	    	<c:when test="${sessionScope.id eq 'administrator'}">
	    	<div id="topzone">
				<h1><a href="main.jsp">EveryAir</a></h1>
				<ul>
					<li id="mypageicon1"><a href="warning.jsp"><i class="xi-profile-o xi-x"></i></a></li>
					<li id="mypageicon2"><a href="warning.jsp"><i class="xi-profile xi-x"></i></a></li>
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="adminListMember.do?pageNo=1&table=member&denied=Y">관리자 페이지</a></li>
				</ul>
			</div>
	    	</c:when>
	    	<c:when test="${sessionScope.id ne null }">
	    	<div id="topzone">
				<h1><a href="main.jsp">EveryAir</a></h1>
				<ul>
					<li id="mypageicon3"><a href="warning.jsp"><i class="xi-profile-o xi-x"></i></a></li>
					<li id="mypageicon4"><a href="warning.jsp"><i class="xi-profile xi-x"></i></a></li>
					<li><a href="logout.do">로그아웃</a></li>
					<li><span class="red">${nickname}</span>님</li>
				</ul>
			</div>
	    	</c:when>
	    	<c:otherwise>
    		<div id="topzone">
				<h1><a href="main.jsp">EveryAir</a></h1>
				<ul>
					<li><input type="button" class="loginButton" value="로그인" id="login_btn"></li>
				</ul>
			</div>
	    	</c:otherwise>
	    </c:choose>
		<div id="searchForm">
			<form action="viewByList.do" method="get">
				<input type="text" placeholder="찾고싶은 여행 컨텐츠를 검색해보세요." name="keyword"><input type="submit" value="검색">
				<input type="hidden" value="Y" name="open">
            	<input type="hidden" value="1" name="pageNo">
            	<input type="hidden" value="content" name="table">
            	<input type="hidden" value="contain" name="searchType">
            	<input type="hidden" value="nameAndAddress" name="keywordType">
			</form>
		</div>
		<div id="backgroundImage"></div>
		<div id="mainmenu">
			<ul>
				<li><a href="viewbymap.do">컨텐츠 지도<div class="menuimage"><img src="image/koreamap.PNG" alt=""></div></a></li>
				<li><a href="viewByList.do?pageNo=1&table=content&open=Y">컨텐츠 목록<div class="menuimage"><img src="image/viewbylist.png" alt=""></div></a></li>
				<li><a href="listBoard.do?pageNo=1&table=board">후기 게시판<div class="menuimage"><img src="image/board.png" alt=""></div></a></li>
				<li><a href="write_QnABoard.jsp">Q&A<div class="menuimage"><img src="image/qna.png" alt=""></div></a></li>
			</ul>
		</div>
		<%@include file="footer.jsp" %>
		<script>
			var modal = document.getElementById('popup_wrap');
			var btn = document.getElementById("login_btn");
			var wrongMessage = document.getElementById("wrongmessage");
			
			if(${loginStatus eq 'N'}) {
				modal.style.display = "block";
				wrongMessage.style.display = 'inline';
			} else {
				wrongMessage.style.display = 'none';
				modal.style.display = 'none';
			}
				
			if(btn != null)btn.onclick = function() {
	            modal.style.display = "block";
	        }
			window.onclick = function(event){
				if(event.target == modal) {
					modal.style.display = "none";
				}
			}
			
			function checkInfo() {
                if(document.getElementById("id").value == "") {
                    alert("아이디를 입력해주세요.");
                    document.getElementById("id").focus();
                    return false;
                } else if(document.getElementById("pw").value == "") {
                    alert("비밀번호를 입력해주세요.");
                    document.getElementById("pw").focus();
                    return false;
                }
            }
			
			var mypageicon1 = document.getElementById("mypageicon1");
			var mypageicon2 = document.getElementById("mypageicon2");
			var mypageicon3 = document.getElementById("mypageicon3");
			var mypageicon4 = document.getElementById("mypageicon4");
			
			if(mypageicon1 != null && mypageicon2 != null) {
				mypageicon1.addEventListener("mouseover", function() {
					mypageicon1.style.display = "none";
					mypageicon2.style.display = "inline";
				});
				
				mypageicon2.addEventListener("mouseout", function() {
					mypageicon1.style.display = "inline";
					mypageicon2.style.display = "none";
				});
			}
			
			if(mypageicon3 != null && mypageicon4 != null) {
				mypageicon3.addEventListener("mouseover", function() {
					mypageicon3.style.display = "none";
					mypageicon4.style.display = "inline";
				});
				
				mypageicon4.addEventListener("mouseout", function() {
					mypageicon3.style.display = "inline";
					mypageicon4.style.display = "none";
				});
			}
		</script>
	</body>
</html>