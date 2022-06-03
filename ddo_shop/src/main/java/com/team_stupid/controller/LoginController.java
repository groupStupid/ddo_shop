package com.team_stupid.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.domain.AccountVO;
import com.team_stupid.mapper.AccountMapper;
import com.team_stupid.security.CustomUserDetails;
import com.team_stupid.security.CustomUserDetailsService;
import com.team_stupid.service.MailService;

@Controller
public class LoginController /* implements Runnable */{
	
	@Autowired
	private AccountMapper accountMapper;
	@Autowired
	private MailService mailService;
	@Autowired
	private AccountVO accountVO;
	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
	@RequestMapping("/login")
	public String login() {
		System.out.println("LoginController : called login");
		
//		127s
//		long start = System.currentTimeMillis();
//		for (int i = 0; i < 1000; i++) {
//			accountMapper.selectUserPw("name1", "id1", "jgy2808@naver.com");
//		}
//		long end = System.currentTimeMillis();
//		System.out.println((end - start) / 1000);
		

//		long start = System.currentTimeMillis();
//		Thread th;
//		for (int i = 0; i < 1000; i++) {
//			th = new Thread(this);
//			th.start();
//		}
//		long end = System.currentTimeMillis();
//		System.out.println((end - start) / 1000);
		
		return "join/login";
	}
//	@Override
//	public void run() {
//		accountMapper.selectUserPw("id1", "jgy2808@naver.com");
//	}
	
	@RequestMapping("/login.fail")
	public String login_fail(HttpServletResponse response) throws IOException {
		System.out.println("LoginController : called login fail");
		return "login/login_fail";
	}
	
	@RequestMapping("/foundid")
	public String foundid() {
		System.out.println("LoginController : called foundid");
		return "join/foundid";	
	}
	
	@RequestMapping("/foundid_success")
	public String foundid_success() {
		System.out.println("LoginController : called foundid_success");
		return "join/foundid_success";
	}
	
	@RequestMapping("/foundpw")
	public String foundpw() {
		System.out.println("LoginController : called foundpw");
		return "join/foundpw";	
	}
	
	@RequestMapping("/foundpw_success")
	public String foundpw_success() {
		System.out.println("LoginController : called foundpw_success");
		return "join/foundpw_success";
	}
	
	@RequestMapping("/edit")
	public String edit() {
		return "join/edit";
	}
	
	@RequestMapping("/accessDenied")
	public String accessDenied() {
		return "error/accessDenied";
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/foundid.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String foundid_submit(String email, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		System.out.println("LoginController foundid_submit()");
		System.out.println("email : " + email);
		try {
			String id = accountMapper.FoundUserId(email);
			System.out.println("foundid select userid : " + id);
			ses.setAttribute("useridForFoundid", id);
			return id;
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return "found userid fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/foundid_success.do")
	public String foundid_success_do(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		System.out.println("LoginController foundid_success()");
		String result = (String) ses.getAttribute("useridForFoundid");
		ses.removeAttribute("useridForFoundid");
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/sendVerificationCode.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String SendVerificationCode(@RequestBody Map<String, String> map, HttpServletRequest req) throws Exception {
		HttpSession ses = req.getSession();
		String id = map.get("id");
		String email = map.get("email");
		if (accountMapper.selectUserPw(id, email) > 0) {
			String verificationCode = "";
			for (int i = 0; i < 6; i++) {
				int temp = (int) (Math.random()*9);
				verificationCode += Integer.toString(temp);
			}
			ses.setAttribute("verificationCode", verificationCode);
			mailService.sendMail(verificationCode, email);
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/verification.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String EmailVerification(String verificationCode, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if (verificationCode.equals(ses.getAttribute("verificationCode"))) {
			ses.removeAttribute("verificationCode");
			return "success";
		}
		return "fail";
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "/foundpw.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
//	public String foundpw_submit(@RequestBody Map<String, String> map) throws Exception {
//		String id = map.get("id");
//		String email = map.get("email");
//		System.out.println("LoginController foundpw_submit()");
//		System.out.println("userid : " + id);
//		System.out.println("email : " + email);
//		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
//			return "email fail";
//		}
//		
//		if (accountMapper.selectUserPw(id, email) > 0) {
//			// 현재 비밀번호를 임시 비밀번호로 바꾸고 email로 보내주어야 함.
//			// 임시 비밀번호 영어+숫자 : 10자, 특수문자 2자
//			
//			String tempPW = "";
//			for (int i = 0; i < 10; i++) {
//				tempPW += (char) ((Math.random() * 26) + 97);
//			}
//			char[] tempPW_SpecialCharacter = {'@', '$', '!', '%', '*', '#', '?', '&'};
//			for (int i = 0; i < 2; i++) {
//				tempPW += tempPW_SpecialCharacter[(int) ((Math.random() * tempPW_SpecialCharacter.length))];
//			}
//			// 임시비밀번호 생성하면 출력한번 해주기
//			System.out.println("tempPW : " + tempPW);
//			accountVO.setUserId(id);
//			accountVO.setUserPw(tempPW);
//			accountVO.setEmail(email);
//			
//			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//			tempPW = bCryptPasswordEncoder.encode(tempPW);
//			accountMapper.updateTempUserPw(id, tempPW);
//			
//			mailService.sendMail(accountVO);
//			
//			return "success";
//		} else {
//			System.out.println("비밀번호 조회 실패");
//			return "found userpw fail";
//		}
//	}
	
	@RequestMapping("/editpw")
	public String edit_pw() {
		return "join/editpw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/editpw.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String edit_pw_submit(@RequestBody Map<String, String> map, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String new_pw = map.get("new_pw");
		String new_pw_check = map.get("new_pw_check");
		
		if (!new_pw.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")) {
			return "새 비밀번호의 규칙이 맞지 않습니다.";
		} 
		
		if (!new_pw_check.equals(new_pw)) {
			return "새 비밀번호를 다시 확인해주세요.";
		} else {
			new_pw = bCryptPasswordEncoder.encode(new_pw);
			accountMapper.updateTempUserPw((String)session.getAttribute("userID"), new_pw);
			return "success";
		}
	}
	
//	@PostMapping("/view/login.do")
//	public String login_do(String id, String pw, HttpServletRequest req) throws SQLException {
//		HttpSession session = req.getSession();
////		Authentication auth = 
//		if (jcon.Login(id, pw) == 1) {
//			System.out.println("session : " + session);
//			session.setAttribute("memId", id);
//			session.setAttribute("memIp", req.getRemoteAddr());
//			
//			return "redirect:/tm";
//		} else {
//			return "redirect:/view/login";
//		}
//	}

}
