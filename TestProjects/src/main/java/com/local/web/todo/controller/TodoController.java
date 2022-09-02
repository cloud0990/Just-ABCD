package com.local.web.todo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.local.web.common.domain.PageingVo;
import com.local.web.common.domain.ReturnDataVo;
import com.local.web.common.domain.SessionVo;
import com.local.web.todo.service.TodoService;

@Controller
@RequestMapping("/todo/main")
public class TodoController {
	
	@Resource(name="todoService")
	private TodoService mapper;
	
	@RequestMapping(value="/view")
	public String view() {
		return "/todo/todoList";
	}
	
	/**
	 * 예정 리스트
	 * @param PageingVo
	 * @param hashmapParam
	 * @param HttpSession
	 * @return HashMap
	 */
	@RequestMapping(value="/getTodoPreListRetrieve", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getTodoPreListRetrieve(@ModelAttribute("pageing") PageingVo pageing
														   , @RequestParam HashMap<String, Object> hashmapParam
														   , HttpSession session) {
		ReturnDataVo result = new ReturnDataVo();
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> hashmapResult = new HashMap<>();
		SessionVo member = (SessionVo) session.getAttribute("S_USER");
		
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			hashmapParam.put("user_idx", member.getUser_idx());
			
			resultList = mapper.getTodoPreListRetrieve(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	/**
	 * 진행 중 리스트
	 * @param PageingVo
	 * @param hashmapParam
	 * @param HttpSession
	 * @return HashMap
	 */
	@RequestMapping(value="/getTodoNowListRetrieve", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getTodoNowListRetrieve(@ModelAttribute("pageing") PageingVo pageing
														   , @RequestParam HashMap<String, Object> hashmapParam
														   , HttpSession session) {
		ReturnDataVo result = new ReturnDataVo();
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> hashmapResult = new HashMap<>();
		SessionVo member = (SessionVo) session.getAttribute("S_USER");
		
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			hashmapParam.put("user_idx", member.getUser_idx());
			
			resultList = mapper.getTodoNowListRetrieve(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	/**
	 * 완료 리스트
	 * @param PageingVo
	 * @param hashmapParam
	 * @param HttpSession
	 * @return HashMap
	 */
	@RequestMapping(value="/getTodoSuccessListRetrieve", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getTodoSuccessListRetrieve(@ModelAttribute("pageing") PageingVo pageing
														   , @RequestParam HashMap<String, Object> hashmapParam
														   , HttpSession session) {
		ReturnDataVo result = new ReturnDataVo();
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> hashmapResult = new HashMap<>();
		SessionVo member = (SessionVo) session.getAttribute("S_USER");
		
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			hashmapParam.put("user_idx", member.getUser_idx());
			
			resultList = mapper.getTodoSuccessListRetrieve(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	/**
	 * 보류 리스트
	 * @param PageingVo
	 * @param hashmapParam
	 * @param HttpSession
	 * @return HashMap
	 */
	@RequestMapping(value="/getTodoRestListRetrieve", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getTodoRestListRetrieve(@ModelAttribute("pageing") PageingVo pageing
														   , @RequestParam HashMap<String, Object> hashmapParam
														   , HttpSession session) {
		ReturnDataVo result = new ReturnDataVo();
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> hashmapResult = new HashMap<>();
		SessionVo member = (SessionVo) session.getAttribute("S_USER");
		
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			hashmapParam.put("user_idx", member.getUser_idx());
			
			resultList = mapper.getTodoRestListRetrieve(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	/**
	 * 삭제
	 * @param hashmapParam
	 * @return
	 */
	@Transactional
	@RequestMapping(value="deleteTodo", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo deleteTodo(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();

		try {
			mapper.deleteTodo(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 수정
	 * @param hashmapParam
	 * @return
	 */
	@Transactional
	@RequestMapping(value="updateTodo", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo updateTodo(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		
		try {
			mapper.updateTodo(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 삽입
	 * @param hashmapParam
	 * @return
	 */
	@Transactional
	@RequestMapping(value="createTodo", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo createTodo(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();

		hashmapParam.put("td_tp", hashmapParam.get("create_td_tp"));
		hashmapParam.remove("create_td_tp");

		try {
			mapper.createTodo(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
}