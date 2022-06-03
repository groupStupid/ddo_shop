package com.team_stupid.service;

import com.team_stupid.domain.AccountVO;

public interface MailService {	
	public void sendMail(AccountVO accountVO) throws Exception;
	public void sendMail(String verificationCode, String email) throws Exception;
}
