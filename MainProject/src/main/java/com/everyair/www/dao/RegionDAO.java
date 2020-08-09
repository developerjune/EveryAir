package com.everyair.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.RegionDTO;

@Repository
public class RegionDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static RegionDAO dao;
	
	public static RegionDAO getRegionDAO() {
		if(dao == null)
			dao = new RegionDAO();
		return dao;
	}
	
	public List<RegionDTO> listSido() {
		return mybatis.selectList("RegionDAO.selectListSido");
	}
	
	public List<RegionDTO> listSigungu() {
		return mybatis.selectList("RegionDAO.selectListSigungu");
	}
}
