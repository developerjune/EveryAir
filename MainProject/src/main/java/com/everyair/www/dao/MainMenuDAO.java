package com.everyair.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.everyair.www.dto.ContentDTO;

public class MainMenuDAO {
	private static MainMenuDAO dao;
	private DataSource datasource;
	private final int LIMIT = 10;
	private final String SELECT_CONTENT = "SELECT * FROM CONTENT WHERE no=";
	private final String INCREASE_HIT = "UPDATE CONTENT SET hit=hit+1 WHERE no=";
	private final String GET_SEARCH_BY_KEYWORD_COUNT = "SELECT COUNT(*) FROM CONTENT WHERE name LIKE ";
	private final String SEARCH_LIST_BY_CATEGORY = "SELECT * FROM CONTENT WHERE open='Y' AND category=";
	
	private MainMenuDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/everyair");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static MainMenuDAO getMainMenuDAO() {
		if(dao == null)
			dao = new MainMenuDAO();
		return dao;
	}
	
	public ArrayList<ContentDTO> getSearchContentList(String address, String category, int offset) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ContentDTO> list = null;
		String query = "";
		
		if( (address.equals("all")) && (category.equals("all")) ) query = "SELECT * FROM CONTENT WHERE open='Y' ORDER BY NO DESC LIMIT " + LIMIT + " OFFSET " + offset;
		else if( (address.equals("all")) && !(category.equals("all")) ) query = "SELECT * FROM CONTENT WHERE open='Y' AND category='" + category + "' ORDER BY NO DESC LIMIT " + LIMIT + " OFFSET " + offset;
		else if( !(address.equals("all")) && (category.equals("all")) ) query = "SELECT * FROM CONTENT WHERE open='Y' AND address LIKE '%" + address + "%' ORDER BY category ASC LIMIT " + LIMIT + " OFFSET " + offset;
		else if( !(address.equals("all")) && !(category.equals("all")) ) query = "SELECT * FROM CONTENT WHERE open='Y' AND address LIKE '%" + address + "%' AND category='" + category + "' ORDER BY name ASC LIMIT " + LIMIT + " OFFSET " + offset;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.createStatement();
			list = new ArrayList<ContentDTO>();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				ContentDTO dto = new ContentDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setCoordinate(rs.getString("coordinate"));
				dto.setCategory(rs.getString("category"));
				dto.setRegistdate(rs.getString("registdate"));
				dto.setHit(rs.getInt("hit"));
				dto.setOpen(rs.getString("open"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPhone(rs.getString("phone"));
				dto.setUrl(rs.getString("url"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, null, stmt, conn);
		}
		return list;
	}
	
	public ArrayList<ContentDTO> getContentSearchByKeword(String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ContentDTO> list = null;
		String query = "SELECT * FROM CONTENT WHERE name LIKE '%" + keyword + "%'";
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			list = new ArrayList<ContentDTO>();
			
			while(rs.next()) {
				ContentDTO dto = new ContentDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setCoordinate(rs.getString("coordinate"));
				dto.setCategory(rs.getString("category"));
				dto.setRegistdate(rs.getString("registdate"));
				dto.setHit(rs.getInt("hit"));
				dto.setOpen(rs.getString("open"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPhone(rs.getString("phone"));
				dto.setUrl(rs.getString("url"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, null, conn);
		}
		return list;
	}
	
	public ContentDTO selectContent(int no) {
		increaseHit(no);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ContentDTO dto = null;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_CONTENT+no);
			dto = new ContentDTO();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setCoordinate(rs.getString("coordinate"));
				dto.setCategory(rs.getString("category"));
				dto.setDescription(rs.getString("description"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegistdate(rs.getString("registdate"));
				dto.setOpen(rs.getString("open"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPhone(rs.getString("phone"));
				dto.setUrl(rs.getString("url"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, null, stmt, conn);
		}
		return dto;
	}
	
	public ArrayList<ContentDTO> searchByCategoryList(String category) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ContentDTO> list = null;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SEARCH_LIST_BY_CATEGORY+"'"+category+"'");
			list = new ArrayList<ContentDTO>();
			
			while(rs.next()) {
				ContentDTO dto = new ContentDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setCoordinate(rs.getString("coordinate"));
				dto.setCategory(rs.getString("category"));
				dto.setRegistdate(rs.getString("registdate"));
				dto.setHit(rs.getInt("hit"));
				dto.setOpen(rs.getString("open"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPhone(rs.getString("phone"));
				dto.setUrl(rs.getString("url"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, null, stmt, conn);
		}
		return list;
	}
	
	public void increaseHit(int no) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(INCREASE_HIT+no);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, null, stmt, conn);
		}
	}
	
	public int getSearchContentCount(String address, String category) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int totalCnt = 0;
		String query = "";
		
		if( (address.equals("all")) && (category.equals("all")) ) query = "SELECT COUNT(*) FROM CONTENT";
		else if( (address.equals("all")) && !(category.equals("all")) ) query = "SELECT COUNT(*) FROM CONTENT WHERE category='" + category + "'";
		else if( !(address.equals("all")) && (category.equals("all")) ) query = "SELECT COUNT(*) FROM CONTENT WHERE address LIKE '%" + address + "%'";
		else if( !(address.equals("all")) && !(category.equals("all")) ) query = "SELECT COUNT(*) FROM CONTENT WHERE address LIKE '%" + address + "%' AND category='" + category + "'";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) totalCnt = rs.getInt("COUNT(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, null, stmt, conn);
		}
		return totalCnt;
	}
	
	public int getSearchContentByKeywordCount(String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCnt = 0;
		
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(GET_SEARCH_BY_KEYWORD_COUNT + "'%" + keyword + "%'");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, null, conn);
		}
		return totalCnt;
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt, Statement stmt, Connection conn) {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
