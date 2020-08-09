$(window).on('load', function() {
	$("#loading").hide();
});

var startdate = document.getElementById("startdate");
var enddate = document.getElementById("enddate");

startdate.addEventListener("change", function() {
	var buttons = document.getElementsByName("term");
	
	for(var i = 0; i < buttons.length; i++) {
		buttons[i].checked = false;
	}
	document.getElementById("selectDate").checked = true;
});

function resetPage() {
	location.href="adminListQnABoard.do?pageNo=1&table=adminqnaboard";
}

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
    
    location.href = 'adminListQnABoard.do?pageNo=' + no + '&table=adminqnaboard';
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
    
    location.href = 'adminListQnABoard.do?pageNo=' + no + '&term=' + term + '&keywordType=' + keywordType + '&keyword=' + keyword + '&startdate=' + startdate + '&enddate=' + enddate + '&table=adminqnaboard';
}