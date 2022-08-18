package com.local.web.board.domain;

import lombok.Data;

@Data
public class BoardVo {
	
	private int bIdx;
	private int uIdx;
	private String bSubject;
	private String bContent;
	private String bDate;
	private String uNm;
}