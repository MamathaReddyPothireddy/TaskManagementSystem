package com.taskmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewTask
 */
@WebServlet("/AddNewTask")
public class AddNewTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddNewTask() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		String task = null;
		String notes = null;
		int status = 0;
		
		String uniqueID = UUID.randomUUID().toString();
		//System.out.println(uniqueID);
		
		
		task = request.getParameter("task");
		notes = request.getParameter("notes");
		status = Integer.parseInt(request.getParameter("status"));
		
		
		try
		{
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			ps = conn.prepareStatement("insert into task_details values(?,?,?,?)");
			ps.setString(1, uniqueID);
			ps.setString(2, task);
			ps.setString(3, notes);
			ps.setInt(4, status);
			ps.executeUpdate();
			
			RequestDispatcher rd = request.getRequestDispatcher("/tasks.jsp");
			rd.include(request, response);
		}
		catch(Exception exp)
		{
			exp.printStackTrace();
		}
		finally
		{
			try {
				ps.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
