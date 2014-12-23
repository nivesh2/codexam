package pkg;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/validate_admin_servlet")
public class validate_admin_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
  
 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			String validate=request.getParameter("validate");
			Connection conn=javadb.getConn();
			String userId=request.getParameter("userId");
			
			
			if(validate.equalsIgnoreCase("active"))
			{
				if(javadb.activateAdmin(userId,"T",conn))
				{
					response.sendRedirect("super_admin_dashboard.jsp");
				}
				else
				{
					System.out.println("In active method      false");
				}
			}
			else
			{
				if(javadb.activateAdmin(userId,"F",conn))
				{
					response.sendRedirect("super_admin_dashboard.jsp");
				}
				else
				{
					System.out.println("In Inactive method      false");
				}
			}
			System.out.println("hsgvhksg "+validate);
		}
}
