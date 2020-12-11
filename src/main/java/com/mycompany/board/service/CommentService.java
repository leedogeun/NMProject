package com.mycompany.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.board.dao.CommentDao;
import com.mycompany.board.dto.Bcomment;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;

	// 해당 게시물의 댓글 보기
	public Bcomment getComment(int bno) {
		Bcomment bcomment = commentDao.selectComment(bno);
		return bcomment;
	}

//	public List<Bcomment> getCommentList(int bno) {
//		List<Bcomment> commentList = commentDao.selectList(bno);
//		return commentList;
//	}

	// 댓글
//	public void writeComment(Bcomment comment) {
//		commentDao.insertComment(comment); // 댓글 작성하기
//	}

}
