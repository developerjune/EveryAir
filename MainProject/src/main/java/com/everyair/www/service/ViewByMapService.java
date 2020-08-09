package com.everyair.www.service;

import java.util.List;

import com.everyair.www.dto.ContentDTO;

public interface ViewByMapService {
	
	List<ContentDTO> getListContent(ContentDTO dto);
}
