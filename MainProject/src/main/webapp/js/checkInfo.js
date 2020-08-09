function checkInfo() {
	var password = document.getElementById("password").value;
	var passwordChk = document.getElementById("passwordcheck").value;
	var disableMessage = document.getElementById("disableMessage");
	
	if (document.getElementById("id").value == "") {
		alert("아이디를 입력해주세요.");
		document.getElementById("id").focus();
		return false;
	} else if (disableIdMessage.style.display == "inline") {
		alert("이미 사용중인 아이디입니다.\n아이디를 다시 확인해주세요.");
		document.getElementById("id").focus();
		return false;
	} else if (wrongIdMessage.style.display == "inline" || lengthIdMessage.style.display == "inline") {
		alert("아이디 이용 정책에 맞지 않습니다.\n아이디를 다시 확인해주세요.");
		document.getElementById("id").focus();
		return false;
	} else if (password == "") {
		alert("비밀번호를 입력해주세요.");
		document.getElementById("password").focus();
		return false;
	} else if (passwordChk == "") {
		alert("비밀번호 확인을 입력해주세요.");
		document.getElementById("passwordcheck").focus();
		return false;
	} else if (password != passwordChk) {
		alert("비밀번호가 서로 다릅니다.");
		document.getElementById("passwordcheck").focus();
		return false;
	} else if (document.getElementById("nickname").value == "") {
		alert("닉네임을 입력해주세요.");
		document.getElementById("nickname").focus();
		return false;
	} else if (disableNicknameMessage.style.display == "inline") {
		alert("이미 사용중인 닉네임입니다.\n닉네임을 재확인해주세요.");
		document.getElementById("nickname").focus();
		return false;
	} else if (wrongNicknameMessage.style.display == "inline" || lengthNicknameMessage.style.display == "inline") {
		alert("닉네임 이용 정책에 맞지 않습니다.\n닉네임을 다시 확인해주세요.");
		document.getElementById("nickname").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해주세요.");
		document.getElementById("email").focus();
		return false;
	} else if (document.getElementById("emailsuffix").value == "") {
		alert("도메인을 선택주세요.");
		document.getElementById("domain").focus();
		return false;
	} else if (document.getElementById("phonenumber").value == "") {
		alert("휴대폰 인증을 진행해주세요.");
		document.getElementById("phoneCheckButton").focus();
		return false;
	} else if(password.length < 8 || password.length > 20) {
		alert("비밀번호는 최소 8자, 최대 20자로 영문+숫자+특수문자를 포함하여 입력해주세요.");
		document.getElementById("password").focus();
		return false;
	}
	
	var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(password);
	
	if(!(check)) {
		alert("비밀번호는 영문+숫자+특수문자를 포함하여 입력해주세요.");
		document.getElementById("password").focus();
		return false;
	}
}

function emailValue(x) {
	document.getElementById("emailsuffix").value = x

	if (document.getElementById("input").selected) {
		document.getElementById("emailsuffix").readOnly = false;
		document.getElementById("emailsuffix").focus();
	} else
		document.getElementById("emailsuffix").readOnly = true;
}

function checkPW() {
	var password = document.getElementById("password").value;
	var passwordChk = document.getElementById("passwordcheck").value;
	
	if(password != passwordChk) {
		document.getElementById("warning").style.display = "block";
	} else {
		document.getElementById("warning").style.display = "none";
	}
	if(password == "" || passwordChk == "")
		document.getElementById("warning").style.display = "none";
}

function openPhoneCheckForm() {
	window.open("send_confirmNum_form.jsp", "sendConfirmNumForm", "width=500, height=400");
}

function checkIDLength() {
	var inputId = document.getElementById("id").value;
	inputId = inputId.trim();

		for(var i=0; i<inputId.length; i++) {
			var code = inputId.charCodeAt(i);
			//아스키코드			특수문자						영문 대문자						영문 소문자
			if(! ( (code >= 48 && code <= 57) || (code >= 65 && code <= 90) || (code >= 97 && code <= 122) ) ) {
				return 'R';
			}
		}
		
		if(inputId.length < 5 || inputId.length > 19) {
			return 'L';
		}
		
		return 'O';
}

function checkNickNameLength() {
	var inputnickname = document.getElementById("nickname").value;
	inputnickname = inputnickname.trim();

	for(var i=0; i<inputnickname.length; i++) {
		var code = inputnickname.charCodeAt(i);
		//아스키코드			특수문자						영문 대문자						영문 소문자								한글
		if(! ( (code >= 48 && code <= 57) || (code >= 65 && code <= 90) || (code >= 97 && code <= 122) || (code >= 44032 && code <= 55203) ) ) {
			return 'R';
		}
	}
	if(inputnickname.length < 5 || inputnickname.length > 19) {
		return 'L';
	}
	
	return 'O';
}

function checkPhoneNumberLength() {
	var phonenumber = document.getElementById("phonenumber").value;
	phonenumber = phonenumber.trim();
	
	if(phonenumber.length > 11) {
		alert("휴대폰 번호는 11자리 이상 입력할 수 없습니다.");
		return false;
	}
}

function checkConfirmNumLength() {
	var confirmnum = document.getElementById("confirmnum").value;
	confirmnum = phonenumber.trim();
	
	if(phonenumber.length > 4 || phonenumber.length < 4) {
		alert("인증번호는 4자리입니다.");
		return false;
	}
}

function checkBoard() {
    if(document.getElementById('title').value == "") {
        alert("제목을 입력해 주세요.")
        document.getElementById('title').focus();
        return false;
    }  else if(document.getElementById('title').value.length > 100) {
		alert("제목은 최대 100자까지 입력 가능합니다.");
		title.focus();
		return false;
	} else if(document.getElementById('contents').value == "") {
        alert("내용을 입력해 주세요.")
        document.getElementById('contents').focus();
        return false;
    }
}

var checkRequest = new XMLHttpRequest();

function checkIdDuplicate() {
	checkRequest.open("get", "./checkID.do?id=" + encodeURIComponent(document.getElementById("id").value), true);
	checkRequest.onreadystatechange = checkIdProcess;
	checkRequest.send();
}

function checkIdProcess() {
	var ableMessage = document.getElementById("ableIdMessage");
	var disableMessage = document.getElementById("disableIdMessage");
	var wrongIdMessage = document.getElementById("wrongIdMessage");
	var lengthIdMessage = document.getElementById("lengthIdMessage");
	var resultId = checkIDLength();
	
	if(checkRequest.readyState == 4 && checkRequest.status == 200) {
		var result = checkRequest.responseText;
		
		if(result == 'Y' && resultId == 'O') {
			ableMessage.style.display = "inline";
			disableMessage.style.display = "none";
			wrongIdMessage.style.display = "none";
			lengthIdMessage.style.display = "none";
		} else if(result == 'N'){
			ableMessage.style.display = "none";
			wrongIdMessage.style.display = "none";
			lengthIdMessage.style.display = "none";
			disableMessage.style.display = "inline";
		} else if(resultId == 'R'){
			ableMessage.style.display = "none";
			disableMessage.style.display = "none";
			lengthIdMessage.style.display = "none";
			wrongIdMessage.style.display = "inline";
		} else if(resultId == 'L'){
			ableMessage.style.display = "none";
			disableMessage.style.display = "none";
			wrongIdMessage.style.display = "none";
			lengthIdMessage.style.display = "inline";
		} 
		
		if(document.getElementById("id").value == "") {
			ableMessage.style.display = "none";
			disableMessage.style.display = "none";
			wrongIdMessage.style.display = "none";
			lengthIdMessage.style.display = "none";
		}
	}
}

function checkNicknameDuplicate() {
	checkRequest.open("get", "./checkNickname.do?nickname=" + encodeURIComponent(document.getElementById("nickname").value), true);
	checkRequest.onreadystatechange = checkNicknameProcess;
	checkRequest.send();
}

function checkNicknameProcess() {
	var ableMessage = document.getElementById("ableNicknameMessage");
	var disableMessage = document.getElementById("disableNicknameMessage");
	var wrongNicknameMessage = document.getElementById("wrongNicknameMessage");
	var lengthNicknameMessage = document.getElementById("lengthNicknameMessage");
	var resultNickname = checkNickNameLength();
	
	if(checkRequest.readyState == 4 && checkRequest.status == 200) {
		var result = checkRequest.responseText;
		
		if(result == 'Y' && resultNickname == 'O') {
			ableMessage.style.display = "inline";
			disableMessage.style.display = "none";
			wrongNicknameMessage.style.display = "none";
			lengthNicknameMessage.style.display = "none";
		} else if(result == 'N'){
			ableMessage.style.display = "none";
			wrongNicknameMessage.style.display = "none";
			lengthNicknameMessage.style.display = "none";
			disableMessage.style.display = "inline";
		} else if(resultNickname == 'R'){
			ableMessage.style.display = "none";
			disableMessage.style.display = "none";
			lengthNicknameMessage.style.display = "none";
			wrongNicknameMessage.style.display = "inline";
		} else if(resultNickname == 'L'){
			ableMessage.style.display = "none";
			disableMessage.style.display = "none";
			wrongNicknameMessage.style.display = "none";
			lengthNicknameMessage.style.display = "inline";
		} 
		
		if(document.getElementById("nickname").value == "") {
			ableMessage.style.display = "none";
			disableMessage.style.display = "none";
			wrongNicknameMessage.style.display = "none";
			lengthNicknameMessage.style.display = "none";
		}
	}
}
