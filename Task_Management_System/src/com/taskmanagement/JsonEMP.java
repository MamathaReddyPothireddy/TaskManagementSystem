package com.taskmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.taskmanagement.DBConnection;

/**
 * Servlet implementation class JsonEMP
 */
@WebServlet("/JsonEMP")
public class JsonEMP extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public JsonEMP() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String employeeID = null;
		String task_ID = null;
		employeeID =	request.getParameter("employeeID");
		task_ID =	request.getParameter("taskId");
		//System.out.println(employeeID);
		System.out.println(task_ID);
		
		String json = null;
		String responseText = null;
        Connection conn=null;
		ResultSet rs=null;
		Statement stmt=null;
    
		try {
			System.out.println("In try");
			conn=DBConnection.getConnection();
			stmt = conn.createStatement();
        if( employeeID != null)
        {
        	//System.out.println("In If");
         rs = stmt.executeQuery("select user_id from users where user_id = '"+employeeID+"'");
         while(rs.next())
         {
        	// System.out.println("In while");
        	 if(rs.getInt(1) != 0)
        	 {
        		// System.out.println("No");
        		 responseText = "Sorry!! the employee id already exists.";
        		 
        	 }
        	 
        	 
         }

         json = new Gson().toJson(responseText);
        }
        else
        {
        	System.out.println("In If");
            rs = stmt.executeQuery("SELECT id FROM tasks t where task = '"+task_ID+"'");
            while(rs.next())
            {
           	 System.out.println("In while");
           	 if(rs.getInt(1) != 0)
           	 {
           		 System.out.println("No");
           		 responseText = "Sorry!! this task is already assigned.";
           		 
           	 }
           	 
           	 
            }

            json = new Gson().toJson(responseText);
        	
        }
       
        
        response.setContentType("application/json");
        response.getWriter().write(json);
		}
        catch(Exception exp)
        {
        	exp.printStackTrace();
        }
        finally
        {
        	try {
        		rs.close();
            	stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
