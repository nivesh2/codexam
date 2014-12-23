<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<link rel="stylesheet" href="test.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">



	<!-- Header -->
	<div class="page-header">
  		<h1>Admin Profile <small>superAdmin Rights</small></h1>
	</div>
	
	
	<!-- Contect -->
	<div class="row">
<% 
    	Connection con=javadb.getConn();
		String userId=request.getParameter("userId");
		user_bean obj=javadb.viewProfile(userId, con);
	
%>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">UserName: <%=obj.getName()%>"</div>
   
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
     
     <form action="validate_admin_servlet" method="post">
		<input  type="hidden" name="userId" value="<%=userId%>"/>
		<select class="form-control"  name="validate">
			<option value="active">ACTIVATE</option>
			<option value="inactive">INACTIVATE</option>
		</select>
		<br/>
		<a class="btn btn-success " href="super_admin_dashboard.jsp">Go Back</a>
		<input class="btn btn-primary pull-right"  type="submit" name="submit" value="submit"/>
		
	</form>
     
     </li>
  </ul>
</div>
 


<%con.close(); %>




</div> <!-- row closed -->
</div><!-- container closed -->


    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>