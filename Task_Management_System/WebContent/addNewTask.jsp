<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                                <form class="form-horizontal marginT20" action="./AddNewTask" method="post">
<fieldset>

<!-- Form Name -->

<legend>Add New Task!!</legend>
<button onCLick="history.back()" class="btn btn-primary pull-right"> Back</button>

<!-- Name  input-->

<div class="form-group">
   <div class="col-md-12">
  <input id="task" name="task" placeholder="Task " class="form-control" required="" type="text">
    
  </div>
</div>

<div class="form-group">
   <div class="col-md-12">
  <textarea class="form-control" id="notes" name="notes" placeholder="Notes" maxlength="900" rows="3" required=""></textarea>  
  </div>
</div>


<!-- Address  input-->
<div class="form-group">
 
  <div class="col-md-6">
  <select class="form-control" id="status" name="status">
        <option value="1">Not Started</option>
        <option value="2">In Progress</option>
        <option value="3">Completed</option>
      </select>
    
  </div>
  
</div>



<!-- Text input-->
<div class="form-group">
 
 <button type="submit" class="btn btn-danger text-center" style="margin:20px"> Add Task</button>
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