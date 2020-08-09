package com.everyair.www.serviceImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.everyair.www.dao.AdminContentDAO;
import com.everyair.www.dao.ImageDAO;
import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.ImageDTO;
import com.everyair.www.service.AdminContentService;

@Service
public class AdminContentServiceImpl implements AdminContentService {
	@Autowired
	private AdminContentDAO dao;
	@Autowired
	private ImageDAO imageDAO;
	private final String uploadPath = "C:\\JavaStudy\\Spring\\MainProject\\src\\main\\webapp\\image\\contents";

	@Override
	public ContentDTO selectContent(ContentDTO dto) {
		return dao.selectContent(dto);
	}
	
	public List<ImageDTO> selectListImage(ContentDTO dto) {
		ImageDTO imageDTO = new ImageDTO();
		imageDTO.setContentno(dto.getNo());
		
		return imageDAO.listImage(imageDTO);
	}

	@Override
	public boolean insertContent(MultipartFile[] files, ContentDTO dto) {
		boolean result = false;
		String status = "thumbnail";
		String thumbnailFileName = "";
		
		
		if(files != null) {
			for(int j = 0; j < files.length; j++) {
				if(j == 0) {
					if(status.equals("thumbnail")) {
						if(files[j].getSize() != 0) {
							UUID uuid = UUID.randomUUID();
							String uploadFileName = uuid.toString() + "_" + files[j].getOriginalFilename();
							thumbnailFileName = uploadFileName;
							dto.setThumbnail(uploadFileName);
							result = dao.insertContent(dto);
							File saveFile = new File(uploadPath, uploadFileName);
							
							try {
								files[j].transferTo(saveFile);
							} catch(Exception e) {
								e.printStackTrace();
							}
						}
						status = "files";
						j--;
					} else if(status.equals("files")) {
						if(files[j].getSize() != 0) {
							File thumbnailFile = new File(uploadPath, thumbnailFileName);
							UUID uuid = UUID.randomUUID();
							String uploadFileName = uuid.toString() + "_" + files[j].getOriginalFilename();
							File uploadFile = new File(uploadPath, uploadFileName);
						    
							try {
								InputStream inStream = new FileInputStream(thumbnailFile);
								OutputStream outStream = new FileOutputStream(uploadFile);
							    
							    byte[] buffer = new byte[1024];
							    
						        int length;
						 
						        while ((length = inStream.read(buffer)) > 0){
						        	outStream.write(buffer, 0, length);
						        }
						        
						        inStream.close();
						        outStream.close();
							} catch (IOException e) {
								e.printStackTrace();
							}
							imageDAO.initialRegistImage(uploadFileName);
						}
					}
				} else {
					if(files[j].getSize() != 0) {
						UUID uuid = UUID.randomUUID();
						String uploadFileName = uuid.toString() + "_" + files[j].getOriginalFilename();
						File saveFile = new File(uploadPath, uploadFileName);
						
						imageDAO.initialRegistImage(uploadFileName);
						
						try {
							files[j].transferTo(saveFile);
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		} else {
			dto.setThumbnail("");
			result = dao.insertContent(dto);
		}
		
		return result;
	}
	
	@Override
	public boolean updateImage(MultipartFile thumbnail, MultipartFile[] files, ContentDTO dto) {
		boolean result = false;
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.getSize() != 0) {
				UUID uuid = UUID.randomUUID();
				String uploadFileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();
				File saveFile = new File(uploadPath, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);
				} catch(Exception e) {
					e.printStackTrace();
				}
				ImageDTO imageDTO = new ImageDTO();
				imageDTO.setContentno(dto.getNo());
				imageDTO.setName(uploadFileName);
				result = imageDAO.registImage(imageDTO);
			}
		}
		
		if(thumbnail.getSize() != 0) {
			File prevThumbnailFile = new File(uploadPath + "\\" + dao.getThumbnail(dto));
			prevThumbnailFile.delete();
			UUID uuid = UUID.randomUUID();
			String newThumbnail = uuid.toString() + "_" + thumbnail.getOriginalFilename();
			dto.setThumbnail(newThumbnail);
			
			if(thumbnail.getSize() != 0) {
				File file = new File(uploadPath + "\\" + newThumbnail);
				
				try {
					thumbnail.transferTo(file);
				} catch(Exception e) {
					e.printStackTrace();
				}
				result = dao.updateThumbnail(dto);
			}
		}
		
		return result;
	}
	
	@Override
	public boolean updateContent(ContentDTO dto) {
		return dao.updateContent(dto);
	}
	
	@Override
	public boolean deleteContent(ContentDTO dto) {
		ImageDTO imageDTO = new ImageDTO();
		int i = 0;
		
		imageDTO.setContentno(dto.getNo());
		
		List<ImageDTO> list = imageDAO.listImage(imageDTO);
		String thumbnail = dao.getThumbnail(dto);
		
		File file = new File(uploadPath + "\\" + thumbnail);
		file.delete();
		
		while(i < list.size()) {
			String fileName = list.get(i).getName();
			File deleteFile = new File(uploadPath + "\\" + fileName);
			deleteFile.delete();
			i++;
		}
		
		return dao.deleteContent(dto);
	}

	@Override
	public boolean multiDeleteContent(String strNum) {
		int length = 0;
		int idx = 0;
		int i = 0;
		
		StringTokenizer st1 = new StringTokenizer(strNum, ",");

		while (st1.hasMoreTokens()) {
			length++;
			st1.nextToken();
		}
		int[] numArr = new int[length];

		StringTokenizer st2 = new StringTokenizer(strNum, ",");

		while (st2.hasMoreTokens()) {
			numArr[idx] = Integer.parseInt(st2.nextToken());
			idx++;
		}
		
		idx = 0;
		while(idx < numArr.length) {
			ContentDTO dto = new ContentDTO();
			dto.setNo(numArr[idx]);
			File thumbnailFile = new File(uploadPath + "\\" + dao.getThumbnail(dto));
			thumbnailFile.delete();
			
			ImageDTO imageDTO = new ImageDTO();
			imageDTO.setContentno(numArr[idx]);
			List<ImageDTO> list = imageDAO.listImage(imageDTO);
			
			i = 0;
			while(i < list.size()) {
				String fileName = list.get(i).getName();
				File deleteFile = new File(uploadPath + "\\" + fileName);
				deleteFile.delete();
				i++;
			}
			idx++;
		}
		
		return dao.multiDeleteContent(numArr);
	}

	@Override
	public boolean deleteImage(ImageDTO dto) {
		boolean result = false;
		
		File deleteFile = new File(uploadPath + "\\" + dto.getName());
		deleteFile.delete();
		
		result = imageDAO.deleteImage(dto);
		
		return result;
	}
}
