package com.mycompany.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.board.dao.BoardDao;
import com.mycompany.board.dto.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	public void deleteBoard(int bno) {
		boardDao.deleteBoard(bno);
	}

	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}

	public void increaseHitcount(int bno) {
		boardDao.updateHitcount(bno);
	}

	public Board getBoard(int bno) {
		Board board = boardDao.selectBoard(bno);
		return board;
	}

	public void writeBoard(Board board) {
		boardDao.insert(board);
	}

	public List<Board> getBoardList() {
		List<Board> boardList = boardDao.selectList();
		return boardList;
	}

}
