<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*, java.io.*, java.util.*, java.text.*, java.util.Date " %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*, java.util.Map, java.util.Map.Entry, java.util.Set, java.net.URLDecoder" %>
<%@ page import = "com.taskmanagement.DBConnection,com.taskmanagement.EmployeeViewList" %>
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


<%String emp_id = request.getParameter("value"); %>
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
                
                <% 
  ArrayList<EmployeeViewList> empList = new ArrayList<EmployeeViewList>(); 
  
  rs = stmt.executeQuery("select u.user_id, u.name, u.first_name, u.last_name, ut.title, u.address_1, u.address_2, u.town, u.county, u.postal_code from users u inner join user_title ut on ut.id = u.title where user_id ='"+emp_id+"'");
	while(rs.next())
	{
		EmployeeViewList data = new EmployeeViewList();
		data.setUserId(rs.getInt(1));
		data.setTitle(rs.getString(5));
		data.setName(rs.getString(2));
		data.setFirstName(rs.getString(3));
		data.setLastName(rs.getString(4));
		data.setAddress1(rs.getString(6));
		data.setAddress2(rs.getString(7));
		data.setTown(rs.getString(8));
		data.setCounty(rs.getString(9));
		data.setPostalCode(rs.getString(10));
		
		empList.add(data);
	}
  
  %>
                
                <div class="col-md-9 ">
                    <div class= "content-box well">
                                <form class="form-horizontal marginT20" action="./AddNewEmployee" method="post">
<fieldset>

<!-- Form Name -->

<legend>View Employee Details!!</legend>
<button onCLick="history.back()" class="btn btn-primary pull-right"> Back</button>

<%for(int i = 0 ; i < empList.size(); i++)
	{
	%>
<!-- ID Info-->
<div class="form-group">
  
  <!-- <div class="col-md-6">
  <input id="title" name="title" placeholder="Mr/Mrs" class="form-control" required="" type="text">
  <select class="form-control" id="title" name="title">
        <option value="1">Mr</option>
        <option value="2">Mrs</option>
      </select>
    
  </div> -->
  
  <div class="col-md-6">
  <label>Name</label>
  <input id="name" name="name" placeholder="Name" class="form-control" required="" value="<%out.print(empList.get(i).getTitle()+" "+empList.get(i).getName());%>" readonly type="text">
    
  </div>
  
  <div class="col-md-6">
  <label>Employee Id</label>
  <input id="empId" name="empId" placeholder="Employee Id" class="form-control" required="" value="<%out.print(empList.get(i).getUserId());%>" readonly type="number">
    
  </div>
</div>

<div class="form-group">
   <div class="col-md-6">
   <label>First Name</label>
  <input id="firstName" name="firstName" placeholder="First Name" class="form-control" required="" value="<%out.print(empList.get(i).getFirstName() );%>" readonly type="text">
    
  </div>
   <div class="col-md-6">
   <label>Last Name</label>
  <input id="lastName" name="lastName" placeholder="Last Name" class="form-control" required="" value="<%out.print(empList.get(i).getLastName());%>" readonly type="text">
    
  </div>
</div>


<!-- Address  input-->
<div class="form-group">
 
  <div class="col-md-6">
  <label>Address</label>
  <input id="address1" name="address1" placeholder="Address" class="form-control" required="" value="<%out.print(empList.get(i).getAddress1());%>" readonly type="text">
    
  </div>
  <div class="col-md-6">
  <label>Address 2 (Optional)</label>
  <input id="address2" name="address2" placeholder="Address2 (Optional)" class="form-control" value="<%out.print(empList.get(i).getAddress2());%>" readonly type="text">
    
  </div>
  
  </div>
  
  <div class="form-group">
  
  <div class="col-md-6">
  <label>Town</label>
  <input id="town" name="town" placeholder="Town" class="form-control" required="" value="<%out.print(empList.get(i).getTown());%>" readonly type="text">
    
  </div>
  <div class="col-md-6">
  <label>County</label>
  <input id="county" name="county" placeholder="County" class="form-control" required="" value="<%out.print(empList.get(i).getCounty());%>" readonly type="text">
    
  </div>
</div>







<!-- Text input-->
<div class="form-group">
 
  <div class="col-md-6">
  <label>Pincode</label>
  <input id="pincode" name="pincode" placeholder="Pincode" class="form-control" required="" value="<%out.print(empList.get(i).getPostalCode());%>" readonly type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
 
 <!-- <button type="submit" class="btn btn-danger text-center" style="margin:20px"> Add Employee</button> -->
</div>

<%

}
%>
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