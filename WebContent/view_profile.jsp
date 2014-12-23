<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="pkg.*"%>
	    
<%@ page import="java.sql.*"%>	
		<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link href="navbar-fixed-top.css" rel="stylesheet">
<link rel="stylesheet" href="center_align.css">
<link rel="stylesheet" href="footer.css">
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="header.jsp"></jsp:include>
	
<div class="container mycenter">



	<!-- Header -->
	<div class="page-header">
  		<h1>View Profile</h1>
	</div>
	
	
	<!-- Contect -->
	<div class="row">
<% 
    	Connection con=javadb.getConn();
		String userId=(String)session.getAttribute("userId");
		user_bean obj=javadb.viewProfile(userId, con);
	
%>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">UserName: <%=obj.getName()%></div>
   
  <!-- List group -->
  <ul class="list-group">
    <li class="list-group-item">DateOfBirth: <%=obj.getDob()%></li>
    <li class="list-group-item">EmailId : <%=obj.getEmailId()%></li>
    <li class="list-group-item">PhoneNo: <%=obj.getPhoneNo()%></li>
    <li class="list-group-item">Company: <%=obj.getCompany()%></li>
    <li class="list-group-item">Address: <%=obj.getAddress()%></li>
    <li class="list-group-item">RegistrationDate: <%=obj.getRegistrationDate()%></li>
    <li class="list-group-item">LastLogin: <%=obj.getLastLogin()%></li>
     <li class="list-group-item">
     
     
     </li>
  </ul>
</div> 
 

 
<%con.close(); %>




</div> <!-- row closed -->
</div><!-- container closed -->


    <jsp:include page="footer.jsp"></jsp:include>
    
    	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>