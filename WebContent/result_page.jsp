<%@page import="support.static_question"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="center_align.css">
<link rel="stylesheet" href="footer.css">
<title>ResultPage</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	

<div class="container mycenter">
	<div class="page-header"><h2>Result Page</h2></div>

<% 
if (((String)request.getAttribute("result")).equalsIgnoreCase("Pass"))
{
	%>
	<!-- Panel 1 -->
	<div class="panel panel-success">
		<div class="panel-heading">
			<h4><%=session.getAttribute("userName")%></h4>
			<p> <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> Congratulations! You have Passed this module. Collect your certificate now.</p>
			
			  <p>
		          <a class="btn btn-default" href="#" role="button">Collect Certificate &raquo;</a>
		        </p>
		</div>
		<div class="panel-body">
		    <h4>Your Score Card for this module:</h4>
		    
		    
			    	<ul class="list-group">
					    <li class="list-group-item">Score: <%= request.getAttribute("percentage")%>%</li>
					    <li class="list-group-item">Correct replies: <%=((static_question)session.getAttribute("exam_counter")).score %></li>
					    <li class="list-group-item">Passing Criteria: 70%</li>
					</ul>
		    <% 	String s = ((static_question)session.getAttribute("exam_counter")).exam_report;
		%>
		</div>
	</div>
	<%
}
else{
	%>
	<!-- Panel 1 -->
	<div class="panel panel-danger">
		<div class="panel-heading">
			<h4><%=session.getAttribute("userName")%></h4>
			<p><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Sorry to say, You have failed in this module.</p>
			
			  <p>
		          Kindly prepare and give the retest.
		        </p>
		</div>
		<div class="panel-body">
		    <h4>Your Score Card for this module:</h4>
		    
		    
			    	<ul class="list-group">
					    <li class="list-group-item">Score: <%= request.getAttribute("percentage")%>%</li>
					    <li class="list-group-item">Correct replies: <%=((static_question)session.getAttribute("exam_counter")).score %></li>
					    <li class="list-group-item">Passing Criteria: 70%</li>
					</ul>
		    <% 	String s = ((static_question)session.getAttribute("exam_counter")).exam_report;
		%>
		</div>
	</div>
	<%
}%>




<!--Panel 2 -->
<div class="panel panel-primary">
	<div class="panel-heading">
		<h4>Questions Report:</h4>
		
	</div>
  <ul class="list-group">
  <%String s = ((static_question)session.getAttribute("exam_counter")).exam_report; %>
   <c:forTokens items="<%=s%>"  delims="," var="question_report" >	   
   	 <li class="list-group-item"> <c:out value="${question_report}"/></li>
   </c:forTokens>
  </ul>
</div>


</div> 
<jsp:include page="footer.jsp"></jsp:include>

<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.4.1/holder.js" type="text/javascript"></script>

</body>
</html>