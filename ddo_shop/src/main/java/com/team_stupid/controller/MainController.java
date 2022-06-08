package com.team_stupid.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team_stupid.domain.BoardVO;
import com.team_stupid.mapper.BoardMapper;

@Controller
public class MainController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/main")
	public String main(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		
		List<BoardVO> eventList = boardMapper.getList();
		ses.setAttribute("eventList", eventList);
		
//		List<ShopInfoVO> shopInfoList = shopMapper.getShopInfo();
//		for (ShopInfoVO shopInfoVO : shopInfoList) {
//			System.out.println(
//					shopInfoVO.getSHOP_SERIALNUM() + "\n" +
//					shopInfoVO.getSHOP_NAME() + "\n" +
//					shopInfoVO.getSHOP_LOCATION() + "\n" +
//					shopInfoVO.getSHOP_OPERTIME() + "\n" +
//					shopInfoVO.getSHOP_HOLIDAY() + "\n" +
//					shopInfoVO.getSHOP_CALL() + "\n" +
//					shopInfoVO.getSHOP_NOTICE() + "\n" +
//					shopInfoVO.getSHOP_IMAGE()
//					);
//			System.out.println("\n-------------");
//		}
//		ses.setAttribute("shopInfoList", shopInfoList);
		return "main/main";
	}
}
