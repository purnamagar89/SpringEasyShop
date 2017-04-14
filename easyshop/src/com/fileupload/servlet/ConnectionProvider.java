package com.fileupload.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	public Connection getConnection() {

		final String USER = "root";
		final String PASS = "root";

		Connection connection = null;

		String connectionURL = "jdbc:mysql://localhost:3306/easyshop";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				connection = DriverManager.getConnection(connectionURL, USER, PASS);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

}
