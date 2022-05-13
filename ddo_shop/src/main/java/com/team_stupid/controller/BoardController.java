package com.team_stupid.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.domain.BoardVO;
import com.team_stupid.mapper.BoardMapper;
import com.team_stupid.service.BoardService;

@Controller
public class BoardController {
//	@Autowired
//	private BoardDAO boardDAO;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private BoardMapper boardMapper;
	@RequestMapping("/board/**")
	public String getList(Model model, HttpServletRequest request) throws Exception{
		String url = request.getRequestURI();
		if(!(url.equals("/board_main/scrollTop.js"))) {
//			String tmp = url.substring(url.length()-1);
//			System.out.println("긁어온 링크 : " + url);
//			System.out.println("렝스 : " + url.length());
//			System.out.println("찾는링크 : " + tmp);
			
			List<BoardVO> list = null;
			list = service.list();
			model.addAttribute("lists", list);
			System.out.println("board_main호출");
			System.out.println(boardMapper.getCount());
		}
		return "board/board_main";
	}
	
	@RequestMapping("/board/board_write")
	public String board_write() {
		return "board/board_write";
	}
	
	@RequestMapping("/board/detail/**")
	public String board_detail(HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		System.out.println(request.getRequestURI());
		String[] urlArray = request.getRequestURI().split("/");
		String detailNum = urlArray[urlArray.length - 1];
		int num = Integer.parseInt(detailNum);
		
		List<BoardVO> list = null;
		list = service.list();
		session.setAttribute("lists", list);

		if(!detailNum.equals("scrollTop.js") && (num < 1 || num > boardMapper.getCount()))
			return "board/board_detail_failed";
		if(!detailNum.equals("scrollTop.js")) {
			session.setAttribute("showNum", num);
			session.setAttribute("MAX", boardMapper.getCount());
			return "board/board_detail";
		}
		return "board/board_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board_write.do", produces ="application/json; charset=UTF-8", method = RequestMethod.POST)
	public String writeItem(@RequestBody Map<String,String> map, HttpServletResponse response, HttpServletRequest req) throws Exception {
		StringBuilder boardNum = new StringBuilder();
		boardNum.append((boardMapper.getCount()+1));
		map.put("EVENT_NUM",boardNum.toString());
		System.out.println("EVENT_NUM : " + map.get("EVENT_NUM"));
		System.out.println("EVENT_TITLE : " + map.get("EVENT_TITLE"));
		System.out.println("EVENT_CONTENTS : " + map.get("EVENT_CONTENTS"));
		service.write(map);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board_main/board_delete.do", produces ="application/text; charset=UTF-8", method = RequestMethod.POST)
	public String board_delete(String board_num) {
		int tmp = Integer.parseInt(board_num);
		boardMapper.deleteboard(tmp);
		
		return "success";
	}
}
