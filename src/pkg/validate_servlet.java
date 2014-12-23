package pkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/validate_servlet")
public class validate_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userName = request.getParameter("userid");
		 String password = request.getParameter("password");
		 System.out.println("UserName:" + userName);
		 HttpSession session = request.getSession(true);
		 if(userName.equals("superAdmin") && password.equals("superAdmin")){
			 session.setAttribute("userName", "Super Admin");				
			 response.sendRedirect("super_admin_dashboard.jsp");
			 
		 }else{
			 
		
		 
		 Connection con = javadb.getConn();
		 
		 try{
	        user_bean obj = javadb.login_User(userName, password, con);
			if (obj!=null) {
				
				session.setAttribute("userId", obj.getId());
				session.setAttribute("userName", obj.getUname());				
				session.setAttribute("company", obj.getCompany());
				session.setAttribute("userData", obj);
				
				if (obj.getUserType().equalsIgnoreCase("admin")) {
					System.out.println("Admin");
				
					if (obj.getAdmin_status().equalsIgnoreCase("T")) {
						
						session.setAttribute("isAdmin", true);
						request.getSession(false).setAttribute("msg", "Welcome");
						response.sendRedirect("admin_dashboard.jsp");
					} else {
						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						request.setAttribute("msg", "You are not authorised to access your dashboard!");	
						rd.forward(request, response);	
					}
					
					
				} else {
					System.out.println("User");
					session.setAttribute("isAdmin", false);
					request.getSession(false).setAttribute("msg", "Welcome");
					response.sendRedirect("dashboard.jsp");
					
				}
			
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				request.setAttribute("msg", "Invalid Id or password!");
				 
				
			 
				rd.forward(request, response);		
			}
			
			con.close();
		}catch (Exception e) {
		System.out.println("***********ERROR Login");
		}
		 }// else closed
	}// function closed

}// class closed
