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

 @WebServlet("/add_question_servlet")
public class add_question_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 question_bean obj = new question_bean();
		
		 
		 String levelId=request.getParameter("levelId");
		 String topicId=request.getParameter("topicId");
		
		 String pattern = "Q"+levelId;
		 
		 obj.setQuesId(javadb.getId(pattern, "questionTable"));
		 obj.setQuestion(request.getParameter("question"));
		 obj.setAns(request.getParameter("ans"));
		 obj.setOpt_a(request.getParameter("a"));
		 obj.setOpt_b(request.getParameter("b"));
		 obj.setOpt_c(request.getParameter("c"));
		 obj.setOpt_d(request.getParameter("d"));
		 
		
		 
		 obj.setLevelId(levelId);
		 obj.setTopicId(topicId);
		 
		 Connection con = javadb.getConn();

			if (javadb.addQuestion(obj, con)) {
				RequestDispatcher rd = request.getRequestDispatcher("add_question.jsp?topicName="+request.getParameter("topicName")+"&topicId="+topicId+"&levelId="+levelId+"");
				 request.setAttribute("msg", "Question Added!");
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}rd.forward(request, response);
				
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("add_question.jsp?topicName="+request.getParameter("topicName")+"&topicId="+topicId+"&levelId="+levelId+"");
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
