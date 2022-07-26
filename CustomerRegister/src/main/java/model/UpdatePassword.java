package model;

import db.JdbcConnector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

public class UpdatePassword extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("login.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        String otp = (String) session.getAttribute("otp");
        String password = request.getParameter("password");
        String otp1 = request.getParameter("userOtp");
        String email = (String) session.getAttribute("email");
        System.out.println(otp);
        System.out.println(otp1);
        System.out.println(email);
        password = PasswordEncryptor.getEncrypt(password);
        if (otp.equals(otp1) )
        {
            try {
                Connection con = JdbcConnector.getConnection();
                Statement st = con.createStatement();
                String query = "Update userlogin set password=\""+password+"\" where partyId in (SELECT partyId from party where email=\""+email+"\");";
                st.executeUpdate(query);
                System.out.println("Updated !");
                response.sendRedirect("passwordUpdated.html");
            }catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            response.sendRedirect("updationError.html");
        }

    }
}
