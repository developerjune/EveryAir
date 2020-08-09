var startdate = document.getElementById("startdate");
var enddate = document.getElementById("enddate");

startdate.addEventListener("change", function() {
	var buttons = document.getElementsByName("term");
	
	for(var i = 0; i < buttons.length; i++) {
		buttons[i].checked = false;
	}
	document.getElementById("selectDate").checked = true;
});

function getParameterByNameforList(name, mode) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    if(results == null) mode = "first";
    result = results == null ? '1' : decodeURIComponent(results[1].replace(/\+/g, " "));
    
    var no = parseInt(result);
    if(mode == 'next') {
    	if(no % 10 == 0) no = no + 1;
    	else if(no % 10 != 0) no = (Math.floor(no / 10) + 1) * 10 + 1;
    } else if(mode == 'prev') {
    	if(no % 10 == 0) no = result - 10;
    	else if(no % 10 != 0) no = Math.floor(no / 10) * 10;
    }
    
    location.href = 'adminListBoard.do?pageNo=' + no + '&table=board';
}

function getParameterByNameforSearchList(name, mode, term, keywordType, keyword, startdate, enddate) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    if(results == null) mode = "first";
    result = results == null ? '1' : decodeURIComponent(results[1].replace(/\+/g, " "));
    
    var no = parseInt(result);
    if(mode == 'next') {
    	if(no % 10 == 0) no = no + 1;
    	else if(no % 10 != 0) no = (Math.floor(no / 10) + 1) * 10 + 1;
    } else if(mode == 'prev') {
    	if(no % 10 == 0) no = result - 10;
    	else if(no % 10 != 0) no = Math.floor(no / 10) * 10;
    }
    
    location.href = 'adminListBoard.do?pageNo=' + no + '&term=' + term + '&keywordType=' + keywordType + '&keyword=' + keyword + '&startdate=' + startdate + '&enddate=' + enddate + '&table=board';;
}

function sessionNull() {
	alert("로그인이 필요한 기능입니다. 로그인 페이지로 이동합니다.");
	location.href="login.jsp";
}

function checkValue() {
	var keyword = document.getElementById("keyword");
	var startdate = document.getElementById("startdate");
	var enddate = document.getElementById("enddate");
	
	if(startdate.value != "" || enddate.value != "") {
		if(startdate.value == "") {
			alert("시작 일자를 선택해주세요.");
			startdate.focus();
			return false;
		} else if(enddate.value == "") {
			alert("끝 일자를 선택해주세요.");
			enddate.focus();
			return false;
		}
	}
	
	if(keyword.value == "") {
		alert("검색어를 입력해주세요.");
		keyword.focus();
		return false;
	}
}

function resetPage() {
	location.href="adminListBoard.do?pageNo=1&table=board";
}

function checkAll() {
	var mainChk = document.getElementById("mainCheck");
	var chk = document.getElementsByName("noArr");
	for (i = 0; i < chk.length; i++) {
		if (mainChk.checked == true) {
			chk[i].checked = true;
		} else {
			chk[i].checked = false;
		}
	}
}

function checkBlank() {
	var title = document.getElementById("title");
	var contents = document.getElementById("contents");
	
	if(title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	} else if(contents.value == "") {
		alert("내용을 입력해주세요.");
		title.focus();
		return false;
	}
}

$('.btn').click(function(event) {
    event.preventDefault();

    $(this).modal({
      fadeDuration: 250
    });
});

$(window).on('load', function() {
	$("#loading").hide();
});

