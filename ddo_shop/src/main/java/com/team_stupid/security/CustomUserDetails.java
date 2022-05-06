package com.team_stupid.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Service
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class CustomUserDetails implements UserDetails{
	private static final long serialVersionUID = 1L;
	
	private String ACC_USERID;
	private String ACC_USERPW;
	
	private Collection<? extends GrantedAuthority> authorities;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		System.out.println("CustomUserDetails : getAuthorities");
		return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return ACC_USERID;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return ACC_USERPW;
	}

}
