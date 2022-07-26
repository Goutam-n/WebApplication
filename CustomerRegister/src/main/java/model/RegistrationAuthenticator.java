package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import db.JdbcConnector;
import dto.CustomerDto;

public class RegistrationAuthenticator
{
	public boolean isRegister(CustomerDto user)
	{
		String firstname = user.getFirstName();
		String lastname  = user.getLastName();
		String email     = user.getEmail();
		String address   = user.getAddress();
		String city      = user.getCity();
		String zipcode   = user.getZipcode();
		String state     = user.getState();
		String country   = user.getCountry();
		String phone     = user.getPhone();
		String username  = user.getUsername();
		String password  = user.getPassword();

		try
		{
			Connection con = JdbcConnector.getConnection();
			String query = "insert into party(partyId,firstName,lastName,email,address,city,zip,state,country,phoneNO) values (?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement st1 = con.prepareStatement(query);

			String id = PartyIdGenerator.getPartyId();

			st1.setString(1,id);
			st1.setString(2,firstname);
			st1.setString(3,lastname);
			st1.setString(4,email);
			st1.setString(5,address);
			st1.setString(6,city);
			st1.setString(7,zipcode);
			st1.setString(8,state);
			st1.setString(9,country);
			st1.setString(10,phone);

			PreparedStatement st2 = con.prepareStatement("insert into userLogin(userLoginId,password,partyId) values (?,?,?)");

			st2.setString(1,username);
			st2.setString(2,password);
			st2.setString(3,id);

			st2.executeUpdate();
			st1.executeUpdate();
			System.out.println("Data Inserted into Database .");
			st1.close();
			return true;
			
		}
		catch (SQLException e)
		{
			
			System.out.println(e);
		}
		return false;
		
	}
}