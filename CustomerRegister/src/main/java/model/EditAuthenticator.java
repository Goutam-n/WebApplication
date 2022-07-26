package model;

import db.JdbcConnector;
import dto.CustomerDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditAuthenticator
{
    public boolean isEdited(CustomerDto user)
    {
        System.out.println("Method called !");
        String firstname = user.getFirstName();
        String lastname = user.getLastName();
        String address = user.getAddress();
        String city = user.getCity();
        String zipcode = user.getZipcode();
        String state = user.getState();
        String country = user.getCountry();
        String phone = user.getPhone();
        String id = user.getPartyId();

        String[] values = new String[8];

        values[0] = firstname;
        values[1] = lastname;
        values[2] = address;
        values[3] = city;
        values[4] = zipcode;
        values[5] = state;
        values[6] = country;
        values[7] = phone;

        String[] sqlcolumns = {"firstName","lastName","address","city","zip","state","country","phoneNo"};

        try {
            Connection con = JdbcConnector.getConnection();

            for(int i=0;i<8;i++) {
                if(values[i].length()>0) {
                    String query = "UPDATE party SET "+sqlcolumns[i]+"=\""+values[i]+"\" WHERE partyId=\""+id+"\"";
                    PreparedStatement st = con.prepareStatement(query);
                    st.executeUpdate(query);
                    st.close();
                }
            }

            System.out.println("Edited Successfully");

            return true;

        } catch (SQLException e) {

            System.out.println(e);
        }
        return false;
    }
}
