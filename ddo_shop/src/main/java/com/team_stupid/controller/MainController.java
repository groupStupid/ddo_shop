package com.team_stupid.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team_stupid.blockchain.main.Openchain;

@Controller
public class MainController {
//	@Autowired
//	private Openchain openchain;
	@RequestMapping("/main")
	public String main() /* throws Exception */{
//		openchain.StartChain();
		return "main/main";
	}
}
