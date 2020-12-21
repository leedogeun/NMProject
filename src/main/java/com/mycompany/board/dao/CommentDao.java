package com.mycompany.board.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.board.dto.Bcomment;

@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 비밀번호 확인
	public int checkPwComment(Map<String, Object> map) {
		int count = sqlSessionTemplate.selectOne("comment.checkPwComment", map);
		return count;
	}

	// 댓글 삭제
	public int deleteComment(Map<String, Integer> map) {
		int rows = sqlSessionTemplate.delete("comment.deleteComment", map);
		return rows;
	}

	// 댓글 수정 완료
	public int updateComment(Bcomment comment) {
		int rows = sqlSessionTemplate.update("comment.updateComment", comment);
		System.out.println(rows+"ddddddddddddddddd");
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
