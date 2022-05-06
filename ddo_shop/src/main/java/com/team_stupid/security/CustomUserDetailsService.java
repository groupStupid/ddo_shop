package com.team_stupid.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.team_stupid.mapper.CustomerMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CustomUserDetailsService  implements UserDetailsService{
	
	@Autowired
	private CustomerMapper customerMapper;
	
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("CustomUserDetailsService : loadUserByUsername()");
		return customerMapper.loadUserByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("아이디가 존재하지 않습니다."));
	}
}
