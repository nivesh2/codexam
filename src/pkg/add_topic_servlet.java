package pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;
 
@WebServlet("/add_topic_servlet")
public class add_topic_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 topic_bean obj_topic = new topic_bean();
		 level_bean obj_level = new level_bean();
		 System.out.println("1");
		 
		 if (request.getParameter("addTopic").equals("true")) {
			 System.out.println("2");
			 
			 String pattern= "T"+request.getParameter("userId");
			 String topicId=javadb.getId(pattern, "topicTable");
			 
			 pattern= "L"+request.getParameter("userId");			 
			 String levelId=javadb.getId("l", "levelTable");		 
			 
			 obj_topic.setUserId(request.getParameter("userId") );
			 obj_topic.setCompany(request.getParameter("company"));
			 obj_topic.setDescription(request.getParameter("description"));
			 obj_topic.setTopicName(request.getParameter("topicName"));
			 obj_topic.setTopicId(topicId);
			 obj_level.setLevelId(levelId);
			 obj_level.setLevelType(request.getParameter("levelType"));
			 
			 Connection con = javadb.getConn();

				if (javadb.addTopic(obj_topic,obj_level, con)) {
					RequestDispatcher rd = request.getRequestDispatcher("add_question.jsp?topicName="+request.getParameter("topicName")+"&topicId="+topicId+"&levelId="+levelId+"");
					
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}rd.forward(request, response);
					
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("add_topic.jsp");
					request.setAttribute("msg", "Incomplete fields!!!");
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}rd.forward(request, response);		
				}
		} else {
			
			 
			 String pattern= "L"+request.getParameter("userId");			 
			 String levelId=javadb.getId(pattern, "levelTable");		 
			 String topicId=request.getParameter("topicId");
			
			 obj_level.setTopicId(topicId);
			 obj_level.setLevelId(levelId);
			 obj_level.setLevelType(request.getParameter("levelType"));
			 System.out.println("0");
			 Connection con = javadb.getConn();

				if (javadb.add_level(obj_level, con)){
					RequestDispatcher rd = request.getRequestDispatcher("add_question.jsp?topicName="+request.getParameter("topicName")+"&topicId="+topicId+"&levelId="+levelId+"");
					request.setAttribute("topicId", request.getParameter("topicId"));
					request.setAttribute("levelId", levelId);
					
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}rd.forward(request, response);
					
				}
				else {
					System.out.println("4");
					 
					RequestDispatcher rd = request.getRequestDispatcher("add_topic.jsp");
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

}
