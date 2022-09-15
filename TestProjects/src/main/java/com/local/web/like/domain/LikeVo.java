package com.local.web.like.domain;

import lombok.Data;

@Data
public class LikeVo {
	
	private int like_idX;
	private int like_id;
	private int user_idx;
	private int board_id;
	private String like_tp;
}