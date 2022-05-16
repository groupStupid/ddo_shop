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
		String subject = "또샵 임시 비밀번호 입니다.";
		String content = "";
		content += "<div align='center' style='border:1px solid black; font-family:verdana'>"
				+ "<h3 style='color: blue;'>"
				+ accountVO.getUserId() + "님의 임시 비밀번호 입니다.</h3>"
				+ "<p>임시 비밀번호 : "
				+ accountVO.getUserPw() + "</p></div>";
		String from = "또샵 <noreply.Bunri@gmail.com>"; // 메일에서 오류 생기면 여기서 또샵 앞에 분리똑똑으로 바꾸기
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
			System.out.println("메일 전송 오류 sendMail() : " + e);
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
