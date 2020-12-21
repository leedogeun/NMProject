package com.mycompany.board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.board.dao.CommentDao;
import com.mycompany.board.dto.Bcomment;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;

	// 비밀번호 확인
	public int checkPwComment(Map<String, Object> map) {
		int count = commentDao.checkPwComment(map);
		return count;
	}

	// 댓글 삭제
	public void deleteComment(Map<String, Integer> map) {
		commentDao.deleteComment(map);
	}

	// 댓글 수정 완료
	public void updateComment(Bcomment comment) {
		commentDao.updateComment(comment);
	}

	// 댓글 쓰기
	public void writeComment(Bcomment comment) {
		commentDao.insertComment(comment);
	}

	// 해당 게시글의 댓글 보기
	public Bcomment getComment(int bno) {
		Bcomment bcomment = commentDao.selectComment(bno);
		return bcomment;
	}

}
