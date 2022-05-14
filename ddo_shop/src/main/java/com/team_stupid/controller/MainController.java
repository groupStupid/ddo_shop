package com.team_stupid.controller;

import java.awt.Image;

import javax.swing.ImageIcon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.blockchain.core.Block;
import com.team_stupid.blockchain.main.Openchain;

@Controller
public class MainController {
	@Autowired
	private Openchain openchain;
	@RequestMapping("/main")
	public String main() /* throws Exception */{
//		openchain.StartChain();
		
		return "main/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/information")
	public void information() {
		for (int i = 0; i < openchain.getBlockchain().size(); i++) {
			System.out.println("**************************");
			openchain.getBlockchain().get(i).getInfomation();
			System.out.println("**************************");
		}
	}
	@ResponseBody
	@RequestMapping(value = "/genesisblock")
	public void genesisblock() {
		openchain.getBlockchain().add(new Block(null, "0"));
		System.out.println("\nTrying to Mine Genesis block!");
		openchain.getBlockchain().get(0).mineBlock(3);
	}
	@ResponseBody
	@RequestMapping(value = "/mineblock")
	public void mineblock() {
		ImageIcon icon = new ImageIcon("images/cat1.png");
		openchain.getBlockchain().add(new Block(icon.getImage(), openchain.getBlockchain().get(openchain.getBlockchain().size()-1).getHash()));
		System.out.println("\n" + openchain.getBlockchain().get(openchain.getBlockchain().size()-1).getDataImage());
		System.out.println("Trying to Mine block #" + openchain.getBlockchain().size());
		openchain.getBlockchain().get(openchain.getBlockchain().size()-1).mineBlock(3);
	}
	@ResponseBody
	@RequestMapping(value = "/viewGiftcard", produces ="application/text; charset=UTF-8", method = RequestMethod.POST)
	public void viewGiftcard(String blockNum) {
		Block block = openchain.getBlockchain().get(Integer.parseInt(blockNum) - 1);
		Image img = block.getDataImage();
		
	}
}
