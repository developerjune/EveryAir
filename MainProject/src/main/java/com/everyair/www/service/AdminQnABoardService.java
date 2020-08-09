package com.everyair.www.service;

import com.everyair.www.dto.QnABoardDTO;

public interface AdminQnABoardService {
	
	QnABoardDTO selectQuestion(QnABoardDTO dto);
	
	QnABoardDTO selectAnswer(QnABoardDTO dto);
	
	QnABoardDTO selectQuestionByNumber(QnABoardDTO dto);
	
	boolean answerQuestion(QnABoardDTO dto);
	
	boolean updateAnswer(QnABoardDTO dto);
	
	boolean deleteAnswer(QnABoardDTO dto);
	
	boolean deleteQnA(QnABoardDTO dto);
	
	boolean multiDeleteQnA(String strNum);
}
