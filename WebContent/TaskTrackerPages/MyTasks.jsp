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
	<link rel="stylesheet" type="text/css" href="./Styles/styles.css"/>
    <title>My Tasks</title>
</head>
<body onload="servletPost()">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
if(session.getAttribute("username")==null){
	response.sendRedirect("../index.jsp");
	
}
%>




<%
							if(session.getAttribute("errorMessage")!=null){
								%>
								<div class="alert alert-sm alert-danger alert-dismissible fade show" role="alert">
							<%= session.getAttribute("errorMessage") %>
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  <%
  session.setAttribute("errorMessage",null);
  %>
						</div>
						<%	
						}
						%>
						
						<%
							if(session.getAttribute("successMessage")!=null){
								%>
								<div class="alert alert-sm alert-success alert-dismissible fade show" role="alert">
							<%= session.getAttribute("successMessage") %>
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  <%
  session.setAttribute("successMessage",null);
  %>
						</div>
						<%	
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
    <a class="nav-link" href="./dashboard.jsp">Dashboard</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./Assigned.jsp">Assigned</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="./MyTasks.jsp">My Tasks</a>
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

<div class="container container-md " style="width:fit-content;margin:1% 3%;">
<button type="button" class="btn btn-dark btn-md " data-target="#addTaskModal" onclick="servletPost()">
	Refresh List
</button>
</div>
<!--Card for tasks  -->
	
	
	<br>
	<div class="container" id="cardsHere">
		
		
	<div class="container" style="width: fit-content; margin 0 auto;">
	<button class="btn btn-dark" type="button" disabled>
  <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
  Fetching from DB
</button>
	</div>
	
	
	</div>
	
	
	
	
	
	
				
		


<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
  <script type="text/javascript">
 
function getXmlHttpRequestObject()
{
var xmlHttp = false;
if (window.XMLHttpRequest)
{
return new XMLHttpRequest(); //To support the browsers IE7+, Firefox, Chrome, Opera, Safari
}
else if(window.ActiveXObject)
{
return new ActiveXObject("Microsoft.XMLHTTP"); // For the browsers IE6, IE5 
}
else
{
alert("Error due to old verion of browser upgrade your browser");
}
}
var xmlhttp = new getXmlHttpRequestObject(); //xmlhttp holds the ajax object
function servletPost() {
if(xmlhttp) { 
	var loadingAni='<div class="container" style="width: fit-content; margin 0 auto;">';
	loadingAni+='<button class="btn btn-dark" type="button" disabled>';
	loadingAni+= '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';
	loadingAni+=  'Refreshing List';
	loadingAni+='</button>';
	loadingAni+=	'</div>'
document.getElementById("cardsHere").innerHTML=loadingAni; 
xmlhttp.open("POST","../fetchmytask",true);
xmlhttp.onreadystatechange = handleServletPost;
xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
xmlhttp.send(); 
}
}
function handleServletPost() {
if (xmlhttp.readyState == 4) {
if(xmlhttp.status == 200) {
document.getElementById("cardsHere").innerHTML=xmlhttp.responseText; 
}
}
}
    
	</script>
</body>
</html>