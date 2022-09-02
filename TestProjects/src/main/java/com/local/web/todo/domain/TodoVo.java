package com.local.web.todo.domain;

import lombok.Data;

@Data
public class TodoVo {

	private int td_id;
	private String td_nm;
	private String td_tp;
	private String td_date;
	private String td_upd_date;
	private String td_last_date;
	private String user_idx;
	private String user_nm;
}