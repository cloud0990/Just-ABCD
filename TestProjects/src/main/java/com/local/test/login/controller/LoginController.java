package com.local.test.login.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.local.test.common.domain.ReturnDataVo;
import com.local.test.common.domain.SessionVo;
import com.local.test.login.service.UserService;

@Controller
public class LoginController {
	
	@Resource(name="userService")
	private UserService mapper;
	
	@RequestMapping("/login")
	public String loginPage() throws Exception {
		return "loginPage";
	}
	//param = uId, uPwd
	@RequestMapping(value="/checkLoginUser", method=RequestMethod.POST)
	public @ResponseBody ReturnDataVo checkLoginUser(@RequestParam HashMap<String, String> param, HttpServletRequest request) throws Exception {
		ReturnDataVo  result = new ReturnDataVo();
		HttpSession  session = request.getSession(true);//현재 session이 있으면 반환, 없으면 생성해서 반환 (=request.getSession() )
		//HttpSession session = request.getSession(false); : 현재 session이 있으면 반환, 없으면 null반환
		SessionVo loginUserVo = new SessionVo();
		loginUserVo = mapper.checkLoginUser(param);
		
		if(loginUserVo != null) {
			HashMap<String, Object> loginHist = new HashMap<>();
			loginHist.put("uId", param.get("uId"));
			loginHist.put("ip", request.getRemoteAddr());
			mapper.createloginHist(loginHist);
			result.setResultCode("S000");
			result.setResultMsg("로그인 성공");
			session.setAttribute("S_USER", loginUserVo);
			session.setAttribute("S_LOGIN_YN", "Y");
		}else {
			result.setResultCode("S999");
			result.setResultMsg("아이디/패스워드가 등록되어있지 않습니다.");
		}
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response , RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession(true); //=request.getSession();
		if(session == null) {
			return "redirect:/login";
		}
		//session.getAttribute() : 현재 세션에 저장되어있는 값 얻어오기 -> 반환 타입에 맞게 다운 캐스팅 해야함
		String isLogin = (String) session.getAttribute("S_LOGIN_YN");
		SessionVo loginUserVo = (SessionVo) session.getAttribute("S_USER");
		
		//로그인이 되어있는 경우(세션에 로그인 정보가 저장되어있는 경우), session 값 삭제, 쿠키 삭제
		if(isLogin != null && isLogin.equals("Y") && loginUserVo != null && !("").equals(loginUserVo.getuId())) {
			
			//session.setAttribute(key, session값) -> key값은 문자열, session값은 Object
			session.setAttribute("S_USER", null);
			session.setAttribute("S_LOGIN_YN", null);

			session.removeAttribute("S_USER");
			session.removeAttribute("S_LOGIN_YN");
			
			//쿠키 제거
			for(Cookie cookie : request.getCookies()) {
				if(cookie.getName().startsWith("_ga")) {
					//System.out.println(cookie.getName());
					cookie.setValue(null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
			session.invalidate(); //세션 전체 제거(무효화)
		}
		redirectAttributes.addFlashAttribute("logoutMag", "로그아웃 되었습니다.");
		return "redirect:/login";
	}
}