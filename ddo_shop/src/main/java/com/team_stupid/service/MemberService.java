package com.team_stupid.service;

import com.team_stupid.security.UserDetailsDTO;

public interface MemberService {	
	public void sendMail(UserDetailsDTO userDetailsDTO) throws Exception;
}
