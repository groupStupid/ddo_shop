package com.team_stupid.blockchain2;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.Map;

public class Transaction {
	public String transactionId;
	public PublicKey sender;
	public PublicKey reciepient;
	public String value;
	public String shopSerialNum;
	public byte[] signature;
	
	public ArrayList<TransactionInput> inputs = new ArrayList<>();
	public ArrayList<TransactionOutput> outputs = new ArrayList<>();
	
	public static int sequence =0;
	
	public Transaction(PublicKey from, PublicKey to, String value, ArrayList<TransactionInput> inputs) {
		this.sender = from;
		this.reciepient = to;
		this.value = value;
		this.inputs = inputs;
	}
	
	
	public Transaction(PublicKey from, PublicKey to, String value, String shopSerialNum, ArrayList<TransactionInput> inputs) {
		this.sender = from;
		this.reciepient = to;
		this.value = value;
		this.shopSerialNum = shopSerialNum;
		this.inputs = inputs;
	}
	
	public boolean processTransaction() {
		System.out.println("\nprocessTransaction in");
		System.out.println("processTransaction : value : " + value);
		//1.verifySignature()
		if(verifySignature()==false) {
			return false;
		}
		//2. 메인함수에 임시 저장된 txoutId로 UTXO(사용되지 않은게 맞냐? 확인)
		for(TransactionInput i :inputs) {
			i.UTXO = Main.UTXOs.get(i.transactionOutputId); // inputs의 요소의 UTXO는 txOutput -> Main.UTXOs에서 id에 해당하는 Output을 inputs의 요소에 삽입
		}
		//3. 최소단위 0.1f 를 넘는지 체크
//		if(getInputValue() < Main.minimumTransaction) {
//			return false;
//		}
		
		//4. TxOutput 100 value: 40,60
//		float leftOver = getInputValue()-value;
//		
//		transactionId = calculateHash();
//		//40코인 송신
//		outputs.add(new TransactionOutput(this.reciepient, value, transactionId));
//		//나머지 60
//		outputs.add(new TransactionOutput(this.sender, leftOver, transactionId));
		
		transactionId = calculateHash();
		
		outputs.add(new TransactionOutput(this.reciepient, value, shopSerialNum, transactionId));
		//5. output to Unspent list
		for(TransactionOutput o : outputs) {
			Main.UTXOs.put(o.id, o);
		}
		
		// 6. remove Txinput
		for(TransactionInput i : inputs) {
			if(i.UTXO == null)continue;
			System.out.println("-----------------------------------------------------------------------");
			System.out.println("remove Main.UTXOs TransactionInput i.UTXO.id : " + i.UTXO.id + "\ti.UTXO.value : " + i.UTXO.value);
			for(Map.Entry<String, TransactionOutput> map : Main.UTXOs.entrySet()) {
				System.out.println("map id : " + map.getKey() + "\tmap value : " + map.getValue().value);
			}
			System.out.println("-----------------------Main.UTXOs.remove---------------------------------");
			Main.UTXOs.remove(i.UTXO.id);
			for(Map.Entry<String, TransactionOutput> map : Main.UTXOs.entrySet()) {
				System.out.println("map id : " + map.getKey() + "\tmap value : " + map.getValue().value);
			}
			System.out.println("-----------------------------------------------------------------------");
		}
		return true;
	}
	
	public String calculateHash() {
		sequence++;
		return BlockUtil.applySha256(BlockUtil.getStringFromKey(sender)+ 
				BlockUtil.getStringFromKey(reciepient)+
				value+sequence);
	}
	
	// inputs에 들어있는 TransactionOutput의 value를 모두 더함
//	public float getInputValue() {
//		float total=0;
//		for(TransactionInput i : inputs) {
//			if(i.UTXO == null) continue;
//			total += i.UTXO.value;
//		}
//		return total;
//	}
	
	public boolean verifySignature() {
		String data = BlockUtil.getStringFromKey(sender)+BlockUtil.getStringFromKey(reciepient)+value;
		return BlockUtil.verifyECDSASig(sender, data, signature);
	}
	public void generateSignature(PrivateKey privateKey) {
		String data = BlockUtil.getStringFromKey(sender)+BlockUtil.getStringFromKey(reciepient)+value;
		signature = BlockUtil.applyECDSASig(privateKey, data);
		
	}

}
