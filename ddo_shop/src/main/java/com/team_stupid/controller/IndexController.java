package com.team_stupid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/main")
	public String main() {
		return "main/main";
	}
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	@RequestMapping("/join")
	public String join() {
		return "join/join";
	}
}
