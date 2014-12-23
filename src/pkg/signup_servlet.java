package pkg;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;

/**
 * Servlet implementation class singup_servlet
 */
@WebServlet("/singup_servlet")
public class signup_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "uploadFiles";
	 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user_bean obj =  new user_bean();
		
		String pattern ="U"+request.getParameter("name");
		String id = javadb.getId(pattern, "userTable");
		System.out.println(id);
		obj.setId(id);
		obj.setName(request.getParameter("fullname"));
		obj.setPassword(request.getParameter("password"));
		obj.setDob(request.getParameter("dob"));
		obj.setEmailId(request.getParameter("email"));
		obj.setPhoneNo(request.getParameter("phoneno"));		
		obj.setCompany(request.getParameter("company"));
		obj.setAddress(request.getParameter("address"));
		obj.setUserType(request.getParameter("userType"));
		obj.setUname(request.getParameter("name"));
		System.out.println("***Name---"+request.getParameter("name"));
		 
		 
		//admin status is false by default
		
		Connection con = javadb.getConn();

		if (javadb.AddUser(obj, con)) {
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			request.setAttribute("msg", "Enter Credentials to Login!");
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}rd.forward(request, response);
			
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			request.setAttribute("msg", "Incomplete fields!!!");
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}rd.forward(request, response);		
		}
		
		
		
	}

	 
	

}
