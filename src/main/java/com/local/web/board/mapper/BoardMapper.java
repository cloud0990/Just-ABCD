package com.local.web.board.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("boardMapper")
public interface BoardMapper {
	//직전 결과 처리 행수
	int getQueryTotalCnt();
	//게시물 전체 조회
	List<HashMap<String, Object>> selectAllBoard(HashMap<String, Object> hashmapParam);
	//내 게시글 조회
	List<HashMap<String, Object>> selectMyBoard(HashMap<String, Object> hashmapParam);
	//게시물 작성
	int createItem(HashMap<String, Object> hashmapParam);
	//int createItemLike(HashMap<String, Object> hashmapParam);
	//게시물 수정
	int updateItem(HashMap<String, Object> hashmapParam);
	//게시글 삭제
	int deleteItem(HashMap<String, Object> hashmapParam);
}