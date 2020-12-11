package com.mycompany.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.board.dto.Bcomment;

@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 해당 게시물의 댓글 보기
	public Bcomment selectComment(int bno) {
		Bcomment bcomment = sqlSessionTemplate.selectOne("comment.selectComment", bno);
		return bcomment;
	}

//	public List<Bcomment> selectList(int bno) {
//		List<Bcomment> commentList = sqlSessionTemplate.selectList("comment.selectList", bno);
//		return commentList;
//	}

	// 댓글 작성하기
//	public int insertComment(Bcomment comment) {
//		int rows = sqlSessionTemplate.insert("comment.insert", comment);
//		return rows;
//	}

}
