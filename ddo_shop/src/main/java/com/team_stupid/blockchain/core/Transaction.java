package com.team_stupid.blockchain.core;

import com.team_stupid.blockchain.util.StringUtil;

public class Transaction {
	
	private String sender = "admin";	// 전송자는 무조건 admin
	private String receiver;			// 수신자는 상품권 받을 사용자의 id
	private String value;				// 상품권 이미지가 저장된 경로 ex) "https://ddoshop-bucket.s3.ap-northeast-2.amazonaws.com/ykm.png"
	private String data;				// block에 저장될 데이터를 한 줄의 sentence로 정리 -> 생성자에서 설정
	
	public Transaction() { // 초기 블럭 생성할 때를 위한 생성자
		receiver = "";
		value = "";
		data = "";
	}
	
	public Transaction(String receiver, String value) { // 신규 블럭 생성할 때 필요한 생성자
		this.receiver = receiver;
		this.value = value;
		data = sender + " to " + receiver + " by " + value;
	}
	
	public String getData() {
		// 한 줄로 정리된 transaction 정보을 반환
		return data;
	}
	public String getValue() {
		// block에 저장되는 이미지 경로를 반환
		return value;
	}
	@Override
	public String toString() {
		// Transaction 객체의 toString 객체를 Override하여 Hash화 된 transaction 정보를 반환 -> block의 hash값을 더 복잡하게 만들기 위함
		return StringUtil.applySha256(data);
	}
}