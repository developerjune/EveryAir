package com.everyair.www.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.LoginDAO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO dao;

	@Override
	public MemberDTO checkAccount(MemberDTO dto) {
		return dao.checkAccount(dto);
	}
}
