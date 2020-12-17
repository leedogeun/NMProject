package com.mycompany.board.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Bcomment {

	private int bno;
	private int cno;
	private String cwriter;
	private String cpassword;
	private String ccontent;
	private Date cdate;

}
