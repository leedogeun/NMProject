package com.mycompany.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.board.dto.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 비밀번호 확인
	public int checkPw(Map<String, Object> map) {
		int count = sqlSessionTemplate.selectOne("board.checkPw", map);
		return count;
	}

	// 게시글 가져오기
	public List<Board> selectList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<Board> boardList = sqlSessionTemplate.selectList("board.selectList", map);
		return boardList;
	}

	// 전체 게시글 수 가져오기
	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("board.selectTotalRowNum");
		return totalRowNum;
	}

	// 게시글 삭제
	public int deleteBoard(int bno) {
		int rows = sqlSessionTemplate.delete("board.deleteBoard", bno);
		return rows;
	}

	// 게시글 수정 완료
	public int updateBoard(Board board) {
		int rows = sqlSessionTemplate.update("board.updateBoard", board);
		return rows;
	}

	// 게시글 조회수 증가
	public int updateHitcount(int bno) {
		int rows = sqlSessionTemplate.update("board.updateHitcount", bno);
		return rows;
	}

	// 게시글 상세보기, 해당 게시글의 댓글 보기, 게시글 수정
	public Board selectBoard(int bno) {
		Board board = sqlSessionTemplate.selectOne("board.selectBoard", bno);
		return board;
	}

	// 게시글 쓰기
	public int insert(Board board) {
		int rows = sqlSessionTemplate.insert("board.insert", board);
		return rows;
	}

}
