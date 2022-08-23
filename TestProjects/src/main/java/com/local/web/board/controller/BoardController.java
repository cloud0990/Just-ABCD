package com.local.web.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.local.web.board.service.BoardService;
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
	public ModelAndView myBoardListPage(HttpServletRequest request, ModelAndView mv) {
		//getSession(false) = session이 있으면 현재 sessino 반환 / 없으면 null 반환
		HttpSession session = request.getSession(false);
		//세션이 비어있는 경우
		if(session==null) {
			mv.setViewName("board/boardMain");
			return mv;
		}
		SessionVo sessionVo = (SessionVo) session.getAttribute("S_USER");
		//System.out.println(sessionVo.getuIdx());
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		resultList = mapper.selectMyBoard(sessionVo.getuIdx());
		mv.addObject("list", resultList);
		mv.setViewName("board/boardMy");
		return mv;
	}
	//@PostMapping(value="/main/selectAllBoard")
	@RequestMapping(value="/main/selectAllBoard", method=RequestMethod.POST)
	public @ResponseBody List<HashMap<String, Object>> selectAllBoard() {
		List<HashMap<String, Object>> boardList = new ArrayList<>();
		boardList = mapper.selectAllBoard();
		
		return boardList;
	}
	//@GetMapping
	@RequestMapping("/createBoard")
	public String createBoardPage() {
		return "board/boardCreate"; //view jsp 위치
	}
	@RequestMapping("/updateBoard")
	public ModelAndView updateBoardPage(HttpServletRequest request, ModelAndView mv) {
		//getSession(false) = session이 있으면 현재 sessino 반환 / 없으면 null 반환
		HttpSession session = request.getSession(false); //session 객체 생성 : request.getSession()을 호출하여 생성한다.
		//세션이 비어있는 경우
		if(session==null) {
			mv.setViewName("board/boardMain");
			return mv;
		}
		SessionVo sessionVo = (SessionVo) session.getAttribute("S_USER");
		//System.out.println(sessionVo.getuIdx());
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		resultList = mapper.selectMyBoard(sessionVo.getuIdx());
		mv.addObject("list", resultList);
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	//@PostMapping(value="/createItem")
	@RequestMapping(value="/createItem", method=RequestMethod.POST) //param : bSubject, bContent, uIdx
	public @ResponseBody ReturnDataVo createItem(@RequestParam HashMap<String,String> param) {
		ReturnDataVo result = new ReturnDataVo();
		int resultParam = mapper.createItem(param);	
		if(resultParam!=0) {
			result.setResultCode("S000");
			result.setResultMsg("게시글 작성 성공.\n게시판 홈으로 이동합니다.");
		}else {
			result.setResultCode("S999");
			result.setResultMsg("오류 발생...");
		}
		return result;
	}
	//@PostMapping(value="/updateItem")
	@RequestMapping(value="/updateItem", method=RequestMethod.POST) //param : bSubject, bContent, uIdx
	public @ResponseBody ReturnDataVo updateItem(@RequestParam HashMap<String,String> param) {
		ReturnDataVo result = new ReturnDataVo();
		int resultParam = mapper.createItem(param);	
		if(resultParam!=0) {
			result.setResultCode("S000");
			result.setResultMsg("게시글 수정 성공.\n게시판 홈으로 이동합니다.");
		}else {
			result.setResultCode("S999");
			result.setResultMsg("오류 발생");
		}
		return result;
	}
}