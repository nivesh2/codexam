<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="test.css">
<title>Add Topic</title>
</head>
<body>

<div class="container">


  
<%  

if(request.getParameter("addTopic").equals("true")){
//add new topic
	 %>
	 
	 
	 	<div class="page-header">
	 		 <h1>Add New Topic: </h1>
		</div>
		
		<form role="form"  action="add_topic_servlet" method="get">
		 
		 <label >Topic Name</label>	 
		 <input  class="form-control"  type="text" required name="topicName" "><br/>
		 <label >Description</label>	 
		 <textarea class="form-control" rows="3" type="text"  name="description" ></textarea>
		 <br/>	  
		<input name="company" type="hidden" value="<%=session.getAttribute("company")%>"/>
		<input name="addTopic" type="hidden" value="true"/>	
		<input name="userId" type="hidden" value="<%=session.getAttribute("userId")%>"/>
		<br/>
		<label>Level</label> 
		 <select name="levelType" class="form-control"  >      
		    <option value="1">1</option>
		   	<option value="2">2</option>
		  	<option value="3">3</option>
		 </select>
		 <br/>
		 
		<input class="btn btn-default" name="submit" type="submit" value="Submit">
		<a type="button" class="btn btn-primary pull-right"  href="admin_dashboard.jsp">Cancel</a>
		</form>
	<%
}
else{
 %>
 
 	<div class="page-header">
 	 <h1><%=request.getParameter("topicName") %> <small>Add New Level: </small></h1>
	</div>
 	<form role="form" action="add_topic_servlet" method="get">
	 
	 <input type="hidden" value="<%=request.getParameter("topicName") %>" name="topicName"/>
	 <input name="addTopic" type="hidden" value="false"/>	
	 <input type="hidden" value="<%=request.getParameter("topicId") %>" name="topicId"/>
	 
	<br/>
	<label>Level</label> 
	 <select name="levelType" class="form-control"  >      
	    <option value="1">1</option>
	   	<option value="2">2</option>
	  	<option value="3">3</option>
	 </select>
	 <br/>
	<input class="btn btn-primary" name="submit" type="submit" value="Submit">
	<a type="button" class="btn btn-default pull-right" href="admin_dashboard.jsp">Cancel</a>
   
	</form>
 <%
 }
  %>
  
 </div>
    <jsp:include page="footer.jsp"></jsp:include>
    	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>