<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="pkg.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% request.setAttribute("topicId",request.getParameter("topicId"));
   request.setAttribute("levelId",request.getParameter("levelId"));
   try{
   Connection con = javadb.getConn();
   javadb.delete_level(request.getParameter("topicId"),request.getParameter("levelId"),con);
   con.close();
   request.getRequestDispatcher("admin_dashboard.jsp").forward(request,response);
   }catch(Exception e){}
 %>


</body>
</html>