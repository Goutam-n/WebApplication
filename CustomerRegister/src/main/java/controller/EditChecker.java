package controller;

import dto.CustomerDto;
import model.EditAuthenticator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditChecker extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("login.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String id = request.getParameter("id");
        String firstname = request.getParameter("firstName");
        String lastname  = request.getParameter("lastName");
        String address   = request.getParameter("address");
        String city      = request.getParameter("city");
        String zipcode   = request.getParameter("zipcode");
        String state     = request.getParameter("state");
        String country   = request.getParameter("country");
        String phone     = request.getParameter("phone");
        System.out.println("Collected data for editing ");

        CustomerDto user = new CustomerDto();
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setAddress(address);
        user.setCity(city);
        user.setZipcode(zipcode);
        user.setState(state);
        user.setCountry(country);
        user.setPhone(phone);
        user.setPartyId(id);

        EditAuthenticator authenticator = new EditAuthenticator();
        boolean login = authenticator.isEdited(user);

        if(login)
        {
            HttpSession session = request.getSession(true);
            response.sendRedirect("search.html");
        }
        else
            response.sendRedirect("/fetch");
    }
}
