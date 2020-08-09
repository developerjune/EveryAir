package com.everyair.www.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.RegionDAO;
import com.everyair.www.dto.RegionDTO;
import com.everyair.www.service.RegionService;

@Service
public class RegionServiceImpl implements RegionService {
	@Autowired
	private RegionDAO dao;

	@Override
	public List<RegionDTO> listSido() {
		return dao.listSido();
	}

	@Override
	public List<RegionDTO> listSigungu() {
		return dao.listSigungu();
	}

}
