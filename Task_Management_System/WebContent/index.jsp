<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*, java.io.*, java.util.*, java.text.*, java.util.Date " %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*, java.util.Map, java.util.Map.Entry, java.util.Set, java.net.URLDecoder" %>
<%@ page import = "com.taskmanagement.DBConnection,com.taskmanagement.taskViewList, com.taskmanagement.EmployeeViewList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Task Management System</title>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/profile.css" type="text/css">
<!------ Include the above in your HEAD tag ---------->

<%
	int totalEmp = 0;
	int totalTask = 0;
	int totalAssign = 0;
%>
<%!
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs  = null;
			
			//PreparedStatement ps = null;
			public void jspInit()
			{
			try
			{
				conn=DBConnection.getConnection();
				stmt = conn.createStatement();
			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			}
			
	%>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp"><img src="img/logo.png" alt="Task Management System"> </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      
      <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="index.jsp">Home</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
      </div><!-- /.container-collapse -->
  </nav>	
  
  <%   rs = stmt.executeQuery("select count(*) from task_details");
	while(rs.next())
	{
		totalTask = rs.getInt(1);
	}
	
	rs = stmt.executeQuery("select count(*) from users");
	while(rs.next())
	{
		totalEmp = rs.getInt(1);
	}
	
	rs = stmt.executeQuery("select count(*) from tasks");
	while(rs.next())
	{
		totalAssign = rs.getInt(1);
	}
	%>
  
  
  <!------------- MAIN PAGE CONTENT AREA --------->
  <div class="site-panel"style="margin-top:110px">
    <div class="container">
        <div class="row">
                <div class="col-md-3 well">
                    <div class= "sidebar">
                        <div class="list-group">
  <a href="index.jsp" class="list-group-item active">Dashboard</a>
  <a href="employee.jsp" class="list-group-item">Employees</a>
  <a href="tasks.jsp" class="list-group-item">Tasks</a>
  <a href="assignTask.jsp" class="list-group-item">Assign Tasks</a>
</div> 
                    </div>
                </div>
                <div class="col-md-9 ">
                    <div class= "content-box well">
                                <form class="form-horizontal marginT20">
<fieldset style="height: 70%">

<!-- Form Name -->
<legend>Dashboard</legend>
<div class="md-col-12">
<div class="row">
<div class="md-col-4">
  <div class="panel panel-success">
    <div class="panel-heading">Total Employees</div>
    <div class="panel-body "><b><%out.print(totalEmp); %></b></div>
  </div>
</div>
<div class="md-col-4">
  <div class="panel panel-info">
    <div class="panel-heading">Total Tasks</div>
    <div class="panel-body"><b><%out.print(totalTask); %></b></div>
  </div>
</div>
<div class="md-col-4">
  <div class="panel panel-danger">
    <div class="panel-heading">Tasks Assign</div>
    <div class="panel-body "><b><%out.print(totalAssign); %></b></div>
  </div>
</div>
</div>
</div>
</fieldset>
</form>

                    </div>
                </div>
                

          
        </div>
    </div>
</div>
  
  
  
</body>
</html>