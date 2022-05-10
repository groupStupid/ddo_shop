package com.team_stupid.service;

import com.team_stupid.domain.AccountVO;

public interface MemberService {	
	public void sendMail(AccountVO accountVO) throws Exception;
}
