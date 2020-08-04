<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="../Styles/styles.css"/>
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if(session.getAttribute("username")==null){
	response.sendRedirect("../index.jsp");
	
}
%>


	<nav class="navbar sticky-top navbar-expand-md navbar navbar-light" style="background-color:#000000;">
  <a class="navbar-brand" href="./dashboard.jsp" style="color:white">Task Tracker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">

<ul class="nav nav-pills ml-auto">
  <li class="nav-item">
    <a class="nav-link active" href="./dashboard.jsp">Dashboard</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./Assigned.jsp">Assigned</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./MyTasks.jsp">My Tasks</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./Completed.jsp" >Completed</a>
  </li>
  <li class="nav-item ">
      <form method="post">
        <input class="btn btn-outline-danger" type="submit" formaction="../logout" value="Logout">
      </form>
      </li>
  
</ul>
</div>
</nav>


<div>

</div style="margin:20px">
<div class="jumbotron center" style="width:100%;padding:20px">
  <h1 class="display-4">Hello, <%=session.getAttribute("username") %></h1>
  <p class="lead">TaskTracker is an simple and easy to use web app built for managing and monitoring tasks in a workflow.</p>
  <hr class="my-4">
  	  <p>Keep track of tasks assigned to you in <strong>My Tasks</strong> tab <a href="./MyTasks.jsp">click here</a></p>
  
  <p>Assign and check status of assigned tasks in <strong>Assigned</strong> tab <a href="./Assigned.jsp">click here</a></p>
	  <p>All completed tasks can be found in <strong>Completed</strong> tab <a href="./Completed.jsp">click here</a></p>
	  
</div>
</div>







<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>