package com.control.connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connector {
	
	static Connection con = null;
	
	public static Connection getCon() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			/*
			String url = "jdbc:sqlserver://localhost:4853;databaseName=MyDB";
			String user = "Jframe";
			String pwd = "1234";
			con = DriverManager.getConnection(url);
			*/
			String url = "jdbc:oracle:thin:@localhost:1521:finalproject"; 
		    String id = "finalproject";
		    String pw = "1234";

			con = DriverManager.getConnection(url,id,pw);  
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		
		return con;
		
}


}
