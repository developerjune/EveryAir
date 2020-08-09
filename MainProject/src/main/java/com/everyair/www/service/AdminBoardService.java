package com.everyair.www.service;

import com.everyair.www.dto.BoardDTO;

public interface AdminBoardService {

	BoardDTO selectBoard(BoardDTO dto);
	
	boolean insertNotice(BoardDTO dto);

	boolean updateBoard(BoardDTO dto);

	boolean deleteBoard(BoardDTO dto);

	boolean multiDeleteBoard(String strNum);
}
