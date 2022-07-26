package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CustomerDto;
import model.LoginAuthenticator;
import model.PasswordEncryptor;

/**
 * Servlet implementation class LoginChecker
 */
//@WebServlet("/LoginChecker")
public class LoginChecker extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.sendRedirect("login.html");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		CustomerDto user = new CustomerDto();

		PasswordEncryptor.encrypt(password, user);
		
		user.setUsername(username);
		
		LoginAuthenticator authenticator = new LoginAuthenticator();
		boolean login = authenticator.isLogin(user);
		
		if(login)
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("username",username);
			response.sendRedirect("home.jsp");
		}
		else
		{
			response.sendRedirect("loginError.html");
		}
	}
}
