<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="pkg.*"%>
   <%@ page import="java.util.*"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="footer.css">
<link href="navbar-fixed-top.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
	
	<!-- Header -->
	<div class="page-header">
  		<h1><%=session.getAttribute("company") %> <small>Enrolled Users</small></h1>
	</div>
	
	
	<!-- Contect -->
	<div class="row">
		<%
			Connection con = javadb.getConn();
			ArrayList<user_bean> al = javadb.getUsers(con,(String)session.getAttribute("company"),"user");
			int i=1;
			if(al!=null){
			System.out.println("Not null");
			%>
		<table class="table table-bordered">
  				<tr>
  				<th>S.no</th>
  				<th>Name</th>
  				<th>userId</th>
  				<th></th>
  			
  				</tr>
			
		<%
			
			
			for(user_bean obj :al){
			%>
				<tr>
  				<td><%= i %></td>
  				<td><%=obj.getName() %></td>
  				<td><%=obj.getId()%></td>
  				<td>    
  				 <button type="button" data-toggle="modal" data-target="<%="#"+obj.getId()%>" class="btn btn-primary " "  >info</button>
			    </td>
  			 		
  				</tr>
			
			<%
			i++;
			} // table for closed
			
			for(user_bean obj :al){
			%>
				  <!-- Modal -->
			<div class="modal fade" id="<%=obj.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title" id="myModalLabel">User Details</small></h4>
			      </div>
			      <div class="modal-body">
			      
			      
			      <div class="panel panel-default">
					  <!-- Default panel contents -->
					  <div class="panel-heading"> <h4><%=obj.getName()%> </h4></div>
					  

  					<!-- List group -->
  					<ul class="list-group">
					  <li class="list-group-item">UserName: <%=obj.getUname() %></li>
					  <li class="list-group-item">Company: <%=obj.getCompany() %></li>
					  <li class="list-group-item">Date of birth: <%=obj.getDob() %></li>
					  <li class="list-group-item">Email: <%=obj.getEmailId() %></li>
					  <li class="list-group-item">PhoneNo: <%=obj.getPhoneNo() %></li>
					  <li class="list-group-item">Address: <%=obj.getAddress() %></li>
					  <li class="list-group-item">Registered on: <%=obj.getRegistrationDate() %></li>
					  <li class="list-group-item">Last Login: <%=obj.getLastLogin() %></li>		
					</ul>
</div>
			     	
			 
			   
			      </div>
			      <div class="modal-footer">			         
			       <a type="button" class="btn btn-danger pull-left" href="delete_user.jsp?userId=<%=obj.getId()%>" >Delete</a>
			      <button type="button" class="btn btn-primary pull-right" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div> 
			
			<%
		
			}// modal for closed	
			}// if closed
			else{
			%>
			<div class="panel-body">
			   No users have enrolled currently.
			</div>
			  <%
			}
			con.close();
		%>
		</table>
	</div><!-- row closed -->
	</div><!-- container closed -->
	
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
 	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>