<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="pkg.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="footer.css">
<title>Insert title here</title>
</head>
<body>
<div class="container">



	<!-- Header -->
	<div class="page-header">
  		<h1>Welcome <small>Super Admin</small> <a class="btn btn-primary pull-right" href="logout.jsp?superAdmin=true">LogOut</a></h1>
	</div>
	
	
	<!-- Contect -->
	<div class="row">
<% 
Connection conn=javadb.getConn();
ArrayList<user_bean> al=javadb.getAdmins(conn,"admin"); 
Iterator<user_bean> itr=al.iterator(); 
%>

<table class="table table-bordered">

<tr class="danger">
	<th>S.no</th>
	<th>Admin Name</th>
	<th>Company</th>
	<th>UserId</th>
	<th>Admin Status</th>
	<th></th>
	<th></th>
</tr>


<%     	
	int i=1;
	while(itr.hasNext())
	{  
		user_bean q=itr.next(); %>
	  <tr>
	  	<td><%=i %></td>
	    <td><%=q.getName() %></td>
	    <td><%=q.getCompany()%></td> 
	    <td><%=q.getEmailId()%></td>
	    <td><%=q.getAdmin_status()%></td>
	   <td><a type="button"  class="btn btn-default" href="display_admin_profile.jsp?userId=<%=q.getId()%>">VIEW</a></td>
	    <td><a type="button"  class="btn btn-danger " href="delete_admin_jsp.jsp?userId=<%=q.getId()%>">DELETE</a></td>
	    
	  </tr>
	 <%
	 i++;
	 } %>
</table>


</div> <!-- row closed -->
</div><!-- container closed -->
    <jsp:include page="footer.jsp"></jsp:include>
    
    
  
</body>
</html>