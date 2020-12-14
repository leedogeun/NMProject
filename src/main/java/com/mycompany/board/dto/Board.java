package com.mycompany.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board {

	private int bno;
	private String btitle;
	private String bpassword;
	private String bcontent;
	private String bwriter;
	private Date bdate;
	private int hitcount;
	private String bcomment;

}
