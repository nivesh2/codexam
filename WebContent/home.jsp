<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
 
<link rel="stylesheet" href="test.css">
<title>Codexam</title>
</head>
<body>

 <div class="container " > 	
  	<div class="" id="login ">
		<div class="page-header">
		 <h1><strong>Codexam</strong> <small> learn to code...</small> </h1>
		</div>
	
		
		<form role="form" action="validate_servlet" method="post">
	 	
		<label >UserName</label>	 
		<input  class="form-control" placeholder="UserName" type="text" required name="userid" ">
		<br/>	 
  		<label >Password</label>	 
		<input  class="form-control" placeholder="Password" type="text" required name="password" ">
		
		<br/>
		<input class="btn  btn-primary" type="submit" value="Login"> 
		<a class="btn  btn-warning pull-right" href="signup.jsp">SignUp</a> 
		
		 
		</form>
		<br/>
		<a  href="#">Forgot Password?</a> 
		
		</div> 

		

</div>
	<br/>


 	<% 
String msg = (String)request.getAttribute("msg");
if(msg!=null)
{
	%>
		<div class="container alert-div">
		<div	class="alert  alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  		<span class="sr-only">Error:</span>
	<%
	out.print(msg );
	 %>
	 
	 	</div></div>
	 <%
 }
  %>	
  
  <jsp:include page="footer.jsp"></jsp:include>
	
  
  
  
	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.4.1/holder.js" type="text/javascript"></script>
	<script src="codexam.js" type="text/javascript"></script>

</body>
</html>