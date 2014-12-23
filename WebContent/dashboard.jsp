<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link href="navbar-fixed-top.css" rel="stylesheet">
<link rel="stylesheet" href="footer.css">
<title>Dashboard</title>
</head>

<body> 
	
	<jsp:include page="header.jsp"></jsp:include>
	

	<div class="container dashboard">

      <!-- Main component for a primary marketing message or call to action -->
	      <div class="jumbotron">
	        <h1>Welcome <%=session.getAttribute("userName") %>!</h1>
	        <p>Last test completed JavaScript.</p>
	        <p>
	          <a class="btn btn-lg btn-primary" href="#" role="button">View Certificates Earned &raquo;</a>
	        </p>
	      </div>

    </div> <!-- /container -->
    
    
    <div class="container " id="topics">
    <br/><br/>
   
    	<jsp:include page="display_topics.jsp"/>	
    </div> 
    
    <jsp:include page="footer.jsp"></jsp:include>
    
    
    
    	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.4.1/holder.js" type="text/javascript"></script>
	<script src="codexam.js" type="text/javascript"></script>
	
</body>




</html>