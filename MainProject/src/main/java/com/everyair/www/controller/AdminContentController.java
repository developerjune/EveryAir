package com.everyair.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.ImageDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.service.AdminContentService;
import com.everyair.www.service.PagingService;

@Controller
public class AdminContentController {
	@Autowired
	private AdminContentService service;
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/adminListContent.do")
	public String getContentList(PagingDTO dto, Model model) {
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				model.addAttribute("url", "adminListContent.do?pageNo=1&table=content&open=" + pagingDTO.getOpen());
				return "result.jsp";
			}
		}
		
		List<ContentDTO> list = new ArrayList<ContentDTO>();
		list = pagingService.pageizedListContent(pagingDTO);
		model.addAttribute("list", list);
		model.addAttribute("pagingDTO", pagingDTO);
		
		if(dto.getOpen().equals("Y")) return "admin_list_content.jsp";
		return "admin_list_private_content.jsp";
	}
	 
	
	@RequestMapping("/adminSelectContent.do")
	public String getContent(ContentDTO dto, Model model) {
		ContentDTO contentDTO = service.selectContent(dto);
		List<ImageDTO> imageList = service.selectListImage(dto);
		
		model.addAttribute("dto", contentDTO);
		model.addAttribute("list", imageList);
		
		return "admin_modify_content.jsp";
	}
	
	@RequestMapping("/adminRegistContent.do")
	public String registContent(@RequestParam(value="files", required=false, defaultValue = "") MultipartFile[] files, ContentDTO dto, Model model) {
		boolean result = service.insertContent(files, dto);
		
		if(result) {
			model.addAttribute("message", "등록이 완료되었습니다.");
			model.addAttribute("url", "adminListContent.do?pageNo=1&table=content&open=" + dto.getOpen());
		} else {
			model.addAttribute("message", "등록 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		return "result.jsp";
	}
	
	@RequestMapping("/adminModifyImage.do")
	public String modifyImage(@RequestParam(value="thumbnail", required=false, defaultValue = "") MultipartFile thumbnail,
			@RequestParam(value="files", required=false, defaultValue = "") MultipartFile[] files,
			@RequestParam(value="no", required=false, defaultValue = "") int contentNum, Model model) {
		ContentDTO dto = new ContentDTO();
		dto.setNo(contentNum);
		boolean result = service.updateImage(thumbnail, files, dto);
		
		if(result) {
			model.addAttribute("message", "이미지 수정이 완료되었습니다.");
			model.addAttribute("url", "adminSelectContent.do");
			model.addAttribute("no", contentNum);
		} else {
			model.addAttribute("message", "이미지 수정중 오류가 발생하였습니다.");
			model.addAttribute("url", "adminSelectContent.do");
			model.addAttribute("no", contentNum);
		}
		return "result.jsp";
	}
	
	@RequestMapping("/adminModifyContent.do")
	public String modifyContent(ContentDTO dto, Model model) {
		boolean result = service.updateContent(dto);
		
		if(result) {
			model.addAttribute("message", "내용 수정이 완료되었습니다.");
			model.addAttribute("url", "adminSelectContent.do");
			model.addAttribute("no", dto.getNo());
		} else {
			model.addAttribute("message", "내용 수정 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminRemoveContent.do")
	public String removeContent(ContentDTO dto, Model model) {
		boolean result = service.deleteContent(dto);
		
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListContent.do?pageNo=1&table=content&open=" + dto.getOpen());
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminMultiRemoveContent.do")
	public String multiRemoveContent(@RequestParam(value="strNum", required=false) String strNum,
			ContentDTO dto, Model model) {
		boolean result = service.multiDeleteContent(strNum);
				
		if(result) {
			model.addAttribute("message", "삭제가 완료되었습니다.");
			model.addAttribute("url", "adminListContent.do?pageNo=1&table=content&open=" + dto.getOpen());
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
	
	@RequestMapping("/adminRemoveImage.do")
	public String deleteImage(ImageDTO dto, Model model) {
		boolean result = service.deleteImage(dto);
		
		if(result) {
			model.addAttribute("message", "삭제 되었습니다.");
			model.addAttribute("url", "adminSelectContent.do");
			model.addAttribute("no", dto.getContentno());
		} else {
			model.addAttribute("message", "삭제 중 오류가 발생하였습니다.");
			model.addAttribute("url", "wrong");
		}
		
		return "result.jsp";
	}
}
