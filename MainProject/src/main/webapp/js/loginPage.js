var referrer = document.referrer;
var lastTokenIndex = referrer.lastIndexOf("/");
var urlValue = referrer.substring(lastTokenIndex + 1, referrer.length);
var enc = encodeURI(urlValue);

function login() {
	var result = checkInfo();
	if (result != false) {
		var id = document.getElementById("id");
		var idValue = id.value;
		var pw = document.getElementById("password");
		var pwValue = pw.value;
		
		var loginform = document.loginform;
		
		loginform.url.value = enc;
		loginform.id.value = idValue;
		loginform.pw.value = pwValue;
		loginform.action="loginOK.do";
		loginform.method = "post";
		loginform.submit();
	}
}

function checkInfo() {
	if (document.getElementById("id").value == "") {
		alert("아이디를 입력해주세요.");
		document.getElementById("id").focus();
		return false;
	}
	if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력해주세요.");
		document.getElementById("password").focus();
		return false;
	}
}

function enterkey() {
    if (window.event.keyCode == 13) {
         login();
    }
}
