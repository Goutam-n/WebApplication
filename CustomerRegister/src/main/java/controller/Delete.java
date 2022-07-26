package controller;
import db.JdbcConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/delete")
public class Delete extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id");
            Connection con = JdbcConnector.getConnection();
            String query = "DELETE FROM party WHERE partyId = \""+id+"\"";
            String query1 = "DELETE FROM userLogin WHERE partyId = \""+id+"\"";
            PreparedStatement stmt = con.prepareStatement(query);
            PreparedStatement stmt1 = con.prepareStatement(query1);
            stmt.executeUpdate();
            stmt1.executeUpdate();
            response.sendRedirect("viewSearch.jsp");
            stmt.close();
            stmt1.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
