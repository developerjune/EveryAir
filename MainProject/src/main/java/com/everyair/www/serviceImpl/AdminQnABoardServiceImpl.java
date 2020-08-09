package com.everyair.www.serviceImpl;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.AdminQnABoardDAO;
import com.everyair.www.dto.QnABoardDTO;
import com.everyair.www.service.AdminQnABoardService;

@Service
public class AdminQnABoardServiceImpl implements AdminQnABoardService {
	@Autowired
	private AdminQnABoardDAO dao;

	@Override
	public QnABoardDTO selectQuestion(QnABoardDTO dto) {
		return dao.selectQuestion(dto);
	}

	@Override
	public QnABoardDTO selectAnswer(QnABoardDTO dto) {
		return dao.selectAnswer(dto);
	}
	
	@Override
	public QnABoardDTO selectQuestionByNumber(QnABoardDTO dto) {
		QnABoardDTO qnaboardDTO = dao.selectQuestionByNumber(dto);
		
		qnaboardDTO.setTitle("re: ".concat(qnaboardDTO.getTitle()));
		qnaboardDTO.setContents("re: ".concat(qnaboardDTO.getContents()));
		
		return qnaboardDTO;
	}

	@Override
	public boolean answerQuestion(QnABoardDTO dto) {
		dto.setStepnum(dto.getStepnum() + 1);
		dto.setIndentnum(dto.getIndentnum() + 1);
		
		return dao.answerQuestion(dto);
	}

	@Override
	public boolean updateAnswer(QnABoardDTO dto) {
		return dao.updateAnswer(dto);
	}

	@Override
	public boolean deleteAnswer(QnABoardDTO dto) {
		return dao.deleteAnswer(dto);
	}

	@Override
	public boolean deleteQnA(QnABoardDTO dto) {
		return dao.deleteQnA(dto);
	}

	@Override
	public boolean multiDeleteQnA(String strNum) {
		int length = 0;
		int i = 0;
		
		StringTokenizer st1 = new StringTokenizer(strNum, ",");

		while (st1.hasMoreTokens()) {
			length++;
			st1.nextToken();
		}
		
		int[] numArr = new int[length];

		StringTokenizer st2 = new StringTokenizer(strNum, ",");

		while (st2.hasMoreTokens()) {
			numArr[i] = Integer.parseInt(st2.nextToken());
			i++;
		}
		
		return dao.multiDeleteQnA(numArr);
	}
}
