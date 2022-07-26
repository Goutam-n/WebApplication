package model;

import db.JdbcConnector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PartyIdGenerator {
    public static String getPartyId() {
        try {
            Connection con = JdbcConnector.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM party;");
            while (rs.next()) {
                if (rs.isLast()) {
                    int count = rs.getInt(1) + 1;
                    String partyId = Integer.toString(count);
                    return partyId;
                }
                rs.next();
                int count = 1000 + rs.getInt(1);
                String partyId = Integer.toString(count);
                return partyId;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}