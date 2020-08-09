package com.everyair.www.service;

import java.util.Map;

import com.everyair.www.dto.ConfirmNumDTO;
import com.everyair.www.dto.MemberDTO;

public interface RegistMemberService {
	
	boolean checkIDDuplicate(MemberDTO dto);
	
	boolean checkNicknameDuplicate(MemberDTO dto);
	
	boolean checkPhoneNumberDuplicate(MemberDTO dto);

	void sendConfirmNum(MemberDTO dto);
	
	Map<String, String> checkConfirmNumber(MemberDTO memberDTO, ConfirmNumDTO confirmNumDTO);
	
	String getConfirmNumber();
	
	boolean registMember(MemberDTO dto);
}
