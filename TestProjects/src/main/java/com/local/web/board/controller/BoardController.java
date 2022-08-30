package com.local.web.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.local.web.board.service.BoardService;
import com.local.web.common.domain.PageingVo;
import com.local.web.common.domain.ReturnDataVo;
import com.local.web.common.domain.SessionVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService mapper;
	
	@RequestMapping("/main")
	public String boardPage() {
		return "board/boardMain"; //view jsp 위치
	}
	@RequestMapping("/main/myMain")
	public String myMainPage() {
		return "board/boardMy";
	}
	
	/**
	 * 내 게시글 조회
	 * @param hashmapParam
	 * @param PageingVo
	 * @return HashMap
	 */
	@RequestMapping(value="/main/selectMyBoard", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> selectMyBoard(@ModelAttribute("pageing") PageingVo pageing, @RequestParam HashMap<String, Object> hashmapParam, HttpSession session) {
		List<HashMap<String, Object>> resultList = new ArrayList<>();
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
			hashmapParam.put("uIdx", member.getuIdx());

			resultList = mapper.selectMyBoard(hashmapParam);
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
	 * 전체 게시글 조회
	 * @param hashmapParam
	 * @param PageingVo
	 * @return HashMap
	 */
	//@PostMapping(value="/main/selectAllBoard")
	@RequestMapping(value="/main/selectAllBoard", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> selectAllBoard(@ModelAttribute("pageing") PageingVo pageing, @RequestParam HashMap<String, Object> hashmapParam) {
		List<HashMap<String, Object>> boardList = new ArrayList<>();
		HashMap<String, Object> hashmapResult = new HashMap<>();
		try {
			Integer page = pageing.getPage();
			if(page == 0) page = (Integer) 1;
			
			Integer rows  = pageing.getRows();
			Integer start = (page - 1) * rows;
			Integer end   = rows;
			
			hashmapParam.put("start", start);
			hashmapParam.put("end", end);
			
			boardList = mapper.selectAllBoard(hashmapParam);
			int records = mapper.getQueryTotalCnt();
			
			pageing.setRecords(records);
			pageing.setTotal( (int) Math.ceil((double)records / (double)pageing.getRows()));
			
			hashmapResult.put("page", pageing.getPage());
			hashmapResult.put("total", pageing.getTotal());
			hashmapResult.put("records", pageing.getRecords());
			hashmapResult.put("rows", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hashmapResult;
	}
	
	@RequestMapping("/createBoard")
	public String createBoardPage() {
		return "board/boardCreate"; //view jsp 위치
	}
	
	/**
	 * 게시글 작성
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@Transactional
	@RequestMapping(value="/createItem", method=RequestMethod.POST) //param : bSubject, bContent, uIdx
	public @ResponseBody ReturnDataVo createItem(@RequestParam HashMap<String, Object> hashmapParam, HttpSession session) {
		ReturnDataVo result = new ReturnDataVo();
		SessionVo member = (SessionVo) session.getAttribute("S_USER");
		hashmapParam.put("uIdx", member.getuIdx());
		hashmapParam.put("uNm", member.getuNm());
		try {
			mapper.createItem(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 게시글 수정
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@Transactional
	@RequestMapping(value="/updateItem", method=RequestMethod.POST) //param : bSubject, bContent, uIdx
	public @ResponseBody ReturnDataVo updateItem(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		try {
			mapper.updateItem(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 게시글 삭제
	 * @param hashmapParam
	 * @return ReturnDataVo
	 */
	@Transactional
	@RequestMapping(value="/deleteItem", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo deleteItem(@RequestParam HashMap<String, Object> hashmapParam) {
		ReturnDataVo result = new ReturnDataVo();
		try {
			mapper.deleteItem(hashmapParam);
			result.setResultCode("S000");
		} catch (Exception e) {
			result.setResultCode("S999");
			e.printStackTrace();
		}
		return result;
	}
	
}