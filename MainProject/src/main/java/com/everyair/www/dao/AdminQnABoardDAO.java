package com.everyair.www.dao;

import java.util.Arrays;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.QnABoardDTO;

@Repository
public class AdminQnABoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static AdminQnABoardDAO dao;
	
	public static AdminQnABoardDAO getAdminQnABoardDAO() {
		if(dao == null)
			dao = new AdminQnABoardDAO();
		return dao;
	}
	
	public QnABoardDTO selectQuestion(QnABoardDTO dto) {
		return mybatis.selectOne("AdminQnABoardDAO.selectQuestion", dto);
	}
	
	public QnABoardDTO selectAnswer(QnABoardDTO dto) {
		return mybatis.selectOne("AdminQnABoardDAO.selectAnswer", dto);
	}
	
	public QnABoardDTO selectQuestionByNumber(QnABoardDTO dto) {
		return mybatis.selectOne("AdminQnABoardDAO.selectQuestionByNumber", dto);
	}
	
	public boolean answerQuestion(QnABoardDTO dto) {
		int result = mybatis.insert("AdminQnABoardDAO.answerQuestion", dto);
		
		if(result > 0) {
			mybatis.update("AdminQnABoardDAO.updateAnswerStatusOfQuestion", dto);
			return true;
		} else return false;
	}
	
	public boolean updateAnswer(QnABoardDTO dto) {
		int result = mybatis.update("AdminQnABoardDAO.updateAnswer", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteAnswer(QnABoardDTO dto) {
		int result = mybatis.delete("AdminQnABoardDAO.deleteAnswer", dto);
		
		if(result > 0) {
			mybatis.update("AdminQnABoardDAO.updateAnswerStatusOfQuestion", dto);
			return true;
		} else return false;
	}
	
	public boolean deleteQnA(QnABoardDTO dto) {
		int result = mybatis.delete("AdminQnABoardDAO.deleteQnA", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean multiDeleteQnA(int[] numArr) {
		int result = 0;
		
		String arrStr = Arrays.toString(numArr);
		String numberGroup = "(" + arrStr.substring(1, arrStr.length() - 1) + ")";
		
		result = mybatis.delete("AdminQnABoardDAO.multiDeleteQnA", numberGroup);
		
		if(result > 0) return true;
		else return false;
	}
}
