package com.everyair.www.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.ImageDTO;

public interface AdminContentService {
	
	ContentDTO selectContent(ContentDTO dto);
	
	List<ImageDTO> selectListImage(ContentDTO dto);
	
	boolean insertContent(MultipartFile[] files, ContentDTO dto);
	
	boolean updateContent(ContentDTO dto);
	
	boolean updateImage(MultipartFile thumbnail, MultipartFile[] files,  ContentDTO dto);
	
	boolean deleteContent(ContentDTO dto);
	
	boolean multiDeleteContent(String strNum);
	
	boolean deleteImage(ImageDTO dto);
}
