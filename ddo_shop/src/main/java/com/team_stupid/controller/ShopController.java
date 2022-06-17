package com.team_stupid.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team_stupid.domain.MenuInfoVO;
import com.team_stupid.domain.ShopEventVO;
import com.team_stupid.domain.ShopInfoVO;
import com.team_stupid.mapper.MenuMapper;
import com.team_stupid.mapper.ShopMapper;

@Controller
public class ShopController {
	
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	@RequestMapping("/main/shop**")
	public String shopInfoList(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		int category = Integer.parseInt(req.getParameter("category"));
		List<ShopInfoVO> shopList = shopMapper.getShopListByCategory(category);
		ses.setAttribute("shopList", shopList);
		
		return "main/mainShop";
	}
	
	@RequestMapping("/main/shop/detail**")
	public String shopDetail(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String serialNum = req.getParameter("serial");
		serialNum = String.format("%05d", Integer.parseInt(serialNum));
		ShopInfoVO shopInfo = shopMapper.getShopInfoDetail(serialNum);
		ses.setAttribute("shopInfo", shopInfo);
		
		ShopEventVO shopEvent = shopMapper.getShopEvent(serialNum);
		if (shopEvent != null) {
			ses.setAttribute("shopEvent", shopEvent);
		} else {
			ses.removeAttribute("shopEvent");
		}
		
		List<MenuInfoVO> menuList = menuMapper.getMenuInfo(serialNum);
		ses.setAttribute("menuList", menuList);
		
		return "shop/shopinfo";
	}
}