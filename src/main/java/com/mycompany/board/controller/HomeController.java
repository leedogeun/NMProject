package com.mycompany.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.board.dto.Bcomment;
import com.mycompany.board.dto.Board;
import com.mycompany.board.service.BoardService;
import com.mycompany.board.service.CommentService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private BoardService service; // 게시글

	@Autowired
	private CommentService commmentService; // 댓글

	// 댓글 수정 완료
	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	public String updateComment(Bcomment comment, int bno) {
		commmentService.updateComment(comment);
		return "redirect:/boardDetail?bno=" + bno; // 상세보기에서 댓글 수정했기 때문에 상세보기 페이지로 이동
	}

	// 댓글 수정
	@RequestMapping(value = "/updateCommentForm", method = RequestMethod.GET)
	public String updateCommentForm(int bno, Model model) {
		Board board = service.getBoard(bno);
		Bcomment comment = commmentService.getComment(bno);
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);
		return "/updateComment";
	}

	// 댓글 쓰기 완료
	@RequestMapping(value = "/writeComment", method = RequestMethod.POST)
	public String writeComment(Bcomment comment) {
		commmentService.writeComment(comment);
		return "redirect:/boardDetail?bno=" + comment.getBno(); // 상세보기에서 댓글 작성했기 때문에 상세보기 페이지로 이동
	}

	// 게시글 목록
	@RequestMapping("/boardList")
	public String boardList(Model model, @RequestParam(defaultValue = "1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		// 페이지 당 행 수 : 답글 포함 20개
		int rowsPerPage = 20;
		// 이전 , 다음 클릭했을 때 나오는 페이지 수
		int pagesPerGroup = 5;
		// 전체 게시물 수
		int totalRowNum = service.getTotalRowNo();
		// 전체 페이지 수
		int totalPageNum = totalRowNum / rowsPerPage;
		if (totalRowNum % rowsPerPage != 0) {
			totalPageNum++; // 남는 짜투리 페이지도 페이지로 인정
		}
		// 전체 그룹 수
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if (totalPageNum % pagesPerGroup != 0) {
			totalGroupNum++; // 남는 짜투리 그룹도 그룹으로 인정
		}
		// 현재 페이지의 그룹번호
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;
		// pageNo 기준 1~5 1
		// 6~10 2
		// 11~15 3
		// 현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		// 현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		// 1 + 5 - 1 = 5;
		if (groupNo == totalGroupNum) {
			endPageNo = totalPageNum;
		}

		// 현재 페이지의 시작 행 번호
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;
		// 현재 페이지의 끝 행 번호
		int endRowNo = pageNo * rowsPerPage;
		if (pageNo == totalPageNum) { // 현재 그룹의 번호가 전체 그룹 수(마지막 그룹번호)와 같다면
			endRowNo = totalRowNum; // 끝 행 번호는 전체 행 번호 수 만큼 된다.
		}

		// 현재 페이지의 게시물 가져오기
		List<Board> boardList = service.getBoardList(startRowNo, endRowNo);

		// JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup); // 그룹 당 페이지 수
		model.addAttribute("totalPageNum", totalPageNum); // 전체 페이지 수 : 11 이라면
		model.addAttribute("totalGroupNum", totalGroupNum); // 전체 그룹의 수 : 3
		model.addAttribute("groupNo", groupNo); // 현재 그룹 번호 : 1~5이면 1, 6~10이면 2
		model.addAttribute("startPageNo", startPageNo); // 현재 그룹의 시작 페이지 번호 : 1 그룹이면 1, 2 그룹이면 6
		model.addAttribute("endPageNo", endPageNo); // 현재 그룹의 마지막 페이지 번호 : 1 그룹이면 5 ,2 그룹이면 10
		model.addAttribute("pageNo", pageNo); // 현재 페이지 번호 : 사용자가 클릭한 번호
		model.addAttribute("boardList", boardList); // 현재 페이지 내용

		return "/boardList";
	}

	// 게시글 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(int bno) {
		service.deleteBoard(bno);
		return "redirect:boardList";
	}

	// 게시글 수정 완료
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(Board board, HttpSession session) {
		service.updateBoard(board);
		int pageNo = (Integer) session.getAttribute("pageNo");
		return "redirect:/boardList?pageNo=" + pageNo;
	}

	// 게시글 수정
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String updateBoardForm(int bno, Model model) {
		Board board = service.getBoard(bno);
		model.addAttribute("board", board);
		return "/updateBoardForm";
	}

	// 게시물 상세보기 + 해당 게시글의 댓글 보기
	@RequestMapping("/boardDetail")
	public String boardDetail(int bno, Model model) {
		service.increaseHitcount(bno);
		Board board = service.getBoard(bno);
		Bcomment bcomment = commmentService.getComment(bno);
		model.addAttribute("board", board);
		model.addAttribute("bcomment", bcomment);
		return "/boardDetail";
	}

	// 게시글 쓰기 완료
	@RequestMapping("/writeBoard")
	public String writeBoard(Board board, HttpSession session) {
		service.writeBoard(board);
		int pageNo = (Integer) session.getAttribute("pageNo");
		return "redirect:/boardList?pageNo=" + pageNo;
	}

	// 게시글 쓰기
	@RequestMapping("/writeBoardForm")
	public String writeBoardForm() {
		return "/writeBoardForm";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

}
