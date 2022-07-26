package dao;

import db.JdbcConnector;
import dto.CustomerDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao
{

    public List<CustomerDto> getAllUserData()
    {
        List<CustomerDto> listOfUsers = new ArrayList<CustomerDto>();
        try
        {
            Statement st = JdbcConnector.getStatement();
            String query = "SELECT partyId,firstName,lastName,address,city,zip,state,country,phoneNo FROM party;";
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                CustomerDto user = new CustomerDto();
                user.setPartyId(rs.getString(1));
                user.setFirstName(rs.getString(2));
                user.setLastName(rs.getString(3));
                user.setAddress(rs.getString(4));
                user.setCity(rs.getString(5));
                user.setZipcode(rs.getString(6));
                user.setState(rs.getString(7));
                user.setCountry(rs.getString(8));
                user.setPhone(rs.getString(9));
                listOfUsers.add(user);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return listOfUsers;
    }
}
