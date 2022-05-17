package com.team_stupid.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	
	private boolean idDuplication = false;
	private String idChecked = "";
	
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}

	@ResponseBody
	@RequestMapping(value = "/join/join.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String join_do(@RequestBody Map<String, String> map,
							HttpServletResponse response) throws SQLException, IOException {
		String username = map.get("name");
		String userid = map.get("id");
		String password = map.get("pw");
		String pw_check = map.get("pw_check");
		String email = map.get("email");
		String nickname = map.get("nickname");
		String address = map.get("address");
		String phone = map.get("phone");
		System.out.println("name : " + username);
		System.out.println("id : " + userid);
		System.out.println("pw : " + password);
		System.out.println("pw_check : " + pw_check);
		System.out.println("email : " + email);
		System.out.println("nickname : " + nickname);
		System.out.println("address : " + address);
		System.out.println("phone : " + phone);
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		
		
		if (!idChecked.equals(userid) || !idDuplication) {
			return "id";
		}
		if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")) {
			return "pw";
		} 
		if (!password.equals(pw_check)) {
			return "pw_check";
		} else {
			password = bCryptPasswordEncoder.encode(password);
		}

		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "email";
		}
		if (accountMapper.register( userid, username, password, email, nickname, address, phone, '1') == 1) {
			return "success";	
		} else {
			return "register error";
		}
//		if (customerMapper.register( userid, username, password, email, nickname, address, phone, '1') == 1) {
//		return "success";	
//	} else {
//		return "register error";
//	}
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/IdChecking.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String idChecking(String id) {
		System.out.println("SignupController idChecking() : " + id);
		if (accountMapper.selectUserIdDistinct(id) == 0) {
			idDuplication = true;
			idChecked = id;
			return "사용 가능한 아이디입니다.";
		}
		return "이미 존재하는 아이디입니다.";
	}
	
	
}
