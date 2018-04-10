package com.taskmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TaskViewServlet
 */
@WebServlet("/TaskViewServlet")
public class TaskViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public TaskViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String updateValue = request.getParameter("status");
		//System.out.print(updateValue);
		String task_id = request.getParameter("taskId");
		//System.out.print(task_id);
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate("update task_details set status = '"+updateValue+"' where task_id ='"+task_id+"'");
			/*while(rs.next())
			{
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
			}*/
			
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
				//rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	}

}
