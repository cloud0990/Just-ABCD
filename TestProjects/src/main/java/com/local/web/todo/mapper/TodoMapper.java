package com.local.web.todo.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("todoMapper")
public interface TodoMapper {
	
	int getQueryTotalCnt();
	List<HashMap<String, Object>> getTodoPreListRetrieve(HashMap<String, Object> hashmapParam);
	List<HashMap<String, Object>> getTodoNowListRetrieve(HashMap<String, Object> hashmapParam);
	List<HashMap<String, Object>> getTodoSuccessListRetrieve(HashMap<String, Object> hashmapParam);
	List<HashMap<String, Object>> getTodoRestListRetrieve(HashMap<String, Object> hashmapParam);
	
	int createTodo(HashMap<String, Object> hashmapParam);
	int updateTodo(HashMap<String, Object> hashmapParam);
	int deleteTodo(HashMap<String, Object> hashmapParam);
	
}