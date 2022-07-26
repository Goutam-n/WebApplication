package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dto.CustomerDto;
import model.PasswordEncryptor;
import model.RegistrationAuthenticator;

/**
 * Servlet implementation class RegistrationChecker
 */
//@WebServlet("/RegistrationChecker")
public class RegistrationChecker extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.sendRedirect("login.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String firstname = request.getParameter("firstName");
		String lastname  = request.getParameter("lastName");
		String email     = request.getParameter("email");
		String address   = request.getParameter("address");
		String city      = request.getParameter("city");
		String zipcode   = request.getParameter("zipcode");
		String state     = request.getParameter("state");
		String country   = request.getParameter("country");
		String phone     = request.getParameter("phone");
		String username  = request.getParameter("username");
		String password  = request.getParameter("password");
		CustomerDto user = new CustomerDto();

		PasswordEncryptor.encrypt(password, user);
		System.out.println("Gathered all data from Register Form ");

		user.setFirstName(firstname);
		user.setLastName(lastname);
		user.setEmail(email);
		user.setAddress(address);
		user.setCity(city);
		user.setZipcode(zipcode);
		user.setState(state);
		user.setCountry(country);
		user.setPhone(phone);
		user.setUsername(username);


		RegistrationAuthenticator authenticator = new RegistrationAuthenticator();
		boolean login = authenticator.isRegister(user);
		
		if(login)
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("username",username);
			response.sendRedirect("successfulRegistration.html");
			SendEmail send = new SendEmail();
			send.send(email,firstname);
		}
		else
			response.sendRedirect("/registrationError.html");
			
	}

}
