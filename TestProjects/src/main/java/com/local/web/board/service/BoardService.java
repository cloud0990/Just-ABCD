package com.local.web.board.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.local.web.board.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Resource(name="boardMapper")
	private BoardMapper mapper;
	
	public int getQueryTotalCnt() {
		return mapper.getQueryTotalCnt();
	}
	//게시판 전체조회
	public List<HashMap<String, Object>> selectAllBoard(HashMap<String, Object> hashmapParam) {
		return mapper.selectAllBoard(hashmapParam);
	}
	//내 게시글 조회
	public List<HashMap<String, Object>> selectMyBoard(int uIdx) {
		return mapper.selectMyBoard(uIdx);
	}
	//게시글 작성
	public int createItem(HashMap<String, String> hashmapParam) {
		return mapper.createItem(hashmapParam);
	}
	//게시글 수정
	public int updateItem(HashMap<String, String> hashmapParam) {
		return mapper.updateItem(hashmapParam);
	}
	
}