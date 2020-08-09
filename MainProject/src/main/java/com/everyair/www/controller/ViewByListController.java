package com.everyair.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.ImageDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.dto.RegionDTO;
import com.everyair.www.service.PagingService;
import com.everyair.www.service.RegionService;
import com.everyair.www.service.ViewByListService;

@Controller
public class ViewByListController {
	@Autowired
	private PagingService pagingService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private ViewByListService service;
	
	@RequestMapping("/viewByList.do")
	public String getContentList(@RequestParam(value="sido", required=false, defaultValue="") String sido,
			@RequestParam(value="sigungu", required=false, defaultValue="") String sigungu,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			PagingDTO dto, Model model) {
		if(!sido.equals("")) dto.setKeyword(sido.concat(sigungu));
		else dto.setKeyword(keyword);
		if(dto.getCategory() == null) dto.setCategory("");
		PagingDTO pagingDTO = pagingService.getPagingDTO(dto);
		
		if(dto.getKeyword() != null) {
			if(pagingDTO.getTotalCnt() == 0) {
				model.addAttribute("message", "검색 결과가 없습니다.");
				if(dto.getKeywordType().equals("nameAndAddress"))
					model.addAttribute("url", "main.jsp");
				else
					model.addAttribute("url", "viewByList.do?pageNo=1&table=content&open=Y");
				return "result.jsp";
			}
		}
		
		List<ContentDTO> list = pagingService.pageizedListContent(pagingDTO);
		List<RegionDTO> listSido = regionService.listSido();
		List<RegionDTO> listSigungu = regionService.listSigungu();
		
		model.addAttribute("list", list);
		model.addAttribute("listSido", listSido);
		model.addAttribute("listSigungu", listSigungu);
		model.addAttribute("pagingDTO", pagingDTO);
		
		return "view_by_list.jsp";
	}
	
	@RequestMapping("/selectContent.do")
	public String selectContent(ContentDTO dto, Model model) {
		ContentDTO contentDTO = service.selectContent(dto);
		List<ImageDTO> imageList = service.selectListImage(dto);
		
		model.addAttribute("dto", contentDTO);
		model.addAttribute("list", imageList);
		
		return "content_detail.jsp";
	}
}
