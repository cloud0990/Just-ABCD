package com.local.web.board.domain;

import lombok.Data;

@Data
public class BoardVo {
	private int board_id;
	private int user_idx;
	private String b_subject;
	private String b_content;
	private String b_date;
	private String b_upd_date;
	private String user_nm;
}