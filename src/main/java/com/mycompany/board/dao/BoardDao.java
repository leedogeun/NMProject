package com.mycompany.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mycompany.board.dto.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insert(Board board) {
		int rows = sqlSessionTemplate.insert("board.insert", board);
		return rows;
	}
}
