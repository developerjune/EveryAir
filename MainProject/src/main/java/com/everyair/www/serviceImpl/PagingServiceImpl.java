package com.everyair.www.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.PagingDAO;
import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.dto.QnABoardDTO;
import com.everyair.www.service.PagingService;

@Service
public class PagingServiceImpl implements PagingService {
	@Autowired
	private PagingDAO dao;
	
	@Override
	public List<MemberDTO> pageizedListMember(PagingDTO dto) {
		return dao.pageizedListMember(dto);
	}

	@Override
	public List<ContentDTO> pageizedListContent(PagingDTO dto) {
		return dao.pageizedListContent(dto);
	}
	
	@Override
	public List<BoardDTO> adminPageizedListBoard(PagingDTO dto) {
		return dao.adminPageizedListBoard(dto);
	}

	@Override
	public List<BoardDTO> pageizedListBoard(PagingDTO dto) {
		return dao.pageizedListBoard(dto);
	}
	
	@Override
	public List<QnABoardDTO> adminPageizedListQnABoard(PagingDTO dto) {
		return dao.adminPageizedListQnABoard(dto);
	}

	@Override
	public List<QnABoardDTO> pageizedListQnABoard(PagingDTO dto) {
		return dao.pageizedListQnABoard(dto);
	}
	
	public PagingDTO getPagingDTO(PagingDTO dto) {
		int pageNo = dto.getPageNo();
		final int LIMIT = 10;
		int totalCnt = 0;
		int totalPageCnt = 0;
		int startViewPageCnt = 0;
		int endViewPageCnt = 0;
		int offset = 0;
		
		if(dto.getTable().equals("member")) totalCnt = dao.getMemberCount(dto);
		else if(dto.getTable().equals("content")) totalCnt = dao.getContentCount(dto);
		else if(dto.getTable().equals("board")) totalCnt = dao.getBoardCount(dto);
		else if(dto.getTable().equals("adminqnaboard")) totalCnt = dao.getAdminQnABoardCount(dto);
		else if(dto.getTable().equals("qnaboard")) totalCnt = dao.getQnABoardCount(dto);
		
		if(totalCnt == 0) totalPageCnt = 0;
		else totalPageCnt = totalCnt % LIMIT > 0 ? (totalCnt / LIMIT + 1) : (totalCnt / LIMIT);
		
		if(pageNo <= 0) pageNo = 1;
		else if(pageNo > totalPageCnt)
			if(totalPageCnt != 0) pageNo = totalPageCnt;
		
		offset = pageNo * LIMIT - LIMIT;
		
		if(pageNo % LIMIT == 0) endViewPageCnt = pageNo / LIMIT * LIMIT;
		else endViewPageCnt = (pageNo / LIMIT + 1) * LIMIT;
		
		if(endViewPageCnt >= totalPageCnt) endViewPageCnt = totalPageCnt;
		
		startViewPageCnt = endViewPageCnt - 9;
		
		if(startViewPageCnt <= 0) startViewPageCnt = 1;
		
		dto.setTotalCnt(totalCnt);
		dto.setTotalPageCnt(totalPageCnt);
		dto.setOffset(offset);
		dto.setStartViewPageCnt(startViewPageCnt);
		dto.setEndViewPageCnt(endViewPageCnt);
		
		return dto;
	}
}
