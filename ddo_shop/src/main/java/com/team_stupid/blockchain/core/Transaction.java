package com.team_stupid.blockchain.core;

import com.team_stupid.blockchain.util.StringUtil;

public class Transaction {
	
	private String sender = "admin";	// �����ڴ� ������ admin
	private String receiver;			// �����ڴ� ��ǰ�� ���� ������� id
	private String value;				// ��ǰ�� �̹����� ����� ��� ex) "https://ddoshop-bucket.s3.ap-northeast-2.amazonaws.com/ykm.png"
	private String data;				// block�� ����� �����͸� �� ���� sentence�� ���� -> �����ڿ��� ����
	
	public Transaction() { // �ʱ� �� ������ ���� ���� ������
		receiver = "";
		value = "";
		data = "";
	}
	
	public Transaction(String receiver, String value) { // �ű� �� ������ �� �ʿ��� ������
		this.receiver = receiver;
		this.value = value;
		data = sender + " to " + receiver + " by " + value;
	}
	
	public String getData() {
		// �� �ٷ� ������ transaction ������ ��ȯ
		return data;
	}
	public String getValue() {
		// block�� ����Ǵ� �̹��� ��θ� ��ȯ
		return value;
	}
	@Override
	public String toString() {
		// Transaction ��ü�� toString ��ü�� Override�Ͽ� Hashȭ �� transaction ������ ��ȯ -> block�� hash���� �� �����ϰ� ����� ����
		return StringUtil.applySha256(data);
	}
}