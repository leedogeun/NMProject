package com.mycompany.board.controller;

import java.text.DateFormat;
import java.util.Date;
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

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList() {
		System.out.println("board List");
		return "/boardList";
	}

	@RequestMapping("/writeBoardForm")
	public String writeBoardForm() {
		return "/writeBoardForm";
	}

	@RequestMapping("/writeBoard")
	public String writeBoard(Board board) {
//		service.writeBoard(board);
		return "/boardList";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String home(Locale locale, Model model) {
	 logger.info("Welcome home! The client locale is {}.", locale);
	
	 Date date = new Date(); DateFormat dateFormat =
	 DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 
	 String formattedDate = dateFormat.format(date);
	 
	 model.addAttribute("serverTime", formattedDate);
	 
	 return "home";
	 
	 }
	
}
