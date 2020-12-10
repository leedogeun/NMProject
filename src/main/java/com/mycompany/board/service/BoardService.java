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

	// 게시물 가져오기
	public List<Board> getBoardList(int startRowNo, int endRowNo) {
		List<Board> boardList = boardDao.selectList(startRowNo, endRowNo); 
		return boardList;
	}

	// 전체 게시물 수 가져오기
	public int getTotalRowNo() {
		int totalRowNum = boardDao.selectTotalRowNo();
		return totalRowNum;
	}

	// 삭제
	public void deleteBoard(int bno) {
		boardDao.deleteBoard(bno);
	}

	// 수정 
	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}

	// 조회수 증가
	public void increaseHitcount(int bno) {
		boardDao.updateHitcount(bno);
	}

	// 상세보기, 수정하기
	public Board getBoard(int bno) {
		Board board = boardDao.selectBoard(bno);
		return board;
	}

	// 글쓰기, 댓글
	public void writeBoard(Board board) {
		boardDao.insert(board);
	}

}
