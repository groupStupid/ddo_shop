package com.team_stupid.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.team_stupid.mapper.AccountMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CustomUserDetailsService  implements UserDetailsService{
	
	@Autowired
	private AccountMapper accountMapper;
	
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("CustomUserDetailsService : loadUserByUsername()");
		return accountMapper.loadUserByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("아이디가 존재하지 않습니다."));
	}
}
