package com.everyair.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.everyair.www.dto.ContentDTO;
import com.everyair.www.service.ViewByMapService;

@Controller
public class ViewByMapController {
	@Autowired
	private ViewByMapService service;
	
	@RequestMapping("/viewbymap.do")
	public String viewByMap(ContentDTO dto, Model model) {
		List<ContentDTO> list = service.getListContent(dto);
		
		model.addAttribute("list", list);
		
		return "view_by_map.jsp";
	}
}
