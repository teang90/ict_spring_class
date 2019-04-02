package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
	
	Connection conn;
	
	public  Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "nohsam";
			String password = "1111";
			conn = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
		}
		return conn;
	}
}
