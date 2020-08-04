<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./Styles/styles.css"/>
    <title>Task Tracker</title>
  </head>
  <body>
  <h1 style="text-align:center">Task Tracking System</h1>
  <%

response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if(session.getAttribute("username")!=null){
  response.sendRedirect("./TaskTrackerPages/dashboard.jsp");

}
  %>
  
  	<div class="container center" >
  	
  	<div class="row">
    <div class="col-md">
  			<div class="card">
  				<div class="card-body">
  					<form method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Username</label>
						    <input type="text" class="form-control" name="username">
						    </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" name="password">
						  </div>
						  
						  <button type="submit" class="btn btn-primary" formaction="./login">Submit</button>
						  <button type="submit" class="btn btn-link" formaction="./register.jsp">New User?</button>
						  
						</form>
						
						<br>
						
						 <br>
            
            <%
              if(request.getAttribute("errorMessage")!=null){
                %>
                <div class="alert alert-danger" role="alert">
              <%= request.getAttribute("errorMessage") %>
            </div>
            <%  
            }
            %>
            
            <%
              if(request.getAttribute("successmessage")!=null){
                %>
                <div class="alert alert-primary" role="alert">
              <%= request.getAttribute("successmessage") %>
            </div>
            <%  
            }
            %>
						
						
  				</div>
  			</div>
  		</div>
  		
  	</div>
  	
  	</div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>