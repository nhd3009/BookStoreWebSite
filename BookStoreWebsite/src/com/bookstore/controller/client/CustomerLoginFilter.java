package com.bookstore.controller.client;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class CustomerLoginFilter implements Filter {
	private static final String[] loginRequiredURLs = {
		"/profile", "/edit_profile", "update_profile", "/checkout", "place_order", "my_order", "my_order_detail"
	};

    public CustomerLoginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		if(path.startsWith("/admin/")) {
			chain.doFilter(request, response);
			return;
		}
		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;
		String requestURL = httpRequest.getRequestURL().toString();
		
		if(!loggedIn && isLoginRequired(requestURL)) {
			String query = httpRequest.getQueryString();
			String redirectURL = requestURL;
			if(query != null) {
				redirectURL = redirectURL.concat("?").concat(query);
			}
			session.setAttribute("redirectURL", requestURL);
			RequestDispatcher rd = request.getRequestDispatcher("client/login.jsp");
			rd.forward(httpRequest, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	private boolean isLoginRequired(String requestURL) {
		for(String URL : loginRequiredURLs) {
			if(requestURL.contains(URL)) {
				return true;
			}
		}
		return false;
	}
	
}
