package com.everyair.www.serviceImpl;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.AdminMemberDAO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.service.AdminMemberService;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO dao;

	@Override
	public MemberDTO selectMember(MemberDTO dto) {
		return dao.selectMember(dto);
	}

	@Override
	public boolean updateMember(MemberDTO dto) {
		return dao.updateMember(dto);
	}

	@Override
	public boolean deleteMember(MemberDTO dto) {
		return dao.deleteMember(dto);
	}

	@Override
	public boolean multiDeleteMember(String strNum) {
		int length = 0;
		int idx = 0;
		
		StringTokenizer st1 = new StringTokenizer(strNum, ",");

		while (st1.hasMoreTokens()) {
			length++;
			st1.nextToken();
		}
		int[] numArr = new int[length];

		StringTokenizer st2 = new StringTokenizer(strNum, ",");

		while (st2.hasMoreTokens()) {
			numArr[idx] = Integer.parseInt(st2.nextToken());
			idx++;
		}
		return dao.multiDeleteMember(numArr);
	}
}
