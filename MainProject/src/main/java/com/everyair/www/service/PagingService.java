package com.everyair.www.service;

import java.util.List;

import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.dto.QnABoardDTO;

public interface PagingService {

	List<MemberDTO> pageizedListMember(PagingDTO dto);
	
	List<ContentDTO> pageizedListContent(PagingDTO dto);
	
	List<BoardDTO> adminPageizedListBoard(PagingDTO dto);
	
	List<BoardDTO> pageizedListBoard(PagingDTO dto);
	
	List<QnABoardDTO> adminPageizedListQnABoard(PagingDTO dto);
	
	List<QnABoardDTO> pageizedListQnABoard(PagingDTO dto);
	
	PagingDTO getPagingDTO(PagingDTO dto);
}
