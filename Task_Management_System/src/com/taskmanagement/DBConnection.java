package com.taskmanagement;

import java.io.FileInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;


import com.sun.xml.internal.fastinfoset.sax.Properties;

public class DBConnection {
	static Connection conn = null;
	//Statement stmt = null;
	//ResultSet rs  = null;
	
	public static Connection getConnection()
	{

		try
		{
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost/taskmanangement","root","root");
			//stmt = conn.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return conn;
		
	}
	

}
