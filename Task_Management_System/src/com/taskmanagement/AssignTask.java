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
 * Servlet implementation class AssignTask
 */
@WebServlet("/AssignTask")
public class AssignTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignTask() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		int assignTo = 0;
		String assignBy = null;
		String date = null;
		String updateBy = null;
		
		String uniqueID = UUID.randomUUID().toString();
		//System.out.println(uniqueID);
		
		
		task = request.getParameter("task");
		notes = request.getParameter("notes");
		assignTo = Integer.parseInt(request.getParameter("assignTo"));
		assignBy = request.getParameter("assignBy");
		date = request.getParameter("date");
		
		/*System.out.println(task);
		System.out.println(notes);
		System.out.println(assignTo);
		System.out.println(assignBy);
		System.out.println(date);*/
		
		
		try
		{
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			ps = conn.prepareStatement("insert into tasks values(?,?,?,?,?,?,?)");
			ps.setString(1, uniqueID);
			ps.setString(2, task);
			ps.setInt(3, assignTo);
			ps.setString(4, assignBy);
			ps.setString(5, date);
			ps.setString(6, updateBy);
			ps.setString(7, notes);
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
