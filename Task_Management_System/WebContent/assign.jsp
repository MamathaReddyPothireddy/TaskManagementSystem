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
<script>
$(document).ready(function() {
	 
	$('#task').change(function(event) {
        var task = $("#task").val();
        $.get('JsonEMP', {
        	taskId : task
        }, function(response) {

        console.log(response);
        if (response != null) {
			 alert("Sorry!! this task is already assigned.");
			 //$("#task").val() = null;
			 document.getElementById('task').value = 0;
			 
			 return false;
		 }
        
        });
        });
});

</script>

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
  <!------------- MAIN PAGE CONTENT AREA --------->
  <div class="site-panel"style="margin-top:110px">
    <div class="container">
        <div class="row">
                <div class="col-md-3 well">
                    <div class= "sidebar">
                        <div class="list-group">
  <a href="index.jsp" class="list-group-item">Dashboard</a>
  <a href="employee.jsp" class="list-group-item">Employees</a>
  <a href="tasks.jsp" class="list-group-item">Tasks</a>
  <a href="assignTask.jsp" class="list-group-item">Assign Tasks</a>
</div> 
                    </div>
                </div>
                <div class="col-md-9 ">
                    <div class= "content-box well">
                                <form class="form-horizontal marginT20" action="./AssignTask" method="post">
<fieldset>

<!-- Form Name -->

<legend>Assign Task!!</legend>

<!-- Name  input-->

<% ArrayList<taskViewList> taskList = new ArrayList<taskViewList>();
	ArrayList<EmployeeViewList> empList = new ArrayList<EmployeeViewList>();

  
  rs = stmt.executeQuery("select task_id, task from task_details");
	while(rs.next())
	{
		taskViewList data = new taskViewList();
		data.setTaskId(rs.getString(1));
		data.setTask(rs.getString(2));
		taskList.add(data);
	}
	
	rs = stmt.executeQuery("select u.user_id, ut.title, u.name from users u inner join user_title ut on ut.id = u.title order by name;");
	while(rs.next())
	{
		EmployeeViewList data = new EmployeeViewList();
		data.setUserId(rs.getInt(1));
		data.setTitle(rs.getString(2));
		data.setName(rs.getString(3));
		empList.add(data);
	}
	%>

<div class="form-group">
   <div class="col-md-12">
   
     <select class="form-control" id="task" name="task">
     <option value="0" selected class="text-center">----Select Task----</option>
     
     <%for(int i=0; i < taskList.size(); i++)
  		{
  		String value = taskList.get(i).getTaskId();
  		String data = taskList.get(i).getTask();
  		
  		%>
  <option value="<%out.print(value); %>"><% out.print(data); %></option>
  <%
  		}
  %>

      </select>
   
  </div>
</div>

<div class="form-group">
   <div class="col-md-6">
   <select class="form-control" id="assignTo" name="assignTo">
     <option value="0" selected class="text-center">----Select Employee----</option>
     
     <%for(int i=0; i < empList.size(); i++)
  		{
  		int value = empList.get(i).getUserId();
  		String data = empList.get(i).getName();
  		String title = empList.get(i).getTitle();
  		
  		%>
  <option value="<%out.print(value); %>"><% out.print(title+" "+data); %></option>
  <%
  		}
  %>

      </select>
    
  </div>
   <div class="col-md-6">
  <input id="assignBy" name="assignBy" placeholder="Assign By" class="form-control" required="" type="text">
    
  </div>
</div>


<!-- Address  input-->
<div class="form-group">
 
  <div class="col-md-6">
  <input id="date" name="date" placeholder="date" class="form-control" required="" type="date">
  </div>
  
</div>


<!-- Text input-->
<div class="form-group">
   <div class="col-md-12">
  <textarea class="form-control" id="notes" name="notes" placeholder="Notes" maxlength="900" rows="3" required=""></textarea>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
 
 <button type="submit" class="btn btn-danger text-center" style="margin:20px"> Assign</button>
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