package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcConnector
{
	static Connection con = null;
	static Statement st = null;
	

		public static void startConnecion()	{
			System.out.println("Jdbc Connection Started");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","Gniwal0406@");
			System.out.println("Connected");

			st = con.createStatement();
		}
		catch (ClassNotFoundException e)
		{
			System.out.println(e);
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}

	public static Statement getStatement()
	{
		JdbcConnector.startConnecion();
		return st;
	}
	public static Connection getConnection()
	{
		JdbcConnector.startConnecion();
		return con;
	}
	
}