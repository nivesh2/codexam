<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="test.css">
<title>Add Question</title>
</head>
<body>

<div class="container">
		
  
  		<div class="page-header">
 		 <h1><%=request.getParameter("topicName") %> <small>Add Question</small> </h1>
		</div>
		<% 
		String msg = (String)request.getAttribute("msg");
		if(msg!=null)
		{
		if(msg.equals("Question Added!"))
			{
			%>
				<div class=" alert-div">
					<div	class="alert  alert-success" role="alert">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
			  		<span class="sr-only">Success:</span>
			<%
			out.print(msg );
			 %>
			 
			 		</div>
			 	</div>
			 <%
		 	}else{
  		 %>
  
				<div class=" alert-div">
					<div	class="alert  alert-danger" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			  		<span class="sr-only">Error:</span>
			<%
			out.print(msg );
			 %>
			 
			 		</div>
			 	</div>
			 <%
  
 		 	}
 		 } %>
<form action="add_question_servlet" method="post">
<input name="topicId" type="hidden" value="<%=request.getParameter("topicId")%>"/>
<input name="levelId" type="hidden" value="<%=request.getParameter("levelId")%>"/>
<input name="topicName" type="hidden" value="<%=request.getParameter("topicName") %> "/>

 	<label>QUESTION</label>	 
		<input  class="form-control" required  type="text" name="question" >			  
	<br/>
 
 	<label>OPTION A </label>	 
		<input  class="form-control" required  type="text" name="a" >			  
	<br/><label>OPTION B</label>	 
		<input  class="form-control" required  type="text" name=b >			  
	<br/><label>OPTION C</label>	 
		<input  class="form-control" required  type="text" name="c" >			  
	<br/><label>OPTION D </label>	 
		<input  class="form-control" required  type="text" name="d" >			  
	<br/>
 
 	<label>CORRECT ANSWER </label>	
 	 
	 <select name="ans" class="form-control" >
	    <option value="A">A</option>
	    <option value="B">B</option>
	    <option value="C">C</option>
	    <option value="D">D</option>
	 </select> <br>
	 <input class="btn btn-primary" name="ADD" type="submit" value="Add">    
	<a type="button" class="btn btn-default pull-right" href="admin_dashboard.jsp">Done</a>
      </form>

</div>



    <jsp:include page="footer.jsp"></jsp:include>
    	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>