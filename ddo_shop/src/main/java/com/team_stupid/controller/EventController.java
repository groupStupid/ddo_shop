package com.team_stupid.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EventController {
	@RequestMapping("/comment**")
	public String getDetail(HttpServletRequest request) throws Exception{
		
		return "comment/comment";
	}
}
