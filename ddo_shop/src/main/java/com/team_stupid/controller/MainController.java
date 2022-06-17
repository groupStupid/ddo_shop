package com.team_stupid.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team_stupid.domain.BoardVO;
import com.team_stupid.domain.ShopInfoVO;
import com.team_stupid.mapper.BoardMapper;
import com.team_stupid.mapper.ShopMapper;

@Controller
public class MainController {
	
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private ShopMapper shopMapper;
	
	@RequestMapping("/mainRestaurant")
	public String main(HttpServletRequest req) {
		
		return "main/mainRestaurant";
	}
	
	
	@RequestMapping("/mainMarket")
	public String mainMarket(HttpServletRequest req) {
		
		return "main/mainMarket";
	}
	
	@RequestMapping("/mainEvent")
	public String mainEvent(HttpServletRequest req) {
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
		return "main/mainEvent";
	}
	
	
	@RequestMapping("/mainSearch")
	public String mainSearch(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String keyword = req.getParameter("searchKeyword");
		List<ShopInfoVO> searchShopList = shopMapper.getShopInfoBySearchKeyword(keyword);
		ses.setAttribute("searchShopList", searchShopList);
		return "main/mainSearch";
	}
	
}
