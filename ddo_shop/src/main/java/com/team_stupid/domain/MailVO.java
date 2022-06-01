package com.team_stupid.domain;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;

@Service
public class MailVO {
	private String userid;
	private String email;
	private String verifyCode;
}
