package com.everyair.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.ContentDTO;

@Repository
public class ViewByMapDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static ViewByMapDAO dao;
	
	public static ViewByMapDAO getViewByMapDAO() {
		if(dao == null)
			dao = new ViewByMapDAO();
		return dao;
	}
	
	public List<ContentDTO> selectListContent(ContentDTO dto) {
		return mybatis.selectList("ViewByMapDAO.selectListContent", dto);
	}
}
