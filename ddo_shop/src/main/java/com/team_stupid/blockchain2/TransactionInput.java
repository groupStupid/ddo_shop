package com.team_stupid.blockchain2;

// 트랜잭션 입력
public class TransactionInput {
	public String transactionOutputId; // TransactionOutputs -> transactionId
	public TransactionOutput UTXO; //Unspent transaction output
	
	public TransactionInput(String transactionOutputId) {
		this.transactionOutputId = transactionOutputId;
	}
}
