package com.mycompany.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.board.dto.Bcomment;

@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 댓글 수정 완료
	public int updateComment(Bcomment comment) {
		int rows = sqlSessionTemplate.update("comment.updateComment", comment);
		return rows;
	}

	// 댓글 쓰기
	public int insertComment(Bcomment comment) {
		int rows = sqlSessionTemplate.insert("comment.insert", comment);
		return rows;
	}

	// 해당 게시글의 댓글 보기
	public Bcomment selectComment(int bno) {
		Bcomment bcomment = sqlSessionTemplate.selectOne("comment.selectComment", bno);
		return bcomment;
	}

}
