function checkBlank() {
	var title = document.getElementById("answertitle");
	var contents = document.getElementById("answercontents");
	
	if(title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	} else if(contents.value == "") {
		alert("내용을 입력해주세요.");
		contents.focus();
		return false;
	}
}

function alreadyAnswer() {
	alert("답변 등록이 완료된 게시글입니다.");
}

function confirmDeleteAnswer(no, pageNo, groupNum) {
	if(confirm("답변을 삭제하시겠습니까?") == true)
		location.href="adminRemoveAnswer.do?no="+no+"&pageNo="+pageNo+"&groupnum="+groupNum+"&answer=N";
	else
		return false;
}