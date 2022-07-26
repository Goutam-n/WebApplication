package controller;

import dto.CustomerDto;
import model.GenerateOTP;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ForgotPassword extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("login.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email     = request.getParameter("email");
        String otp = GenerateOTP.generateOTP();
        SendEmail.sendOTP(email,otp);
        HttpSession session = request.getSession(true);
        session.setAttribute("email",email);
        session.setAttribute("otp",otp);
        response.sendRedirect("forgotPassword.jsp");
    }
}
