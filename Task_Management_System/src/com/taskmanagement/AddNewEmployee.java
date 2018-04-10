package com.taskmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class AddNewEmployee
 */
@WebServlet("/AddNewEmployee")
public class AddNewEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public AddNewEmployee() {
        super();
        // TODO Auto-generated constructor stub
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
		
		int title = 0;
		int empid = 0;
		String name = null;
		String firstName = null;
		String lastName = null;
		String address1 = null;
		String address2 = null;
		String town = null;
		String county = null;
		String pinCode = null;
		
		//check the name and id in the input fields addNewEmployees.jsp
		title = Integer.parseInt(request.getParameter("title"));
		empid = Integer.parseInt(request.getParameter("empId"));
		name = request.getParameter("name");
		firstName = request.getParameter("firstName");
		lastName = request.getParameter("lastName");
		address1 = request.getParameter("address1");
		address2 = request.getParameter("address2");
		town = request.getParameter("town");
		county = request.getParameter("county");
		pinCode = request.getParameter("pincode");
		
		/*System.out.println(title);
		System.out.println(empid);
		System.out.println(name);
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(address1);
		System.out.println(address2);
		System.out.println(town);
		System.out.println(county);
		System.out.println(pinCode);*/
		
		
		
		try
		{
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			ps = conn.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, empid);
			ps.setString(2, name);
			ps.setString(3, firstName);
			ps.setString(4, lastName);
			ps.setInt(5, title);
			ps.setString(6, address1);
			ps.setString(7, address2);
			ps.setString(8, town);
			ps.setString(9, county);
			ps.setString(10, pinCode);
			ps.executeUpdate();
			
			/*rs = stmt.executeQuery("select ts.task, u.name, ts.assigned_by, ts.scheduled_date, s.status from tasks ts inner join users u on u.user_id = ts.assgined_to inner join user_title ut on ut.id = u.title inner join status s on s.id = ts.status;");
			while(rs.next())
			{
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
			}*/
			
			RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
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
