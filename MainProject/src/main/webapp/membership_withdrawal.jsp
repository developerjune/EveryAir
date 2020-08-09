<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/membership_withdrawal.css" type="text/css" />
    </head>
    <body>
        <script>
            function checkForm() {
                var chk = document.withdrawalCheck.agreement.checked;
                if(!chk) {
                    alert("안내사항에 동의해주세요.");
                    return false;
                }
                
                var password = document.getElementById("password");
                if(password.value == "") {
                    alert("비밀번호를 입력해주세요.");
                    return false;
                }
                alert("탈퇴처리가 완료되었습니다.");
                window.parent.location.href="before_login_main.jsp";
            }
        </script>
        <form name="withdrawalCheck" onSubmit="return checkForm()">
            <div id="main_section">
                <h3>회원 탈퇴</h3>
                <p>*탈퇴 후 회원정보 및 개인형 서비스 이용기록은 즉시 삭제됩니다.</p>
                <p>*탈퇴 후 재가입 시 기존 데이터는 복구할 수 없습니다.</p>
                <p>안내사항을 모두 확인하였으며, 이에 동의합니다.<input type="checkbox" id="agreement"></p>
                <p>비밀번호<input type="password" id="password"><input type="submit" value="확인"></p>
            </div>
        </form>
    </body>
</html>