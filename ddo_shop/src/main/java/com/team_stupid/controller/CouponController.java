package com.team_stupid.controller;

import java.security.Security;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.blockchain2.Block;
import com.team_stupid.blockchain2.Main;
import com.team_stupid.blockchain2.Transaction;
import com.team_stupid.blockchain2.TransactionOutput;
import com.team_stupid.blockchain2.Wallet;

@Controller
public class CouponController {
	
	@PostConstruct
	public void init() {
		System.out.println("시스템 호출");
		System.out.println(new Date());
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		Wallet myWallet = new Wallet();
		Wallet coinbase = new Wallet();
		Main.userWallets.put("admin", coinbase);
		Main.userWallets.put("idid", myWallet);
		
		Transaction genesisTransaction = new Transaction(coinbase.publicKey, coinbase.publicKey, "genesisTransaction", null);
		genesisTransaction.generateSignature(coinbase.privateKey);
		genesisTransaction.transactionId="0";
		genesisTransaction.outputs.add(new TransactionOutput(genesisTransaction.reciepient, genesisTransaction.value, genesisTransaction.transactionId));
		//3. main save utxo
		Main.UTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));
		//4. genesis 생성
		Block genesisBlock = new Block("0");
		genesisBlock.addTransaction(genesisTransaction);
		Main.addBlock(genesisBlock);
		
		System.out.println("시스템 호출 끝");
	}
	
	@PreDestroy
	public void destroy() {
		System.out.println("시스템 종료");
	}
	
	@RequestMapping("/coupon")
	public String couponMain(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		ses.setAttribute("userid", "idid");
		//2. 제너시스 트랜잭션 생성
		if (ses.getAttribute("userGifts") == null) {
			Wallet coinbase = Main.userWallets.get("admin");
			Wallet myWallet = Main.userWallets.get(ses.getAttribute("userid"));
			
//			Block myblock = new Block(Main.blockChain.get(Main.blockChain.size()-1).hash);
//			myblock.addTransaction(coinbase.sendGift(myWallet.publicKey, "https://ddoshop-bucket.s3.ap-northeast-2.amazonaws.com/ykm.png"));
//			Main.addBlock(myblock);
			
			List<String> gifts = myWallet.getGifts();
			System.out.println("---------------myWallet gifts----------------------");
			for(String g : gifts) {
				System.out.println(g);
			}
			System.out.println("---------------myWallet gifts----------------------");
			ses.setAttribute("userGifts", gifts);
		}
		System.out.println("------------Main.UTXOs------------------");
		for(Map.Entry<String, TransactionOutput> s : Main.UTXOs.entrySet()) {
			System.out.println("map id : " + s.getKey().substring(0, 10) + "\trecipient : " + s.getValue().reciepient + "\t value : " + s.getValue().value);
		}
		System.out.println("------------Main.UTXOs------------------\n");
		
		System.out.println("------------Main.blockchain hash------------------");
		for(Block b : Main.blockChain) {
			System.out.println(b.hash);
		}
		System.out.println("------------Main.blockchain hash------------------\n");
		
		return "/coupon/coupon";
	}
	
	@RequestMapping("/coupon_create")
	public String couponCreate() {
		return "/coupon/coupon_create";
	}
	
	
	@RequestMapping("/coupon_owner")
	public String couponOwner(HttpServletRequest req) {
		int count = 0;
		int all = 0;
		Map<String, String> giftCount = new HashMap<>();
		for(TransactionOutput tx : Main.UTXOs.values()) {
			if (giftCount.containsKey(tx.value) || tx.value.equals("genesisTransaction")) continue;
			String value = tx.value;
			for (TransactionOutput tx2 : Main.UTXOs.values()) {
				if (value.equals(tx2.value)){
					all++;
					if (tx2.reciepient.equals(Main.userWallets.get("admin").publicKey)) {
						count++;
					}
				}
			}
			String res = Integer.toString(count) + " / " + Integer.toString(all);
			count = 0; all = 0;
			giftCount.put(value, res);
		}
		HttpSession ses = req.getSession();
		ses.setAttribute("giftCount", giftCount);
		return "/coupon/coupon_sOwner";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/coupon_create.do", produces ="application/json; charset=UTF-8", method = RequestMethod.POST)
	public String PublishGift(@RequestBody Map<String,String> map, HttpServletResponse response, HttpServletRequest req) throws Exception {
		HttpSession ses = req.getSession();	
		String gift = map.get("gift");
		String userid = map.get("userid");
		Wallet coinbase = Main.userWallets.get("admin");
		Wallet myWallet = Main.userWallets.get(ses.getAttribute("userid"));
		
		Block myblock = new Block(Main.blockChain.get(Main.blockChain.size()-1).hash);
		myblock.addTransaction(coinbase.sendGift(myWallet.publicKey, gift));
		Main.addBlock(myblock);
		
		List<String> gifts = myWallet.getGifts();
		System.out.println("--------------------------------");
		for(String g : gifts) {
			System.out.println(g);
		}
		System.out.println("--------------------------------");
		ses.setAttribute("userGifts", gifts);
		return gift + "\n" + userid;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/coupon_use.do", produces ="application/text; charset=UTF-8", method = RequestMethod.POST)
	public String UseGift(@RequestBody String img, HttpServletResponse response, HttpServletRequest req) throws Exception {
		HttpSession ses = req.getSession();
		String userid = (String) ses.getAttribute("userid");
		Wallet coinbase = Main.userWallets.get("admin");
		Wallet myWallet = Main.userWallets.get(userid);
		
		Block myblock = new Block(Main.blockChain.get(Main.blockChain.size()-1).hash);
		myblock.addTransaction(myWallet.sendUserGift(coinbase.publicKey, img));
		Main.addBlock(myblock);
		
		List<String> gifts = myWallet.getGifts();
		System.out.println("--------------------------------");
		for(String g : gifts) {
			System.out.println(g);
		}
		System.out.println("--------------------------------");
		ses.setAttribute("userGifts", gifts);
		return "success";
	}
}
