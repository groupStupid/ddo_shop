package com.team_stupid.blockchain.core;

import java.util.Date;

import com.team_stupid.blockchain.util.StringUtil;

public class Block {

	private String hash;				/* 해시값 */
	private String previousHash;		/* 이전 블럭의 해시값 */
	private Transaction transaction;	/* 전송자, 수신자, 데이터가 저장된 트랜잭션 객체 */
	private long timestamp; 			/* timestamp */
	private int nonce;					/* 해시값 생성에 쓰일 임시 정수 */
	
	/**
	 * 새로운 블럭을 생성합니다.
	 * 
	 * @param data
	 * @param previousHash
	 */
	public Block(String previousHash, Transaction transaction) {
		this.previousHash = previousHash;
		this.transaction = transaction;
		this.timestamp = new Date().getTime();
		this.hash = calculateHash();	//생성시 먼저 hash 값을 하나 만들어 넣어둡니다.
	}	
	
	/**
	 * 새로운 해시값을 생성합니다.
	 * @return
	 */
	public String calculateHash() {
		String calculatedhash = StringUtil.applySha256( 
				previousHash +
				Integer.toString(nonce) +
				transaction + 
				Long.toString(timestamp)
				);
		return calculatedhash;
	}
	
	public void getInfomation() {
		System.out.println("previousHash : " + previousHash);
		System.out.println("nonce : " + nonce);
		System.out.println("hash : " + hash);
		System.out.println("transaction : " + transaction.getData());
		System.out.println("timestamp : " + timestamp);
	}
	
	/**
	 * 채굴합니다.
	 * 
	 * @param difficulty
	 */
	public void mineBlock(int difficulty) {
		//간단한 테스트와 이해를 돕기위해 target을 difficulty 숫자 만큼 앞에 0으로 채웁니다.
		String target = new String(new char[difficulty]).replace('\0', '0'); // difficulty만큼의 크기로 String형을 만드는데 공백을 0으로 치환해라
		
		//생성된 hash가 target과 동일하면 채굴 성공입니다.
		//ex) difficulty가 3이면 target은 000이 되고, 생성된 hash가 000으로 시작하는 값이면 채굴 성공입니다.
		//  채굴된 모든 hash가 000으로 시작하겠죠...ㅋㅋ
		while(!hash.substring( 0, difficulty).equals(target)) { // hash값이 0번째부터 difficulty-1 번째까지의 String이 target과 같지 않다면 반복
			nonce ++;
			hash = calculateHash(); // nonce가 계속 달라지니까 계속 새로운 hash값이 생김
			//System.out.printf("\nGEN Hash #%d : %s", nonce, hash);
		}
		System.out.println("#" + nonce + "  채굴 성공!!! : " + hash + "\n");
	}

	public String getHash() {
		// 현재 block의 hash값 반환
		return hash;
	}

	public String getPreviousHash() {
		// 이전 block의 hash값 반환
		return previousHash;
	}
	
	public Transaction getTransaction() {
		// 현재 block의 Transaction 객체 반환
		return transaction;
	}
}