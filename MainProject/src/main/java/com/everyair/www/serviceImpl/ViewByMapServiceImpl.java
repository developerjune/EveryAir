package com.everyair.www.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.ViewByMapDAO;
import com.everyair.www.dto.ContentDTO;
import com.everyair.www.service.ViewByMapService;

@Service
public class ViewByMapServiceImpl implements ViewByMapService {
	@Autowired
	private ViewByMapDAO dao;

	@Override
	public List<ContentDTO> getListContent(ContentDTO dto) {
		return dao.selectListContent(dto);
	}
}
