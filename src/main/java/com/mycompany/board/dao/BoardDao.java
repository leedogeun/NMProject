package com.mycompany.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.board.dto.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int deleteBoard(int bno) {
		int rows = sqlSessionTemplate.delete("board.deleteBoard", bno);
		return rows;
	}

	public int updateBoard(Board board) {
		int rows = sqlSessionTemplate.update("board.updateBoard", board);
		return rows;
	}

	public int updateHitcount(int bno) {
		int rows = sqlSessionTemplate.update("board.updateHitcount", bno);
		return rows;
	}

	public Board selectBoard(int bno) {
		Board board = sqlSessionTemplate.selectOne("board.selectBoard", bno);
		return board;
	}

	public int insert(Board board) {
		int rows = sqlSessionTemplate.insert("board.insert", board);
		return rows;
	}

	public List<Board> selectList() {
		List<Board> boardList = sqlSessionTemplate.selectList("board.selectList");
		return boardList;
	}

}
