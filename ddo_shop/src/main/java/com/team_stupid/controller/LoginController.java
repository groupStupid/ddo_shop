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
	
	private String usernameForFoundid;
	private String useridForFoundid;
	
	@RequestMapping("/login")
	public String board_login() {
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
	public String board_login_fail(HttpServletResponse response) throws IOException {
		System.out.println("LoginController : called login fail");
		return "login/login_fail";
	}
	
	@RequestMapping("/login/foundid")
	public String board_login_foundid() {
		System.out.println("LoginController : called foundid");
		return "foundid/foundid";	
	}
	
	@RequestMapping("/login/foundid_success")
	public String board_login_foundid_success() {
		System.out.println("LoginController : called foundid_success");
		return "foundid/foundid_success";	
	}
	
	@RequestMapping("/login/foundpw")
	public String board_login_foundpw() {
		System.out.println("LoginController : called foundpw");
		return "foundpw/foundpw";	
	}
	
	@RequestMapping("/login/foundpw_success")
	public String board_login_foundpw_success() {
		System.out.println("LoginController : called foundpw_success");
		return "foundpw/foundpw_success";	
	}
	
	@RequestMapping("/accessDenied")
	public String accessDenied() {
		return "error/accessDenied";
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/login/foundid/foundid.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String foundid_submit(@RequestBody Map<String, String> map) {
		String username = map.get("name");
		String email = map.get("email");
		System.out.println("LoginController foundid_submit()");
		System.out.println("name : " + username);
		System.out.println("email : " + email);
		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "email fail";
		}
		
		try {
			String userid = accountMapper.FoundUserId(email);
			System.out.println("foundid select userid : " + userid);
			usernameForFoundid = username;
			useridForFoundid = userid;
			return userid;
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return "found userid fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/login/foundid/foundid_success.do")
	public Map<String, String> foundid_success() {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("LoginController foundid_success()");
		System.out.println("usernameForFoundid : " + usernameForFoundid);
		System.out.println("useridForFoundid : " + useridForFoundid);
		map.put("username", usernameForFoundid);
		map.put("userid", useridForFoundid);
		usernameForFoundid = "";
		useridForFoundid = "";
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/login/foundpw/foundpw.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String foundpw_submit(@RequestBody Map<String, String> map) throws Exception {
		String userid = map.get("userid");
		String email = map.get("email");
		System.out.println("LoginController foundpw_submit()");
		System.out.println("userid : " + userid);
		System.out.println("email : " + email);
		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "email fail";
		}
		
		if (accountMapper.selectUserPw(userid, email) > 0) {
			// 현재 비밀번호를 임시 비밀번호로 바꾸고 email로 보내주어야 함.
			// 임시 비밀번호 영어+숫자 : 10자, 특수문자 2자
			
			String tempPW = "";
			for (int i = 0; i < 10; i++) {
				tempPW += (char) ((Math.random() * 26) + 97);
			}
			char[] tempPW_SpecialCharacter = {'@', '$', '!', '%', '*', '#', '?', '&'};
			for (int i = 0; i < 2; i++) {
				tempPW += tempPW_SpecialCharacter[(int) ((Math.random() * tempPW_SpecialCharacter.length))];
			}
			// 임시비밀번호 생성하면 출력한번 해주기
			System.out.println("tempPW : " + tempPW);
			accountVO.setUserId(userid);
			accountVO.setUserPw(tempPW);
			accountVO.setEmail(email);
			
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			tempPW = bCryptPasswordEncoder.encode(tempPW);
			accountMapper.updateTempUserPw(userid, tempPW);
			
			mailService.sendMail(accountVO);
			
			return "success";
		} else {
			System.out.println("비밀번호 조회 실패");
			return "found userpw fail";
		}
	}
	
	@RequestMapping("/changepw")
	public String change_pw() {
		return "changepw/changepw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/changepw.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String change_pw_submit(@RequestBody Map<String, String> map, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String current_pw = map.get("current_pw");
		String new_pw = map.get("new_pw");
		String new_pw_check = map.get("new_pw_check");
		String userid = (String)session.getAttribute("userID");
		CustomUserDetails user = (CustomUserDetails)customUserDetailsService.loadUserByUsername(userid);
		
		if(!bCryptPasswordEncoder.matches(current_pw, user.getPassword())) {
			return "현재 비밀번호가 일치하지 않습니다.";
		}
		
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
