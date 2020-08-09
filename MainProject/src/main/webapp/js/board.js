function checkValue() {
	if(document.getElementById("keyword") == "") {
		alert("검색어를 입력해주세요.");
		return false;
	}
}

function displayButton() {
	var x = document.getElementById("commentText");

	if(x.value == "") {
		document.getElementById("disable").style.display = "inline";
		document.getElementById("able").style.display = "none";
	} else {
		document.getElementById("disable").style.display = "none";
		document.getElementById("able").style.display = "inline";
	}
}

function displayReplyButton(replyForm, disable, able) {
	var x = document.getElementById(replyForm);
	var y = document.getElementById(disable);
	var z = document.getElementById(able);

	if(x.value == "") {
		document.getElementById(disable).style.display = "inline";
		document.getElementById(able).style.display = "none";
	} else {
		document.getElementById(disable).style.display = "none";
		document.getElementById(able).style.display = "inline";
	}
}

function displayReplyForm(replyForm, displayReplyFormButton, hideReplyFormButton) {
	var replyForm = document.getElementById(replyForm);
	var displayReplyFormButton = document.getElementById(displayReplyFormButton);
	var hideReplyFormButton = document.getElementById(hideReplyFormButton);
	
	replyForm.style.display = "inline";
	displayReplyFormButton.style.display = "none";
	hideReplyFormButton.style.display = "inline";
}

function hideReplyForm(replyForm, displayReplyFormButton, hideReplyFormButton) {
	var replyForm = document.getElementById(replyForm);
	var displayReplyFormButton = document.getElementById(displayReplyFormButton);
	var hideReplyFormButton = document.getElementById(hideReplyFormButton);
	
	replyForm.style.display = "none";
	displayReplyFormButton.style.display = "inline";
	hideReplyFormButton.style.display = "none";
}

function getParameterByNameforList(name, mode, table) {
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
    
    if(table == 'board') location.href = 'listBoard.do?pageNo=' + no + '&table=board';
    else if(table == 'qnaboard') location.href = 'listQnABoard.do?pageNo=' + no + '&table=qnaboard';
}

function getParameterByNameforSearchList(name, mode, term, keywordType, keyword, startdate, enddate, table) {
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
    
    if(table == 'board') location.href = 'listBoard.do?pageNo=' + no + '&term=' + term + '&keywordType=' + keywordType + '&keyword=' + keyword + '&startdate=' + startdate + '&enddate=' + enddate + '&table=board';
    else if(table == 'qnaboard') location.href = 'listQnABoard.do?pageNo=' + no + '&term=' + term + '&keywordType=' + keywordType + '&keyword=' + keyword + '&startdate=' + startdate + '&enddate=' + enddate + '&table=qnaboard';
}

function openModifyCommentForm(contents, modify, deleteButton, modifyButton, modifyFormButton, closeModifyFormButton) {
	var commentContents = document.getElementById(contents);
	var modifycomment = document.getElementById(modify);
	var deleteButton = document.getElementById(deleteButton);
	var modifyButton = document.getElementById(modifyButton);
	var modifyFormButton = document.getElementById(modifyFormButton);
	var closeModifyFormButton = document.getElementById(closeModifyFormButton);
	
	commentContents.style.display = "none";
	deleteButton.style.display = "none";
	modifyFormButton.style.display = "none";
	modifycomment.style.display = "inline";
	modifyButton.style.display = "inline";
	closeModifyFormButton.style.display = "inline";
}

function closeModifyCommentForm(contents, modify, deleteButton, modifyButton, modifyFormButton, closeModifyFormButton, textValue) {
	var commentContents = document.getElementById(contents);
	var modifycomment = document.getElementById(modify);
	var deleteButton = document.getElementById(deleteButton);
	var modifyButton = document.getElementById(modifyButton);
	var modifyFormButton = document.getElementById(modifyFormButton);
	var closeModifyFormButton = document.getElementById(closeModifyFormButton);
	
	commentContents.style.display = "inline";
	deleteButton.style.display = "inline";
	modifyFormButton.style.display = "inline";
	modifycomment.style.display = "none";
	modifyButton.style.display = "none";
	closeModifyFormButton.style.display = "none";
	modifycomment.value = textValue;
	
}

function deleteComment(no, boardNo, groupnum, indentnum, pageNo) {
	if(confirm("댓글을 삭제하시겠습니까?") == true)
		location.href="removeComment.do?no="+no+"&boardno="+boardNo+"&indentnum="+indentnum+"&groupnum="+groupnum+"&pageNo="+pageNo;
	else
		return false;
}

function deleteBoard(no, comment) {
	if(comment > 0) {
		if(confirm("게시글 삭제시 작성된 댓글과 함께 삭제됩니다.\n게시글을 삭제 하시겠습니까?") == true)
			location.href="removeBoard.do?no="+no;
		else
			return false;
	} else {
		if(confirm("게시글을 삭제 하시겠습니까?") == true)
			location.href="removeBoard.do?no="+no;
		else
			return false;
	}
}

function deleteQnABoard(groupnum) {
	if(confirm("질문글 삭제시 작성된 답변과 함께 삭제됩니다.\n질문글을 삭제 하시겠습니까?") == true)
		location.href="removeQnA.do?groupnum="+groupnum;
	else
		return false;
}

function sessionNull() {
	alert("로그인이 필요한 기능입니다. 로그인 페이지로 이동합니다.");
	location.href="login.jsp";
}

function checkValue() {
	var keyword = document.getElementById("keyword");
	
	if(keyword.value == "") {
		alert("검색어를 입력해주세요.")
		return false;
	}
}

function displayDateForm() {
	var dateForm = document.getElementById("dateform");
	var termValue = document.getElementById("term").value;
	var mainsearch = document.getElementById("mainsearch");
	
	if(termValue == 'selectDate') {
		mainsearch.style.width = "810px";
		dateForm.style.display = "inline";
	} else {
		mainsearch.style.width = "500px";
		dateForm.style.display = "none";
	}
}

function resetBoard() {
	location.href="listBoard.do?pageNo=1&table=board";
}

function resetQnABoard() {
	location.href="listQnABoard.do?pageNo=1&table=qnaboard";
}

var startdate = document.getElementById("startdate");
var enddate = document.getElementById("enddate");

startdate.addEventListener("change", function() {
	document.getElementById("selectDate").selected = true;
});
