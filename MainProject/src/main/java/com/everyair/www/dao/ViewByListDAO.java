package com.everyair.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.ContentDTO;

@Repository
public class ViewByListDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static ViewByListDAO dao;
	
	public static ViewByListDAO getViewByListDAO() {
		if (dao == null)
			dao = new ViewByListDAO();
		return dao;
	}
	
	public ContentDTO selectContent(ContentDTO dto) {
		mybatis.update("ViewByListDAO.increaseHit", dto);
		
		return mybatis.selectOne("ViewByListDAO.selectContent", dto);
	}
}
