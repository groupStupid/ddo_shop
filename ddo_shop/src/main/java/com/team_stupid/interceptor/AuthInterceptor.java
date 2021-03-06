package com.team_stupid.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	public void saveDestination(HttpServletRequest req) {
		System.out.println(" authInterceptor saveDestination request");
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		System.out.println("uri : " + uri);
		System.out.println("query : " + query);
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?"+query;
		}
		if (req.getMethod().equals("GET")) {
			System.out.println("destination : " + (uri+query));
			req.getSession().setAttribute("destination", uri+query);
		}
	}
	

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		System.out.println(" authInterceptor preHandler");
		HttpSession ses = req.getSession();
		if (ses.getAttribute("userID") == null) {
			System.out.println(" authInterceptor preHandler : userID is null");
			System.out.println(req.getRequestURI());
			saveDestination(req);
			res.sendRedirect("/errorlogin");
			return false;
		}
		return true;
	}

}
