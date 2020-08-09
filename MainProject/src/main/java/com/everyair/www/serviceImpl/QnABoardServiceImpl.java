package com.everyair.www.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.QnABoardDAO;
import com.everyair.www.dto.QnABoardDTO;
import com.everyair.www.service.QnABoardService;

@Service
public class QnABoardServiceImpl implements QnABoardService {
	@Autowired
	private QnABoardDAO dao;
	
	@Override
	public QnABoardDTO selectQnA(QnABoardDTO dto) {
		return dao.selectQnABoard(dto);
	}

	@Override
	public boolean insertQuestion(QnABoardDTO dto) {
		dto.setGroupnum(dao.getMaxNum());

		return dao.insertQuestion(dto);
	}

	@Override
	public boolean updateQnA(QnABoardDTO dto) {
		return dao.updateQnA(dto);
	}

	@Override
	public boolean deleteQuestion(QnABoardDTO dto) {
		return dao.deleteQnA(dto);
	}
}
