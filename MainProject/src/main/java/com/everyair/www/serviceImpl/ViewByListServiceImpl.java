package com.everyair.www.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.ImageDAO;
import com.everyair.www.dao.ViewByListDAO;
import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.ImageDTO;
import com.everyair.www.service.ViewByListService;

@Service
public class ViewByListServiceImpl implements ViewByListService {
	@Autowired
	private ViewByListDAO dao;
	@Autowired
	private ImageDAO imageDAO;
	
	@Override
	public ContentDTO selectContent(ContentDTO dto) {
		return dao.selectContent(dto);
	}
	
	public List<ImageDTO> selectListImage(ContentDTO dto) {
		ImageDTO imageDTO = new ImageDTO();
		imageDTO.setContentno(dto.getNo());
		
		return imageDAO.listImage(imageDTO);
	}
}
