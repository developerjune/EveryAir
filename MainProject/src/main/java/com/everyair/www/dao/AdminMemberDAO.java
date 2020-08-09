package com.everyair.www.dao;

import java.util.Arrays;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.everyair.www.dto.MemberDTO;

@Repository
public class AdminMemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static AdminMemberDAO dao;

	public static AdminMemberDAO getAdminMemberDAO() {
		if (dao == null)
			dao = new AdminMemberDAO();
		return dao;
	}

	public MemberDTO selectMember(MemberDTO dto) {
		return mybatis.selectOne("AdminMemberDAO.selectMember", dto);
	}

	public boolean updateMember(MemberDTO dto) {
		int result = mybatis.update("AdminMemberDAO.updateMember", dto);
		
		if(result > 0) return true;
		else return false;
	}

	public boolean deleteMember(MemberDTO dto) {
		int result = mybatis.delete("AdminMemberDAO.deleteMember", dto);

		if (result > 0) return true;
		else return false;
	}

	public boolean multiDeleteMember(int[] numArr) {
		int result = 0;
		int idx = 0;
		
		while(idx < numArr.length) {
			mybatis.delete("ImageDAO.deleteAllImage", numArr[idx]);
			idx++;
		}

		String arrStr = Arrays.toString(numArr);
		String numberGroup = "(" + arrStr.substring(1, arrStr.length() - 1) + ")";
		
		result = mybatis.delete("AdminMemberDAO.multiDeleteMember", numberGroup);

		if (result > 0) return true;
		else return false;
	}
}
