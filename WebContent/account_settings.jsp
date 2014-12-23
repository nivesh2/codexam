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

<link rel="stylesheet" href="test.css">
<title>Account Setting</title>
</head>
<body>

<% 
    	Connection con=javadb.getConn();
		String userId=(String)session.getAttribute("userId");
		user_bean obj=javadb.viewProfile(userId, con);
	
%>
<div class="container">



	<!-- Header -->
	<div class="page-header">
  		<h1>Change Information </small></h1>
	</div>
	
	
	<!-- Contect -->
	<div class="row">
	<form action="update_profile_servlet" method="post">
	
		<input type="hidden" value=<%=userId%> name="userId"/>
		<input type="hidden" value="false" name="changePassword"/>
			
		Full Name: <input class="form-control" type="text" name="userName" value="<%=obj.getName()%>"/><br>
		PhoneNo: <input class="form-control" type="text" name="phoneNo" value="<%=obj.getPhoneNo()%>"/><br>
		Address: <input class="form-control" type="text" name="address" value="<%=obj.getAddress()%>"/><br>
		Company: <input class="form-control" type="text" name="company" value="<%=obj.getCompany()%>" /><br>
		
		
		<input class="btn btn-success pull-right"  type="submit" name="submit" value="submit"/>
		<% if((Boolean)session.getAttribute("isAdmin")){ %>
		<a type="button" class="btn btn-primary " href="admin_dashboard.jsp">Cancel</a>
		<%}
		else{
		 %>
		 <a type="button" class="btn btn-primary " href="dashboard.jsp">Cancel</a>
		<%} %>
	</form>


</div> <!-- row closed -->
</div><!-- container closed -->



    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>