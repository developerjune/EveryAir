<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="description" content="대한민국 여행지 추천">
        <meta name="keywords" content="국내여행, 여행지, 추천">
        <meta name="author" content="June">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/header.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <title>EveryAir</title>
    </head>
	<body>
		<c:choose>
			<c:when test="${(param.loginStatus eq null) || (param.loginStatus eq 'Y')}">
				<div id="popup_wrap">
			        <div class="login_wrap">
			            <div class="popup_login">
			                <h1>LOGIN</h1>
			                <form name="memberLogin" method="post" action="loginOK.do" onsubmit="return checkInfo()">
			                    <input type="text" id="id" name="id" placeholder="ID" />
			                    <input type="password" id="pw" name="pw" placeholder="PW" />
			                    <input class="login_sub" type="submit" value="로그인">
			                </form>
			                <ul class="mainul">
			                    <li><a href="register.jsp">지금 회원가입</a></li>
			                </ul>
			            </div>
			        </div>
			    </div>
		    </c:when>
		    <c:when test="${param.loginStatus eq 'N'}">
			    <div id="fail_popup_wrap">
			        <div class="login_wrap">
			            <div class="popup_login">
			                <h1>LOGIN</h1>
			                <form name="memberLogin" method="post" action="loginOK.do" onsubmit="return checkInfo()">
			                    <input type="text" id="id" name="id" placeholder="ID" />
			                    <input type="password" id="pw" name="pw" placeholder="PW" />
			                    <input class="login_sub" type="submit" value="로그인">
			                </form>
			                <span class="wrongmessage">아이디 혹은 비밀번호가 잘못되었습니다.</span>
			                <ul class="failul">
			                    <li><a href="register.jsp">지금 회원가입</a></li>
			                </ul>
			            </div>
			        </div>
			    </div>
		    </c:when>
	    </c:choose>
		<header id="main_header">
            <div id="logo">
                <a href="main.jsp">EveryAir</a>
            </div>
            <nav id="main_gnb">
                <ul>
                    <li><a href="viewbymap.do">지도로 보기</a></li>
                    <li><a href="viewByList.do?pageNo=1&table=content&open=Y">목록으로 보기</a></li>
                    <li><a href="listBoard.do?pageNo=1&table=board">게시판</a></li>
                    <li><a href="write_QnABoard.jsp">문의하기</a></li>
                </ul>
            </nav>
			<c:choose>
			<c:when test="${sessionScope.id eq null}">
            <nav id="login_button">
                <ul>
                    <li><input type="button" value="로그인" id="login_btn"></li>
                </ul>
            </nav>
            </c:when>
            <c:when test="${sessionScope.id eq 'administrator'}">
            <nav id="logout_button">
                <ul>
                    <li><a href="adminListMember.do?pageNo=1&table=member&denied=Y">관리자 페이지</a></li>
                    <li><a href="logout.do">로그아웃</a></li>
                    <li id="mypageicon1"><a href=""><i class="xi-profile-o xi-x"></i></a></li>
					<li id="mypageicon2"><a href=""><i class="xi-profile xi-x"></i></a></li>
                </ul>
            </nav>
            </c:when>
            <c:otherwise>
            	<nav id="logout_button">
                	<ul>
                		<li>${sessionScope.nickname}님 환영합니다.</li>
	                    <li><a href="logout.do">로그아웃</a></li>
	                    <li id="mypageicon1"><a href=""><i class="xi-profile-o xi-x"></i></a></li>
						<li id="mypageicon2"><a href=""><i class="xi-profile xi-x"></i></a></li>
	                </ul>
            	</nav>
            </c:otherwise>
            </c:choose>
        </header>
        <script>
        	if(${(param.loginStatus eq null) || (param.loginStatus eq 'Y')})
				var modal = document.getElementById('popup_wrap');
        	else
        		var modal = document.getElementById('fail_popup_wrap');
			var btn = document.getElementById("login_btn");
			if(btn != null)btn.onclick = function() {
	            modal.style.display = "block";
	        }
			window.onclick = function(event){
				if(event.target == modal) {
					location.href="main.jsp";
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
		</script>
	</body>
</html>