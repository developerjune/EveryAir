package com.everyair.www.service;

import com.everyair.www.dto.MemberDTO;

public interface AdminMemberService {

	MemberDTO selectMember(MemberDTO dto);
	
	boolean updateMember(MemberDTO dto);
	
	boolean deleteMember(MemberDTO dto);
	
	boolean multiDeleteMember(String strNum);
}
