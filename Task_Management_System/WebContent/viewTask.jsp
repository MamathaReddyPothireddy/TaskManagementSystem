<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*, java.io.*, java.util.*, java.text.*, java.util.Date " %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*, java.util.Map, java.util.Map.Entry, java.util.Set, java.net.URLDecoder" %>
<%@ page import = "com.taskmanagement.DBConnection,com.taskmanagement.taskViewList" %>
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

<%String task_id = request.getParameter("value"); %>
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
      <a class="navbar-brand" href="home.jsp"><img src="img/logo.png" alt="Task Management System"> </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      
      <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="index.jsp">Home</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
      </div><!-- /.container-collapse -->
  </nav>	
  <!------------- MAIN PAGE CONTENT AREA --------->
  <div class="site-panel"style="margin-top:110px">
    <div class="container">
        <div class="row">
                <div class="col-md-3 well">
                    <div class= "sidebar">
                        <div class="list-group">
  <a href="home.jsp" class="list-group-item">Dashboard</a>
  <a href="employee.jsp" class="list-group-item">Employees</a>
  <a href="tasks.jsp" class="list-group-item">Tasks</a>
  <a href="assignTask.jsp" class="list-group-item">Assign Tasks</a>
</div> 
                    </div>
                </div>
                <div class="col-md-9 ">
                    <div class= "content-box well">
                                <form class="form-horizontal marginT20" action="./TaskViewServlet" method="post">
<fieldset>

<% 
  ArrayList<taskViewList> taskList = new ArrayList<taskViewList>(); 
  
  rs = stmt.executeQuery("select td.task, td.notes, s.status, td.task_id from task_details td inner join status s on s.id = td.status where td.task_id ='"+task_id+"'");
	while(rs.next())
	{
		taskViewList data = new taskViewList();
		data.setTask(rs.getString(1));
		data.setNotes(rs.getString(2));
		data.setStatus(rs.getString(3));
		data.setTaskId(rs.getString(4));
		taskList.add(data);
	}
  
  %>


<!-- Form Name -->

<legend>Edit Task!!</legend>
<button onCLick="history.back()" class="btn btn-primary pull-right"> Back</button>

<!-- Name  input-->

<%for(int i = 0 ; i < taskList.size(); i++)
	{
	%>

<div class="form-group">
   <div class="col-md-12">
   <label>Task</label>
  <input id="task" name="task" placeholder="Task " class="form-control" required="" value="<%out.print(taskList.get(i).getTask()); %>" type="text" readonly>
  <input id="taskId" name="taskId" value="<%out.print(taskList.get(i).getTaskId()); %>" style="display:none" >
    
  </div>
</div>

<div class="form-group">
   <div class="col-md-12">
   <label>Notes</label>
  <textarea class="form-control" id="notes" name="notes" placeholder="Notes" maxlength="900" rows="3" required="" readonly> <%out.print(taskList.get(i).getNotes()); %></textarea>  
  </div>
</div>


<!-- Address  input-->
<div class="form-group">
 
  <div class="col-md-6">
  <label>Status</label>
  <select class="form-control" id="status" name="status">
        <option value="1">Not Started</option>
        <option value="2">In Progress</option>
        <option value="3">Completed</option>
      </select>
    
  </div>
  <%
	}
  %>
</div>



<!-- Text input-->
<div class="form-group">
 
 <button type="submit" class="btn btn-primary text-center" style="margin:20px"> Edit Task</button>
</div>
</fieldset>
</form>

                    </div>
                </div>
                

          
        </div>
    </div>
</div>
  
  
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>