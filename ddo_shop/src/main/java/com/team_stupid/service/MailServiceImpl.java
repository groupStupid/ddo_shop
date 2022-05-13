package com.team_stupid.service;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.AccountVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendMail(AccountVO accountVO) throws Exception {
		String subject = "�Ǽ� �ӽ� ��й�ȣ �Դϴ�.";
		String content = "";
		content += "<div align='center' style='border:1px solid black; font-family:verdana'>"
				+ "<h3 style='color: blue;'>"
				+ accountVO.getUserId() + "���� �ӽ� ��й�ȣ �Դϴ�.</h3>"
				+ "<p>�ӽ� ��й�ȣ : "
				+ accountVO.getUserPw() + "</p></div>";
		String from = "�Ǽ� <noreply.Bunri@gmail.com>"; // ���Ͽ��� ���� ����� ���⼭ �Ǽ� �տ� �и��ȶ����� �ٲٱ�
		String to = accountVO.getEmail();
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "utf-8");
			
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			
			mailSender.send(mail);
		} catch (Exception e) {
			System.out.println("���� ���� ���� sendMail() : " + e);
			e.printStackTrace();
		}
	}
	
//	@Override
//	public String getRecycle(String object) throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	@Override
//	public int Login(String id, String pw) throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//	@Override
//	public int Signup(String id, String pw) throws SQLException {
//		// TODO Auto-generated method stub
//		return 0;
//	}
}
