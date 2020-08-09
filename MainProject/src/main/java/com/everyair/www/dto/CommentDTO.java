package com.everyair.www.dto;

public class CommentDTO {
	private int no;
	private String contents;
	private int groupnum;
	private int stepnum;
	private int indentnum;
	private String wtime;
	private int boardno;
	private String membernickname;
	private String receiver;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getGroupnum() {
		return groupnum;
	}
	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}
	public int getStepnum() {
		return stepnum;
	}
	public void setStepnum(int stepnum) {
		this.stepnum = stepnum;
	}
	public int getIndentnum() {
		return indentnum;
	}
	public void setIndentnum(int indentnum) {
		this.indentnum = indentnum;
	}
	public String getWtime() {
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getMembernickname() {
		return membernickname;
	}
	public void setMembernickname(String membernickname) {
		this.membernickname = membernickname;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
}
