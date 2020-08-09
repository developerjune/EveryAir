package com.everyair.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.ImageDTO;

@Repository
public class ImageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static ImageDAO dao;
	
	public static ImageDAO getImageDAO() {
		if(dao == null)
			dao = new ImageDAO();
		return dao;
	}
	
	public List<ImageDTO> listImage(ImageDTO dto) {
		return mybatis.selectList("ImageDAO.selectImageList", dto);
	}
	
	public void initialRegistImage(String fileName) {
		int contentno = mybatis.selectOne("ImageDAO.selectContentNum");
		ImageDTO dto = new ImageDTO();
		dto.setContentno(contentno);
		dto.setName(fileName);
		mybatis.insert("ImageDAO.registImage", dto);
	}
	
	public boolean registImage(ImageDTO dto) {
		int result = 0;
		result = mybatis.insert("ImageDAO.registImage", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean deleteImage(ImageDTO dto) {
		int result = 0;
		result = mybatis.delete("ImageDAO.deleteImage", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public void deleteAllImage(int contentno) {
		mybatis.delete("ImageDAO.deleteAllImage", contentno);
	}
}
