<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
 
 <!-- Custom styles for this template -->
  <link href="signin.css" rel="stylesheet">
<title>SignUp</title>
</head>
<body>

<font color="RED">
<% 
String msg = (String)request.getAttribute("msg");
if(msg!=null)
out.print(msg);
 %>
</font>

 <div class="container">
 	<div class="col-md-6">
 	<h2 class="form-signin-heading">Fill the information</h2>
	<form  role="form" action="signup_servlet" method="post">
		
		User Name: <input class="form-control"  type="text" name="name" /><br>			
		Full Name: <input class="form-control" placeholder="FullName" type="text" name="fullname" /><br>
		Password: <input class="form-control" placeholder="Password" type="password" name="password" /><br>
		Date of Birth: <input type="date" name="dob" /><br>
		Email: <input  class="form-control" placeholder="Email"  type="email" name="email" /><br>
		Phone No: <input  class="form-control" placeholder="phone no"  type="text" name="phoneno" /><br>
		Address: <input  class="form-control" placeholder="address"  type="text" name="address" /><br>
		Company: <input  class="form-control" placeholder="Company Name"  type="text" name="company" /><br>
		
		UserType <select class="form-control" name="userType">
				 <option value="user">User</option>
				 <option value="admin">Admin</option>
				</select>
		
		<br>
		
		 <input class="btn btn-sm btn-primary btn-block" type="submit" value="Submit" />
	</form>
	</div>
</div>

	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.4.1/holder.js" type="text/javascript"></script>

</body>
</html>