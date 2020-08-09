<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="css/register.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <a class="title" href="main.jsp">EveryAir</a>
            <h2>간편 회원가입</h2>
        </header>
        <div id="main_form">
            <form action="registMemberOK.do" method="post" onsubmit="return checkInfo()">
                <table>
                    <tr>
                        <th>ID</th>
                       	<td><input type="text" id="id" name="id" placeholder="ID를 입력해주세요." onkeyup="checkIdDuplicate()"/></td><td id="idMessageZone"><span id="ableIdMessage" style="display: none;">사용 가능한 ID입니다.</span><span id="disableIdMessage" style="display: none;">이미 등록된 ID입니다.</span><span id="wrongIdMessage" style="display: none;">한글과 특수문자를 쓸 수 없습니다.</span><span id="lengthIdMessage" style="display: none;">5자 이상, 20자 이하로 입력해주세요.</span></td>
                    </tr>
                    <tr>
                        <th>PW</th>
                        <td><input type="password" id="password" name="pw" placeholder="비밀번호를 입력하세요" onkeyup="checkPW()"/></td>
                    </tr>
                    <tr>
                        <th>PW CHECK</th>
                        <td><input type="password" id="passwordcheck" placeholder="비밀번호를 다시 입력하세요" onkeyup="checkPW()"/></td><td id="warning">비밀번호가 서로 다릅니다.</td>
                    </tr>
                    <tr>
                        <th>NICKNAME</th>
                        <td><input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요." onkeyup="checkNicknameDuplicate()"/></td><td><span id="ableNicknameMessage" style="display: none;">사용 가능한 닉네임입니다.</span><span id="disableNicknameMessage" style="display: none;">이미 등록된 닉네임입니다.</span><span id="wrongNicknameMessage" style="display: none;">특수문자를 쓸 수 없습니다.</span><span id="lengthNicknameMessage" style="display: none;">5자 이상, 20자 이하로 입력해주세요.</span></td>
                    </tr>
                    <tr>
                        <th>E-MAIL</th>
                        <td><input type="text" id="email" name="emailID" placeholder="이메일을 입력하세요"/></td>
                        <td>
                            <input type="text" id="emailsuffix" name="domain" readonly/>
                        </td>
                        <td>
                            <select id="domain" onchange="emailValue(this.value)">
                                <option value="">도메인 선택</option>
                                <option id="input" value="">직접 입력</option>
                                <option value="@naver.com">@naver.com</option>
                                <option value="@gmail.com">@gmail.com</option>
                                <option value="@daum.net">@daum.net</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대폰 번호</th>
                        <td><input type="text" id="phonenumber" name="phonenumber" placeholder="인증 버튼을 눌러주세요." readonly/></td>
                        <td><input type="button" value="휴대폰 번호인증" onclick="openPhoneCheckForm()" id="phoneCheckButton"></td>
                    </tr>
                    <tr>
                    	<td><input type="hidden" value="Y" name="denied"></td>
                        <td><input type="submit" id="submitbutton" value="회원가입" /></td>
                    </tr>
                </table>
            </form>
        </div>
        <footer>
            <div id="main_footer">
                <p>상호:준컴퍼니</p>
                <p>대표이사: 안준 | 사업자 등록번호: 123-45-78900</p>
                <p><a href="privacy_policy.jsp">개인정보처리방침</a><a href="terms_and_conditions.jsp">이용약관</a></p>
            </div>
        </footer>
        <script src="js/checkInfo.js"></script>
    </body>
</html>