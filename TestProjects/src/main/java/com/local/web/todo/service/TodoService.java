package com.local.web.todo.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.local.web.todo.mapper.TodoMapper;

@Service("todoService")
public class TodoService {
	
	@Resource(name="todoMapper")
	private TodoMapper mapper;
	
	public int getQueryTotalCnt() {
		return mapper.getQueryTotalCnt();
	}
	public List<HashMap<String, Object>> getTodoPreListRetrieve(HashMap<String, Object> hashmapParam) {
		return mapper.getTodoPreListRetrieve(hashmapParam);
	}
	public List<HashMap<String, Object>> getTodoNowListRetrieve(HashMap<String, Object> hashmapParam) {
		return mapper.getTodoNowListRetrieve(hashmapParam);
	}
	public List<HashMap<String, Object>> getTodoSuccessListRetrieve(HashMap<String, Object> hashmapParam) {
		return mapper.getTodoSuccessListRetrieve(hashmapParam);
	}
	public List<HashMap<String, Object>> getTodoRestListRetrieve(HashMap<String, Object> hashmapParam) {
		return mapper.getTodoRestListRetrieve(hashmapParam);
	}
	
	public int createTodo(HashMap<String, Object> hashmapParam) {
		return mapper.createTodo(hashmapParam);
	}
	public int updateTodo(HashMap<String, Object> hashmapParam) {
		return mapper.updateTodo(hashmapParam);
	}
	public int deleteTodo(HashMap<String, Object> hashmapParam) {
		return mapper.deleteTodo(hashmapParam);
	}
	
}