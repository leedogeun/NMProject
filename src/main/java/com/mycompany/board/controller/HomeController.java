package com.mycompany.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.board.dto.Board;
import com.mycompany.board.service.BoardService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private BoardService service;

	@RequestMapping("/deleteBoard")
	public String deleteBoard(int bno) {
		service.deleteBoard(bno);
		return "redirect:boardList";
	}

	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(Board board) {
		service.updateBoard(board);
		return "redirect:boardList";
	}

	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String updateBoardForm(int bno, Model model) {
		Board board = service.getBoard(bno);
		model.addAttribute("board", board);
		return "/updateBoardForm";
	}

	@RequestMapping("/boardDetail")
	public String boardDetail(int bno, Model model) {
		service.increaseHitcount(bno);
		Board board = service.getBoard(bno);
		model.addAttribute("board", board);
		return "/boardDetail";
	}

	@RequestMapping("/boardList")
	public String boardList(Model model) {
		List<Board> boardList = service.getBoardList();
		model.addAttribute("boardList", boardList);
		return "/boardList";
	}

	@RequestMapping("/writeBoardForm")
	public String writeBoardForm() {
		return "/writeBoardForm";
	}

	@RequestMapping("/writeBoard")
	public String writeBoard(Board board) {
		service.writeBoard(board);
		return "redirect:/boardList";
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
