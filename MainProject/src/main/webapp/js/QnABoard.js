function autoCheck(category, open) {
	var yspan = document.getElementById("yspan");
	var nspan = document.getElementById("nspan");
	var ycheck = document.getElementById("ycheck");
	var ncheck = document.getElementById("ncheck");
	
	if(category == '컨텐츠 추가 요청') document.getElementById("addContents").selected = true;
	else if(category == '홈페이지 오류') document.getElementById('errorPage').selected = true;
	else if(category == '기타') document.getElementById('etc').selected = true;
	else document.getElementById('blank').selected = true;
	
	if(open == 'Y') {
		document.getElementById('Y').checked = true;
		document.getElementById("nspan").style.display = "inline";
		document.getElementById("ncheck").style.display = "none";
		document.getElementById("yspan").style.display = "none";
		document.getElementById("ycheck").style.display = "inline";
	}
	else {
		document.getElementById('N').checked = true;
		document.getElementById("yspan").style.display = "inline";
		document.getElementById("ycheck").style.display = "none";
		document.getElementById("nspan").style.display = "none";
		document.getElementById("ncheck").style.display = "inline";
	}
}

function checkBlank() {
	var category = document.getElementById("category");
	var title = document.getElementById("title");
	var contents = document.getElementById("contents");
	
	if(category.value == "") {
		alert("질문 분류를 선택해주세요.");
		return false;
	} else if(title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	} else if(title.value.length > 100) {
		alert("제목은 최대 100자까지 입력 가능합니다.");
		title.focus();
		return false;
	} else if(contents.value == "") {
		alert("내용을 입력해주세요.");
		contents.focus();
		return false;
	}
}

var Ybutton = document.getElementById("Y");
var Nbutton = document.getElementById("N");

Ybutton.onchange = function() {
	var yspan = document.getElementById("yspan");
	var nspan = document.getElementById("nspan");
	var ycheck = document.getElementById("ycheck");
	var ncheck = document.getElementById("ncheck");
	
	if (Ybutton.checked) {
		document.getElementById("nspan").style.display = "inline";
		document.getElementById("ncheck").style.display = "none";
		document.getElementById("yspan").style.display = "none";
		document.getElementById("ycheck").style.display = "inline";
	} else if(Nbutton.checked) {
		document.getElementById("yspan").style.display = "inline";
		document.getElementById("ycheck").style.display = "none";
		document.getElementById("nspan").style.display = "none";
		document.getElementById("ncheck").style.display = "inline";
	}
};

Nbutton.onchange = function() {
	var yspan = document.getElementById("yspan");
	var nspan = document.getElementById("nspan");
	var ycheck = document.getElementById("ycheck");
	var ncheck = document.getElementById("ncheck");
	
	if (Ybutton.checked) {
		document.getElementById("nspan").style.display = "inline";
		document.getElementById("ncheck").style.display = "none";
		document.getElementById("yspan").style.display = "none";
		document.getElementById("ycheck").style.display = "inline";
	} else if(Nbutton.checked) {
		document.getElementById("yspan").style.display = "inline";
		document.getElementById("ycheck").style.display = "none";
		document.getElementById("nspan").style.display = "none";
		document.getElementById("ncheck").style.display = "inline";
	}
};

function inputForm(id) {
	var selectedOption = $("#category option:selected").val();
	var desc = document.getElementById("desc");
	
	if(selectedOption == "컨텐츠 추가 요청") {
		document.getElementById("contents").value = "";
		document.getElementById("contents").value = "컨텐츠명(ex: 서울 하얏트 호텔) : "  + "\n\n" + "요청사항 : ";
		desc.style.display = "none";
	} else if(selectedOption == "홈페이지 오류") {
		document.getElementById("contents").value = "";
		document.getElementById("contents").value = "접속 시도 페이지(ex: 지도로 보기) : "  + "\n\n" + "증상 : ";
		desc.style.display = "none";
	} else if(selectedOption == "기타") {
		document.getElementById("contents").value = "";
		document.getElementById("contents").value = "주제 : "  + "\n\n" + "내용 : ";
		desc.style.display = "none";
	} else {
		document.getElementById("contents").value = "";
		desc.style.display = "inline";
	}
}
