package com.team_stupid.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import com.team_stupid.mapper.AccountMapper;

@Service
public class CustomSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	@Autowired
	private AccountMapper accountMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String userid = authentication.getName();
		System.out.println("CustomSuccessHandler.getName : " + userid);
		HttpSession session = request.getSession();
		session.setAttribute("userID", userid);
		session.setAttribute("userIP", request.getRemoteAddr());
		session.setAttribute("userNick", accountMapper.getNicknameById(userid));
		CustomUserDetails user = (CustomUserDetails) customUserDetailsService.loadUserByUsername(authentication.getName());
//		user.setPassword(null);
		SecurityContextHolder.getContext().setAuthentication(authentication);
		Object destination = session.getAttribute("destination");
		System.out.println(destination);
		Object URL = session.getAttribute("URL");
		response.sendRedirect((destination != null)?(String)destination : "/mainRestaurant");
	}
}