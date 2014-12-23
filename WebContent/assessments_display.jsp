<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pkg.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link href="navbar-fixed-top.css" rel="stylesheet">
<title>Assessments</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">

<div class="page-header">
  <h1><%=session.getAttribute("userName") %> <small>Assessment</small></h1>
</div>



	<table class="table table-striped">
				<tr class="success">
					<th>Assessment Id</th>
		    		<th>TopicName</th>		
		    		<th>Date</th>
		    		<th>level</th>
		    		<th>Score</th>
		    		<th>Result</th>
				</tr> 
			<%
	    	Connection con=javadb.getConn();
			String userId=(String)session.getAttribute("userId");
			ArrayList<assessment_bean> al=javadb.getAssessment(con,userId);	
			Iterator<assessment_bean> itr=al.iterator(); 
			 //traversing elements of ArrayList object  
	

			while(itr.hasNext())
			 {  
				assessment_bean q=(assessment_bean)itr.next(); 
				%>
						
						
			  			<tr>
				    		<td><%=q.getAssessmentId()%></td>
				    		<td><%=q.getTopicName()%></td>		
				    		<td><%=q.getExamDate()%></td>
				    		<td><%=q.getLevelType()%></td>
				    		<td><%=q.getScore()%></td>
				    		<td><%=q.getResult()%></td>
				  		</tr>
					
					<%}%>
				
	</table>



</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>