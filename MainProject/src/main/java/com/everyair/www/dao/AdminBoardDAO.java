package com.everyair.www.dao;

import java.util.Arrays;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.BoardDTO;

@Repository
public class AdminBoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static AdminBoardDAO dao;
	
	public static AdminBoardDAO getAdminBoardDAO() {
		if(dao == null)
			dao = new AdminBoardDAO();
		return dao;
	}
	
	public BoardDTO selectBoard(BoardDTO dto) {
		return mybatis.selectOne("AdminBoardDAO.selectBoard", dto);
	}
	
	public boolean insertNotice(BoardDTO dto) {
		int result = mybatis.insert("AdminBoardDAO.insertNotice", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean updateBoard(BoardDTO dto) {
		int result = mybatis.update("AdminBoardDAO.updateBoard", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteBoard(BoardDTO dto) {
		int result = mybatis.delete("AdminBoardDAO.deleteBoard", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean multiDeleteBoard(int[] numArr) {
		int result = 0;
		
		String arrStr = Arrays.toString(numArr);
		String numberGroup = "(" + arrStr.substring(1, arrStr.length() - 1) + ")";
		
		result = mybatis.delete("AdminBoardDAO.multiDeleteBoard", numberGroup);
		
		if(result > 0) return true;
		else return false;
	}
}
