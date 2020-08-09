package com.everyair.www.serviceImpl;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.AdminBoardDAO;
import com.everyair.www.dto.BoardDTO;
import com.everyair.www.service.AdminBoardService;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	@Autowired
	private AdminBoardDAO dao;

	@Override
	public BoardDTO selectBoard(BoardDTO dto) {
		return dao.selectBoard(dto);
	}
	
	@Override
	public boolean insertNotice(BoardDTO dto) {
		return dao.insertNotice(dto);
	}

	@Override
	public boolean updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public boolean deleteBoard(BoardDTO dto) {
		return dao.deleteBoard(dto);
	}

	@Override
	public boolean multiDeleteBoard(String strNum) {
		int length = 0;
		int i = 0;
		
		StringTokenizer st1 = new StringTokenizer(strNum, ",");

		while (st1.hasMoreTokens()) {
			length++;
			st1.nextToken();
		}
		
		int[] numArr = new int[length];

		StringTokenizer st2 = new StringTokenizer(strNum, ",");

		while (st2.hasMoreTokens()) {
			numArr[i] = Integer.parseInt(st2.nextToken());
			i++;
		}
		
		return dao.multiDeleteBoard(numArr);
	}
}
