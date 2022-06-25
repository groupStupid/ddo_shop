package com.team_stupid.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private CustomUserDetailsService customUserDetailsService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
	
	
	@ResponseBody
	@RequestMapping(value="/edit/changePw.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String changePw(@RequestBody Map<String, String> map, HttpServletRequest req) {
		String currentPw = map.get("currentPw");
		String newPw = map.get("newPw");
		String newPwCheck = map.get("newPwCheck");
		String userid = (String) req.getSession().getAttribute("userID");
		CustomUserDetails user = (CustomUserDetails) customUserDetailsService.loadUserByUsername(userid);
		
		if (!passwordEncoder.matches(currentPw, user.getPassword())) {
			return "현재 비밀번호가 올바르지 않습니다.";
		}
		if (!newPw.equals(newPwCheck)) {
			return "비밀번호가 일치하지 않습니다.\n다시 확인해주세요";
		}
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		newPw = bCryptPasswordEncoder.encode(newPw);
		accountMapper.changePw(userid, newPw);
		return "success";
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
			ses.setAttribute("userID", id);
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
	
	
	@RequestMapping("/errorlogin")
	public String errorlogin() {
		return "join/errorlogin";
	}

}
