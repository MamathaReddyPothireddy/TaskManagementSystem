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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/profile.css" type="text/css">
<style>
table {
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

th {
    cursor: pointer;
}

th, td {
    text-align: left;
    padding: 16px;
}

tr:nth-child(even) {
    background-color: #f2f2f2
}
</style>
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
  <a href="employee.jsp" class="list-group-item active">Employees</a>
  <a href="tasks.jsp" class="list-group-item">Tasks</a>
  <a href="assignTask.jsp" class="list-group-item">Assign Tasks</a>
</div> 
                    </div>
                </div>
                <div class="col-md-9 ">
                    <div class= "content-box well">
                                <form class="form-horizontal marginT20">
<fieldset>

<!-- Form Name -->
<legend>Tasks</legend>
<a href="addNewEmployee.jsp"><button type="button" class="btn btn-danger pull-right"> Add New Employee</button></a>

 <table id="myTable">
  <tr>
   <!--When a header is clicked, run the sortTable function, with a parameter, 0 for sorting by names, 1 for sorting by country:-->  
    <th onclick="sortTable(0)">Emp ID</th>
    <th onclick="sortTable(1)">Title</th>
    <th onclick="sortTable(2)">Name</th>
    <th onclick="sortTable(4)">County</th>
  </tr>
  
  <% 
  ArrayList<EmployeeViewList> empList = new ArrayList<EmployeeViewList>(); 
  
  rs = stmt.executeQuery("select u.user_id, t.title, u.name, u.county from users u inner join user_title t on t.id = u.title order by u.user_id;");
	while(rs.next())
	{
		EmployeeViewList data = new EmployeeViewList();
		
		data.setUserId(rs.getInt(1));
		data.setName(rs.getString(3));
		data.setTitle(rs.getString(2));
		data.setCounty(rs.getString(4));
		empList.add(data);
		
	}
  
  %>
  
  
  
  
  <% for (int i=0; i < empList.size(); i++)
  {
	  %>
	  <tr>
	  <td><a href="viewEmployee.jsp?value=<%out.print(empList.get(i).getUserId()); %>" style="color: black"><%out.print(empList.get(i).getUserId()); %></a></td>
	  <td><%out.print(empList.get(i).getTitle()); %></td>
	  <td><%out.print(empList.get(i).getName()); %></td>
	  <td><%out.print(empList.get(i).getCounty()); %></td>
	  </tr>
	  <%
  }
  %>
  
  
</table>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>

</fieldset>
</form>

                    </div>
                </div>
                

          
        </div>
    </div>
</div>


  
<!-- <div class="footer-area ">
    
    <div class="footer-bottom">
        <div class="container">
					<div class="row">
						<div class="col-sm-12 text-center ">
							<div class="copyright-text">
								<p>CopyRight © 2018 <a href="#">Task Management System</a></p>
							</div>
						</div> End Col
						
					</div>
				</div>
    </div>
</div>
 --></body>
</html>