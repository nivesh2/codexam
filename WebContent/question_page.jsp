<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="support.*" %>  
<%@ page import="pkg.*" %>    
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
 
<link rel="stylesheet" href="test.css">
 

<title>Exam</title>
</head>
<body>
 
	<%
	String topicId=request.getParameter("topicId");
	String levelId=request.getParameter("levelId");
	String topicName=request.getParameter("topicName");
	String levelType=request.getParameter("levelType");
		
	ArrayList<question_bean> al = javadb.getQuestion(topicId,levelId);
	int index = ((static_question)session.getAttribute("exam_counter")).index;

	%>
	
	 
<div class = "container">

	<div class="page-header">
  		<h1><%=topicName %>  <small>Exam, Level:<%=levelType %> </small> <small class="pull-right">sec: <span class="text-danger " id="timer">5</span></small> </h1>
	</div>	
	
	<div class="panel panel-default">
  		<div class="panel-heading">
     		<h2 class="panel-title"><label><%=(index+1)+". " +al.get(index).getQuestion()%></label><br></h2>	
  		</div>
  		
 	<div class="panel-body">
  
		<form id="question_form" action="exam_servlet" method="post">
		   <input type="hidden" value="<%=topicId%>" name="topicId" />
	       <input type="hidden" value="<%=levelId%>" name="levelId" />
	       <input type="hidden" value="<%=topicName%>" name="topicName" />
	       <input type="hidden" value="<%=levelType%>" name="levelType" />
	       <input type="hidden" value="<%=al.size()%>" name="ques_length" />
	       <input type="hidden" value="<%=al.get(index).getAns()%>" name="ans" />
	    	
	      
		    <div class="radio">
		     <label><input name="opt" type="radio" value="A"><%=al.get(index).getOpt_a()%></label>
		    </div>
		    <div class="radio"> 
		    <label><input name="opt" type="radio" value="B"><%=al.get(index).getOpt_b()%></label>		      
		    </div>
		    <div class="radio">
		        <label><input name="opt" type="radio" value="C"><%=al.get(index).getOpt_c()%></label>		   
		     </div>
			 <div class="radio">
		      <label><input name="opt" type="radio" value="D"><%=al.get(index).getOpt_d()%></label> 
			</div>
			
			<button name="submit" id="next" type="submit" class="btn btn-default pull-left " value="next">Next ></button>		
			<button name="submit" type="submit" class="btn btn-primary pull-right " value="submit">Submit</button>
		</form>
    </div><!-- panel body -->
	</div><!-- panel   -->
</div><!-- Container -->

<jsp:include page="footer.jsp"></jsp:include>
	

<!-- Latest compiled and minified JavaScript -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="timer.min.js"></script>
<script src="exam_codexam.js"></script>



</body>
</html>