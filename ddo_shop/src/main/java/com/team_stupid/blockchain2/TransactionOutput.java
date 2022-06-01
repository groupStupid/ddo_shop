package com.team_stupid.blockchain2;

import java.security.PublicKey;

// 트랜잭션 출력
public class TransactionOutput {
	public String id;
	public PublicKey reciepient; //받는사람
	public String value; //금액
	public String parentTransactionId; 
	
	//생성자
	public TransactionOutput(PublicKey reciepient, String value, String parentTransactionId) {
		this.reciepient = reciepient;
		this.value = value;
		this.parentTransactionId = parentTransactionId;
		this.id = BlockUtil.applySha256(BlockUtil.getStringFromKey(reciepient)+value+parentTransactionId);
	}
	
	//받는 사람 주소가 == 그 사람의 계좌주소가 같다면 동일인
	public boolean isMine(PublicKey publicKey) {
		return (publicKey == reciepient);
	}
	
	public String getValue() {
		return value;
	}
}
