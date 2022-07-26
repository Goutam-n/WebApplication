package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import db.JdbcConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/fetch")
public class FetchData extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("login.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");

        try
        {
            Connection con = JdbcConnector.getConnection();
            System.out.println("Connected to the database");

            ArrayList al = null;
            ArrayList userList =new ArrayList();

            String query =  "SELECT partyId,firstName,lastName,address,city,zip,state,country,phoneNo FROM party WHERE firstName='"+firstName+"' AND lastName='"+lastName+"'";
            System.out.println("query " + query);

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next())
            {
                al = new ArrayList<>();

                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));
                al.add(rs.getString(8));
                al.add(rs.getString(9));
                System.out.println("al :: "+al);
                userList.add(al);

            }
            request.setAttribute("userList",userList);
            System.out.println("userList " + userList);

            String nextJSP = "/viewSearch.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
            dispatcher.forward(request,response);
            System.out.println("Disconnected from database");

            rs.close();
            st.close();
            out.close();

        } catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
