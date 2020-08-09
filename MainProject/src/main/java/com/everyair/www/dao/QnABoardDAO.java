package com.everyair.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.QnABoardDTO;

@Repository
public class QnABoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static QnABoardDAO dao;
	
	public static QnABoardDAO getQnABoardDAO() {
		if(dao == null)
			dao = new QnABoardDAO();
		return dao;
	}
	
	public QnABoardDTO selectQnABoard(QnABoardDTO dto) {
		if(dto.getStatus().equals("view")) mybatis.update("QnABoardDAO.increaseHit", dto);
		
		return mybatis.selectOne("QnABoardDAO.selectQnABoard", dto);
	}
	
	public boolean insertQuestion(QnABoardDTO dto) {
		int result = mybatis.insert("QnABoardDAO.insertQuestion", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean updateQnA(QnABoardDTO dto) {
		int result = mybatis.update("QnABoardDAO.updateQnA", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteQnA(QnABoardDTO dto) {
		int result = mybatis.delete("QnABoardDAO.deleteQnA", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public int getMaxNum() {
		int maxNum = mybatis.selectOne("QnABoardDAO.selectMaxNum");
		maxNum++;
		return maxNum;
	}
}
