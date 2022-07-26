package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.JdbcConnector;
import dto.CustomerDto;


public class LoginAuthenticator {
    public boolean isLogin(CustomerDto user) {
        String username = user.getUsername();
        String password = user.getPassword();

        String tablePassword = "";

        try {
            JdbcConnector.startConnecion();
            Statement st = JdbcConnector.getStatement();
            String query = "SELECT password FROM userlogin WHERE userLoginId = \"" + username + "\"";
            System.out.println("Query = " + query);

            ResultSet rs = st.executeQuery(query);

            if (rs.next())
                tablePassword = rs.getString(1);
        } catch (SQLException e) {
            System.out.println(e);
        }

        if (username != null && password != null && !username.trim().equals("") && password.equals(tablePassword)) {
            return true;
        }

        return false;
    }
}