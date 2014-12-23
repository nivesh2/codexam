package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class update_profile_servlet
 */
@WebServlet("/update_profile_servlet")
public class update_profile_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	    {
			try {
				Connection con=javadb.getConn();
				user_bean obj=new user_bean();
				boolean isAdmin= (Boolean)request.getSession(false).getAttribute("isAdmin");
				
			
			
			if(request.getParameter("changePassword").equalsIgnoreCase("false"))
			{
			obj.setId(request.getParameter("userId"));
			obj.setName(request.getParameter("userName"));  
			obj.setCompany(request.getParameter("company"));
			obj.setPhoneNo(request.getParameter("phoneNo"));
			obj.setAddress(request.getParameter("address")); 	
			
			
			if(javadb.updateProfile(con, obj))
			{
				System.out.println("updated");
				if (isAdmin) {
					response.sendRedirect("admin_dashboard.jsp");					
				} else {
					response.sendRedirect("dashboard.jsp");
				}
			}
			else
			{
				response.sendRedirect("account_settings.jsp");
				System.out.println("Not Updated");
				
			}
			
			
			}
			else{
			//change password code
				if (isAdmin) {
					response.sendRedirect("admin_dashboard.jsp");					
				} else {
					response.sendRedirect("dashboard.jsp");
				}
				
			}
			con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

}
