package com.team_stupid.blockchain2;
import java.security.*;
import java.security.spec.ECGenParameterSpec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Wallet {
	
	public PrivateKey privateKey;
	public PublicKey publicKey;
	
	// 지갑의 UTXO 저장소
	// -> 거래내역 저장소 -> 원래는 코인의 거래내역으로 가지고 있는 모든 코인을 알 수 있었다면
	// 우리 프로젝트내에선 상품권 이미지가 저장된 이미지 저장소로 상품권 내역을 알 수 있다.
	public HashMap<String,TransactionOutput> UTXO_Wallet = new HashMap<String,TransactionOutput>();
	
	public Wallet() {
		generateKeyPair();
	}
	
	public List<String> getGifts(){ 
		List<String> gifts = new ArrayList<String>(); // String : value, String : shopSerialNum
		for (Map.Entry<String, TransactionOutput> item : Main.UTXOs.entrySet()) {
			TransactionOutput UTXO = item.getValue();
			if (UTXO.isMine(publicKey)){
				UTXO_Wallet.put(UTXO.id, UTXO);
				gifts.add(UTXO.value+"^"+UTXO.shopSerialNum);
			}
		}
		return gifts;
	}
	// 송신기능
	public Transaction sendGift(PublicKey _recipient, String value, String shopSerialNum) {
		ArrayList<TransactionInput> inputs = new ArrayList<TransactionInput>();
//		TransactionInput input;
		
//		float total = 0;
		for (Map.Entry<String, TransactionOutput> item: UTXO_Wallet.entrySet()){
			TransactionOutput UTXO = item.getValue(); // 현재 지갑의 TransactionOutput 저장소에서 하나씩 빼내 UTXO에 저장
//			total += UTXO.value; // total에 하나씩 뺀 transactionOutput의 value를 저장
//			if (UTXO.value.equals(value)) {
//				input = new TransactionInput(UTXO.id); // inputs에다가 빼낸 output의 id를 input에 저장
//				break;
//			}
//			if(total > value) break; // total이 value 보다 클 때 즉 다른 사람에게 보낼 value만큼 지갑에서 코인을 빼냄
		}
		
		Transaction newTransaction = new Transaction(publicKey, _recipient , value, shopSerialNum, inputs);
		newTransaction.generateSignature(privateKey);
		
		for(TransactionInput input: inputs){
			UTXO_Wallet.remove(input.transactionOutputId); // 다른 사람에게 코인을 전송하기 위해서 지갑에서 빼낸 코인들을 지갑에서 삭제
			// 우리 프로젝트의 경우 상품권을 사용해서 서버에 다시 보낼 때 사용항 상품권의 UTXO를 삭제해야겠지?
		}
		
		return newTransaction;
	}
	
	public Transaction sendUserGift(PublicKey _recipient,String value ) {
		ArrayList<TransactionInput> inputs = new ArrayList<TransactionInput>();
//		TransactionInput input;
		
//		float total = 0;
		for (Map.Entry<String, TransactionOutput> item: UTXO_Wallet.entrySet()){
			TransactionOutput UTXO = item.getValue(); // 현재 지갑의 TransactionOutput 저장소에서 하나씩 빼내 UTXO에 저장
//			total += UTXO.value; // total에 하나씩 뺀 transactionOutput의 value를 저장
			if (UTXO.value.equals(value)) {
				inputs.add(new TransactionInput(UTXO.id)); // inputs에다가 빼낸 output의 id를 input에 저장
				break;
			}
//			if(total > value) break; // total이 value 보다 클 때 즉 다른 사람에게 보낼 value만큼 지갑에서 코인을 빼냄
		}
		
		Transaction newTransaction = new Transaction(publicKey, _recipient , value, inputs);
		newTransaction.generateSignature(privateKey);
		
		for(TransactionInput input: inputs){
			UTXO_Wallet.remove(input.transactionOutputId); // 다른 사람에게 코인을 전송하기 위해서 지갑에서 빼낸 코인들을 지갑에서 삭제
			// 우리 프로젝트의 경우 상품권을 사용해서 서버에 다시 보낼 때 사용항 상품권의 UTXO를 삭제해야겠지?
		}
		
		return newTransaction;
	}
	
	public void generateKeyPair() {
		try {
			KeyPairGenerator keyGen = KeyPairGenerator.getInstance("ECDSA","BC");
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			ECGenParameterSpec ecSpec = new ECGenParameterSpec("prime192v1");
	
			keyGen.initialize(ecSpec, random); 
	        KeyPair keyPair = keyGen.generateKeyPair();
	
	        privateKey = keyPair.getPrivate();
	        publicKey = keyPair.getPublic();
	        
		}catch(Exception e) {
			throw new RuntimeException(e);
		}
	}
}