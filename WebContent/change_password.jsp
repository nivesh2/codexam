<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
<%@ page import="pkg.*"%>
	    
<%@ page import="java.sql.*"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<link rel="stylesheet" href="test.css">
<title>Insert title here</title>
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
  		<h1>Change Password <small><%=session.getAttribute("userName") %></h1>
	</div>
	
	
	<!-- Contect -->
	<div class="row">
		<form action="update_profile_servlet" method="post">
		
			<input type="hidden" value=<%=userId%> name="userId"/>
			<input type="hidden" value="true" name="changePassword"/>
			
			
			Old Password: <input class="form-control" type="text" name="old_password" /><br>
			New Password: <input class="form-control" type="text" name="new_password" /><br>
			Confirm Password: <input class="form-control" type="text" name="confirm_password" /><br>
			
			
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