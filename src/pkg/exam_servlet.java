package pkg;

import support.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/exam_servlet")
public class exam_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String ans = request.getParameter("ans");
		String opt= request.getParameter("opt");
		String topicId=request.getParameter("topicId");
		String topicName=request.getParameter("topicName");
		String levelId=request.getParameter("levelId");		
		String levelType=request.getParameter("levelType");		
		float percentage=0.00f;
		int ques_length=Integer.parseInt(request.getParameter("ques_length"));
		
		int index=((static_question)request.getSession(false).getAttribute("exam_counter")).index;
		
		((static_question)request.getSession(false).getAttribute("exam_counter")).index++;		
		index++;
		
		
		
		String url=null;
		 
		if( request.getParameter("submit").equals("next") ){
		
			if (ans.equalsIgnoreCase(opt) ) {
				//correct count
				((static_question)request.getSession(false).getAttribute("exam_counter")).score++;
				 
				((static_question)request.getSession(false).getAttribute("exam_counter")).exam_report+="Question"+index+" Correct,";
				
			} else {
				//incorrect count
				((static_question)request.getSession(false).getAttribute("exam_counter")).exam_report+="Question"+index+" Incorrect,";
				
			}
			
			
			if (index ==ques_length) {
				//----------------------------------Paper end
				int score =((static_question)request.getSession(false).getAttribute("exam_counter")).score;
				
				String userId = ((String)request.getSession(false).getAttribute("userId"));
				String pattern = "AS"+userId;
				//-object created
				assessment_bean obj_assessment = new assessment_bean();
				obj_assessment.setUserId(pattern);
				obj_assessment.setAssessmentId(javadb.getId("as", "assessmentTable"));
				obj_assessment.setTopicName(topicName);
				obj_assessment.setLevelType(levelType);
				obj_assessment.setScore(score);
				
				//percentage manipulation
				percentage = (float)(score *100)/ ques_length;
				if ( percentage>=70.0) {
					obj_assessment.setResult("Pass");
					request.setAttribute("result", "Pass");
				} else {
					obj_assessment.setResult("Fail");
					request.setAttribute("result", "Fail");
				}
				
				//inserting into database
				insert_into_assessment(obj_assessment);
				url = "result_page.jsp?topciId="+topicId+"&levelId="+levelId+"";
			} else {
				url = "question_page.jsp?topciId="+topicId+"&levelId="+levelId+"&topciName="+topicName+"&levelType="+levelType+"";
			}
			
			
		}
		else if(request.getParameter("submit").equals("submit")){
			// insert test details in myAssessment table.
			
			//checking if selected option is correct or incorrect
			if (ans.equalsIgnoreCase(opt) ) {
				//correct count
				((static_question)request.getSession(false).getAttribute("exam_counter")).score++;
				 
				((static_question)request.getSession(false).getAttribute("exam_counter")).exam_report+="Question"+index+" Correct,";
				
			} else {
				//incorrect count
				((static_question)request.getSession(false).getAttribute("exam_counter")).exam_report+="Question"+index+" Incorrect,";
				
			}
			 
			//update the exam_report variable
			
			for( index++ ;index<=ques_length;index++){
				((static_question)request.getSession(false).getAttribute("exam_counter")).exam_report+="Question"+index+" Incorrect,";				
			}
		//	((static_question)request.getSession(false).getAttribute("exam_counter")).index=index;	
			
			
			//-------------------------------Paper end
			int score =((static_question)request.getSession(false).getAttribute("exam_counter")).score;
			
			//-object created
			assessment_bean obj_assessment = new assessment_bean();
			obj_assessment.setUserId(((String)request.getSession(false).getAttribute("userId")));
			obj_assessment.setAssessmentId(javadb.getId("as", "assessmentTable"));
			obj_assessment.setTopicName(request.getParameter("topicName"));
			obj_assessment.setLevelType(request.getParameter("levelType"));
			obj_assessment.setScore(score);
			
			//percentage manipulation
			percentage = (float)(score *100)/ ques_length;
			
			if ( percentage>=70.0) {
				obj_assessment.setResult("Pass");
				request.setAttribute("result", "Pass");
			} else {
				obj_assessment.setResult("Fail");
				request.setAttribute("result", "Fail");
			}
			
			//inserting into database
			insert_into_assessment(obj_assessment);
		
			
			url = "result_page.jsp?topciId="+topicId+"&levelId="+levelId+"";
				
			
		}
		
		request.setAttribute("percentage", percentage);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
		
	}
	
	private void insert_into_assessment(assessment_bean obj_assessment){
		try {
			Connection con = javadb.getConn();
			javadb.addTestDetails(obj_assessment, con);
			
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			System.out.println("***** Exam_Servlet Insert Assessment"+e.toString());
			}
	}

}
