package com.everyair.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.ConfirmNumDTO;
import com.everyair.www.dto.MemberDTO;

@Repository
public class RegistMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static RegistMemberDAO dao;
	
	public static RegistMemberDAO getResistMemberDAO() {
		if(dao == null) 
			dao = new RegistMemberDAO();
		return dao;
	}
	
	public boolean resistMember(MemberDTO dto) {
		int result = mybatis.insert("MemberDAO.registMember", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public String checkID(MemberDTO dto) {
		return mybatis.selectOne("MemberDAO.selectID", dto);
	}
	
	public String checkNickname(MemberDTO dto) {
		return mybatis.selectOne("MemberDAO.selectNickname", dto);
	}
	
	public String checkPhoneNumber(MemberDTO dto) {
		return mybatis.selectOne("MemberDAO.selectPhoneNumber", dto);
	}
	
	public boolean insertConfirmNum(ConfirmNumDTO dto) {
		int result = mybatis.insert("MemberDAO.insertConfirmnum", dto);
		
		if(result > 0) return true;
		else return false;
	}
	
	public boolean checkConfirmNum(ConfirmNumDTO dto) {
		boolean result = false;
		String registedConfirmNumber = mybatis.selectOne("MemberDAO.checkConfirmnum", dto.getConfirmnumber());
		
		if(registedConfirmNumber != null) result = true;
		else result = false;
		
		int maxConfirmNum = mybatis.selectOne("MemberDAO.getMaxConfirmnum");
		
		if(maxConfirmNum % 100 == 0) mybatis.delete("MemberDAO.deleteAllConfirmnum");
		
		return result;
	}
}
