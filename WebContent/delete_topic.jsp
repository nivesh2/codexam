
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection"%>
<%@ page import="pkg.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
Connection con = javadb.getConn();
	
	if(javadb.deleteTopic(request.getParameter("topicId"),con)){
		con.close();
		response.sendRedirect("admin_dashboard.jsp");
	}else{
		con.close();
		out.println("Topic Not deleted");
	}

}catch(Exception e){
System.out.println("Error deleting topic." + e.toString());
}

 %>
</body>
</html>