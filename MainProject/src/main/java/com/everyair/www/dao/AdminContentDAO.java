package com.everyair.www.dao;

import java.util.Arrays;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.ContentDTO;

@Repository
public class AdminContentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static AdminContentDAO dao;
	
	public static AdminContentDAO getAdminContentDAO() {
		if (dao == null)
			dao = new AdminContentDAO();
		return dao;
	}
	
	public boolean insertContent(ContentDTO dto) {
		int result = 0;
		result = mybatis.insert("AdminContentDAO.insertContent", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public ContentDTO selectContent(ContentDTO dto) {
		return mybatis.selectOne("AdminContentDAO.selectContent", dto);
	}
	
	public boolean updateContent(ContentDTO dto) {
		int result = 0;
		result = mybatis.update("AdminContentDAO.updateContent", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean updateThumbnail(ContentDTO dto) {
		int result = 0;
		result = mybatis.update("AdminContentDAO.updateThumbnail", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteContent(ContentDTO dto) {
		int result = 0;
		result = mybatis.delete("AdminContentDAO.deleteContent", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean multiDeleteContent(int[] numArr) {
		int result = 0;
		int idx = 0;
		
		while(idx < numArr.length) {
			mybatis.delete("ImageDAO.deleteAllImage", numArr[idx]);
			idx++;
		}

		String arrStr = Arrays.toString(numArr);
		String numberGroup = "(" + arrStr.substring(1, arrStr.length() - 1) + ")";
		
		result = mybatis.delete("AdminContentDAO.multiDeleteContent", numberGroup);

		if (result > 0) return true;
		else return false;
	}
	
	public String getThumbnail(ContentDTO dto) {
		return mybatis.selectOne("AdminContentDAO.selectThumbnail", dto);
	}
}
