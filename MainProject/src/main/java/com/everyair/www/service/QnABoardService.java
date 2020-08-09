package com.everyair.www.service;

import com.everyair.www.dto.QnABoardDTO;

public interface QnABoardService {

	QnABoardDTO selectQnA(QnABoardDTO dto);
	
	boolean insertQuestion(QnABoardDTO dto);
	
	boolean updateQnA(QnABoardDTO dto);
	
	boolean deleteQuestion(QnABoardDTO dto);
}
