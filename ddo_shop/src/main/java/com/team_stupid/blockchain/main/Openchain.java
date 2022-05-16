package com.team_stupid.blockchain.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team_stupid.blockchain.core.Block;
import com.team_stupid.blockchain.core.Wallet;

/**
 * 블럭체인의 간단한 구현으로 이해를 돕기 위해 목적으로 구성하고 있습니다.
 * 
 * @author comnic
 *
 */
@Service
public class Openchain /* extends JFrame */{

	//blockchain ArrayList
	private List<Block> blockchain = new ArrayList<Block>();
	
	//difficulty - 숫자가 클수록 어렵다. target생성 규칙상.
	//3이상은 좀 오래걸리는 듯 합니다. 초기에 3으로 하시고 숫자를 조절해 보시면 이해가 되실듯 합니다.^^
	private static int difficulty = 3;
	private static float minimumTransaction = 0.1f;
	
	private static Wallet walletA;
	private static Wallet walletB;
	
//	public Openchain(Image image) throws Exception {
//		setTitle("hi");
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//		//Icon icon = (Icon)image;
//		URL imageUrl = new URL("https://ddoshop-bucket.s3.ap-northeast-2.amazonaws.com/ykm.png");
//		//JLabel label = new JLabel(new ImageIcon(ImageIO.read(imageUrl)));
//		JLabel label = new JLabel(new ImageIcon(image));
//		getContentPane().add(label, BorderLayout.CENTER);
//		setSize(300, 300);
//		setVisible(true);
//	}

	/**
	 * main
	 * @param arg
	 * @throws Exception 
	 */
//	public static void main(String[] arg) throws Exception{
	public void StartChain() throws Exception{

//		Setup Bouncey castle as a Security Provider
//		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider()); 
//		
//		//Create the new wallets
//		walletA = new Wallet();
//		walletB = new Wallet();
//
//		walletA.generateKeyPair();
//		walletB.generateKeyPair();
//		
//		Test public and private keys
//		System.out.println("Private and public keys:");
//		System.out.println(StringUtil.getStringFromKey(walletA.privateKey) + "\n");
//		System.out.println(StringUtil.getStringFromKey(walletA.publicKey));
//		
//		//?��?��?���? ?��?�� Transaction?��?��(WalletA -> walletB : 100)  
//		Transaction transaction = new Transaction(walletA.publicKey, walletB.publicKey, 100, null);
//		//?��?��?�� Transaction?�� ?��명합?��?��.
//		transaction.generateSignature(walletA.privateKey);
//		
//		//?��명한 Transaction?�� �?증합?��?��.
//		System.out.println("Is this Transaction Verify? " + transaction.verifiySignature());
//		
//		
//		초기 블럭?�� 만듭?��?��.
//		blockchain.add(new Block("Genesis block", "0"));
//		System.out.println("\nTrying to Mine Genesis block!");
//		blockchain.get(0).mineBlock(difficulty);
		
//		blockchain.add(new Block(null, "0"));
		System.out.println("\nTrying to Mine Genesis block!");
		blockchain.get(0).mineBlock(difficulty);
		
		//?��?�� 블럭?�� ?��?��?��?��?��.
//		for(int i = 1 ; i <= 3 ; i++){
//			blockchain.add(new Block("block data ?��?��?��", blockchain.get(blockchain.size()-1).hash));
//			System.out.printf("\nTrying to Mine block #%d", i+1 );
//			blockchain.get(i).mineBlock(difficulty);
//		}
		
		// 외부 사진을 Image로 가져오는 것 = URL -> 생성자 가보면 있음.
//		ImageIcon icon1 = new ImageIcon("images/cat1.png");
//		blockchain.add(new Block(icon1.getImage(), blockchain.get(blockchain.size()-1). getHash()));
//		System.out.println("\n" + blockchain.get(1).getDataImage().toString());
//		System.out.println("Trying to Mine block #2");
//		blockchain.get(1).mineBlock(difficulty);
//		
//		ImageIcon icon2 = new ImageIcon("images/cat2.png");
//		blockchain.add(new Block(icon2.getImage(), blockchain.get(blockchain.size()-1).getHash()));
//		System.out.println("\n" + blockchain.get(2).getDataImage().toString());
//		System.out.println("Trying to Mine block #3");
//		blockchain.get(2).mineBlock(difficulty);
//		
//		ImageIcon icon3 = new ImageIcon("images/cat3.png");
//		blockchain.add(new Block(icon3.getImage(), blockchain.get(blockchain.size()-1).getHash()));
//		System.out.println("\n" + blockchain.get(3).getDataImage().toString());
//		System.out.println("Trying to Mine block #4");
//		blockchain.get(3).mineBlock(difficulty);
//		
//		ImageIcon icon4 = new ImageIcon("images/cat4.png");
//		blockchain.add(new Block(icon4.getImage(), blockchain.get(blockchain.size()-1).getHash()));
//		System.out.println("\n" + blockchain.get(4).getDataImage().toString());
//		System.out.println("Trying to Mine block #5");
//		blockchain.get(4).mineBlock(difficulty);
		
		// 전체 blockchain이 정상인지 체크합니다.
		System.out.println("\nBlockchain is Valid : " + isChainValid());
		
		// 전체 블럭을 출력합니다.
//		String blockchainJson = new GsonBuilder().setPrettyPrinting().create().toJson(blockchain);
		System.out.println("\nOpenchain Block list : ");
//		System.out.println(blockchainJson);
		for (int i = 0; i < blockchain.size(); i++) {
			System.out.println("**************************");
			blockchain.get(i).getInfomation();
			System.out.println("**************************");
		}
		
		//new Openchain(icon1.getImage());
		//new Openchain(blockchain.get(1));
		//new Openchain(blockchain.get(2).getDataImage());
	}
	
	/**
	 * blockchain이 유효한지 체크합니다.
	 *  - 현재 블럭의 hash가 유효한 값인지 체크한다.
	 *  - 이전 블럭의 hash값과 동일한지 체크한다.
	 * @return
	 */
	public Boolean isChainValid() {
		Block currentBlock; 
		Block previousBlock;

		// 전체 블럭을 체크합니다.
		for(int i=1; i < blockchain.size(); i++) {
			currentBlock = blockchain.get(i);
			previousBlock = blockchain.get(i-1);
			
			// 현재 블럭의 hash가 맞는지 체크합니다.
			if(!currentBlock.getHash().equals(currentBlock.calculateHash()) ){
				System.out.println("Current Hashes not equal");			
				return false;
			}
			
			// 이전 블럭의 hash값과 동일한지 체크합니다.
			if(!previousBlock.getHash().equals(currentBlock.getPreviousHash()) ) {
				System.out.println("Previous Hashes not equal");
				return false;
			}
		}
		return true;
	}

	
	
	public List<Block> getBlockchain() {
		return blockchain;
	}

	public void setBlockchain(List<Block> blockchain) {
		this.blockchain = blockchain;
	}

	public static float getMinimumTransaction() {
		return minimumTransaction;
	}

	public static void setMinimumTransaction(float minimumTransaction) {
		Openchain.minimumTransaction = minimumTransaction;
	}
}
