package com.everyair.www.service;

import com.everyair.www.dto.MemberDTO;

public interface LoginService {

	MemberDTO checkAccount(MemberDTO dto);
}
