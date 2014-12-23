<%@page import="pkg.javadb"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logout</title>
</head>
<body>

<%

if(request.getParameter("superAdmin")!=null){
session.invalidate();
response.sendRedirect("home.jsp");

}
else{
Connection con = javadb.getConn();


System.out.println("last login updated"+javadb.updateLastLogin(con,(String)session.getAttribute("userId")));


session.invalidate();
response.sendRedirect("home.jsp");
con.close();
} %>
</body>
</html>