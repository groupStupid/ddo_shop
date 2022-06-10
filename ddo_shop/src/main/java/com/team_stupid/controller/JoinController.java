package com.team_stupid.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.mapper.AccountMapper;

@Controller
public class JoinController {

	
	@Autowired
	private AccountMapper accountMapper;
	
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/IdChecking.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String idChecking(String id, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		System.out.println("SignupController idChecking() : " + id);
		if (!id.equals("") && accountMapper.selectUserIdDistinct(id) == 0) {
			ses.setAttribute("idDuplication", true);
			ses.setAttribute("idChecked", id);
			return "success";
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/PwChecking.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String pwChecking(String pw, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if (pw.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")) {
			return "사용 가능한 비밀번호입니다!";
		} else {
			return "영문 + 숫자 + 특수문자를 포함하여 8자 이상 입력해주세요.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/EmailChecking.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String emailChecking(String email) {
		if (email.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "사용 가능한 이메일입니다!";
		} else {
			return "이메일 형식을 갖춰주세요.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/emailDuplicateCheck.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String emailDuplicatedChecking(String email) {
		int emailCount = accountMapper.getEmailCount(email);
		if (emailCount == 0) {
			return "success";
		}
		return "duplication";
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/test.do", method = RequestMethod.POST)
	public String test(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		return ses.getAttribute("idChecked") + " / " + ses.getAttribute("idDuplication");
	}
	@ResponseBody
	@RequestMapping(value = "/join/nicknameChecking.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String nicknameChecking(String nickname, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		if (!nickname.equals("") && accountMapper.selectNicknameDistinct(nickname) == 0) {
			ses.setAttribute("nicknameDuplication", true);
			ses.setAttribute("nicknameChecked", nickname);
			return "success";
		}
		return "fail";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/join/nick_submit.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String nick_submit(@RequestBody Map<String, String> map, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		
		String id = map.get("id");
		String password = map.get("password");
		String email = map.get("email");
		String nickname = map.get("nickname");
		char category = map.get("category").charAt(0);
		
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		password = bCryptPasswordEncoder.encode(password);
		
		if (!ses.getAttribute("idChecked").equals(id) || !(boolean)ses.getAttribute("idDuplication")) {
			return "id";
		}
		if (!ses.getAttribute("nicknameChecked").equals(nickname) || !(boolean)ses.getAttribute("nicknameDuplication")){
			return "nickname";
		}
		if (accountMapper.register( id, password, email, nickname, category) == 1) {
			ses.removeAttribute("idChecked");
			ses.removeAttribute("idDuplication");
			ses.removeAttribute("nicknameChecked");
			ses.removeAttribute("nicknameDuplication");
			return "success";	
		} else {
			return "register error";
		}
	}
}
