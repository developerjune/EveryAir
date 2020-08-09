package com.everyair.www.service;

import java.util.List;

import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.ImageDTO;

public interface ViewByListService {

	ContentDTO selectContent(ContentDTO dto);
	
	List<ImageDTO> selectListImage(ContentDTO dto);
}
