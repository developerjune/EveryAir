package com.everyair.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.BoardDTO;
import com.everyair.www.dto.ContentDTO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.dto.PagingDTO;
import com.everyair.www.dto.QnABoardDTO;

@Repository
public class PagingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static PagingDAO dao;
	
	public static PagingDAO getPagingDAO() {
		if(dao == null)
			dao = new PagingDAO();
		return dao;
	}
	
	public List<MemberDTO> pageizedListMember(PagingDTO dto) {
		return mybatis.selectList("PagingDAO.pagedListMember", dto);
	}
	
	public List<ContentDTO> pageizedListContent(PagingDTO dto) {
		return mybatis.selectList("PagingDAO.pagedListContent", dto);
	}
	
	public List<BoardDTO> adminPageizedListBoard(PagingDTO dto) {
		return mybatis.selectList("PagingDAO.adminPagedListBoard", dto);
	}
	
	public List<BoardDTO> pageizedListBoard(PagingDTO dto) {
		return mybatis.selectList("PagingDAO.pagedListBoard", dto);
	}
	
	public List<QnABoardDTO> adminPageizedListQnABoard(PagingDTO dto) {
		return mybatis.selectList("PagingDAO.adminPagedListQnABoard", dto);
	}
	
	public List<QnABoardDTO> pageizedListQnABoard(PagingDTO dto) {
		return mybatis.selectList("PagingDAO.pagedListQnABoard", dto);
	}
	
	public int getMemberCount(PagingDTO dto) {
		return mybatis.selectOne("PagingDAO.getMemberCount", dto);
	}
	
	public int getContentCount(PagingDTO dto) {
		return mybatis.selectOne("PagingDAO.getContentCount", dto);
	}
	
	public int getBoardCount(PagingDTO dto) {
		String startdate = dto.getStartdate();
		String enddate = dto.getEnddate();
		if(startdate != null && !(startdate.equals(""))) dto.setStartdate(startdate.concat(" 00:00:00"));
		if(enddate != null && !(enddate.equals(""))) dto.setEnddate(enddate.concat(" 23:59:59"));
		return mybatis.selectOne("PagingDAO.getBoardCount", dto);
	}
	
	public int getQnABoardCount(PagingDTO dto) {
		String startdate = dto.getStartdate();
		String enddate = dto.getEnddate();
		if(startdate != null && !(startdate.equals(""))) dto.setStartdate(startdate.concat(" 00:00:00"));
		if(enddate != null && !(enddate.equals(""))) dto.setEnddate(enddate.concat(" 23:59:59"));
		return mybatis.selectOne("PagingDAO.getQnABoardCount", dto);
	}
	
	public int getAdminQnABoardCount(PagingDTO dto) {
		String startdate = dto.getStartdate();
		String enddate = dto.getEnddate();
		if(startdate != null && !(startdate.equals(""))) dto.setStartdate(startdate.concat(" 00:00:00"));
		if(enddate != null && !(enddate.equals(""))) dto.setEnddate(enddate.concat(" 23:59:59"));
		return mybatis.selectOne("PagingDAO.getAdminQnABoardCount", dto);
	}
}
