package com.team_stupid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.blockchain.core.Block;
import com.team_stupid.blockchain.core.Transaction;
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
		// 전체 blockchain이 정상인지 체크
		System.out.println("\nBlockchain is Valid : " + openchain.isChainValid());
	}
	@ResponseBody
	@RequestMapping(value = "/genesisblock")
	public void genesisblock() {
		openchain.getBlockchain().add(new Block("0", new Transaction()));
		System.out.println("\nTrying to Mine Genesis block!");
		openchain.getBlockchain().get(0).mineBlock(3);
	}
	@ResponseBody
	@RequestMapping(value = "/mineblock")
	public void mineblock(HttpServletRequest request) throws Exception {
		String imageUrl = "https://ddoshop-bucket.s3.ap-northeast-2.amazonaws.com/ykm.png";
		Transaction transaction = new Transaction("userID", imageUrl);
		openchain.getBlockchain().add(new Block(openchain.getBlockchain().get(openchain.getBlockchain().size()-1).getHash(), 
				transaction));
		System.out.println("Trying to Mine block #" + (openchain.getBlockchain().size()-1));
		openchain.getBlockchain().get(openchain.getBlockchain().size()-1).mineBlock(3);
		// 전체 blockchain이 정상인지 체크
		System.out.println("\nBlockchain is Valid : " + openchain.isChainValid());
		
		HttpSession session = request.getSession();
		session.setAttribute("imageUrl", openchain.getBlockchain().get(openchain.getBlockchain().size()-1).getTransaction().getValue());
	}
	@ResponseBody
	@RequestMapping(value = "/viewGiftcard", produces ="application/text; charset=UTF-8", method = RequestMethod.POST)
	public void viewGiftcard(String blockNum) {
		Block block = openchain.getBlockchain().get(Integer.parseInt(blockNum) - 1);
		openchain.getBlockchain().get(Integer.parseInt(blockNum)-1).getInfomation();
//		Image img = block.getDataImage();
		
	}
}
