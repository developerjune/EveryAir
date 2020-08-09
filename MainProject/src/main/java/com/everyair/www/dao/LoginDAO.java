package com.everyair.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.MemberDTO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static LoginDAO dao;
	
	public static LoginDAO getLoginDAO() {
		if(dao == null) 
			dao = new LoginDAO();
		return dao;
	}
	
	public MemberDTO checkAccount(MemberDTO dto) {
		return mybatis.selectOne("MemberDAO.checkAccount", dto);
	}
	
	public String getNickname(String inputId) {
		return mybatis.selectOne("MemberDAO.getNickname", inputId);
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt, Statement stmt, Connection conn) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
