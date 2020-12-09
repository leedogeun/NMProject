package com.mycompany.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.board.dao.BoardDao;
import com.mycompany.board.dto.Board;

@Service
public class BoardService {

//	@Autowired
//	private BoardDao boardDao;

	public void writeBoard(Board board) {
//		boardDao.insert(board);
	}

}
