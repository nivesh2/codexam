<%@page import="support.static_question"%>
<%@ page import="pkg.*"%>
		
		<%@ page import="java.util.ArrayList"%>
		<%
		static_question exam_obj = new static_question();
		session.setAttribute("exam_counter",exam_obj);
		
		%>
		<h3>Topics:</h3>
		
		<div class="container">
		 <div class="row">
			<%
			System.out.println((String)session.getAttribute("company"));
			ArrayList<topic_bean> al = javadb.getTopic((String)session.getAttribute("company"));
			
			for(topic_bean obj :al){
			%>
			
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail">
			      <img data-src="holder.js/200x200" alt="topicImage">
			      <div class="caption">
			        <h3><%=obj.topicName%></h3>
			        <button type="button" data-toggle="modal" data-target="<%="#"+obj.topicId%>" class="btn btn-primary topic_button" "  >Select</button>			      
			      </div>
			    </div>
			  </div> 
			  
			 <!-- Modal -->
			<div class="modal fade" id="<%=obj.topicId%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h4 class="modal-title" id="myModalLabel"><%=obj.topicName%></h4>
			      </div>
			      <div class="modal-body">
			     <%=obj.description%>
			     <h3>Select level</h3>
			     <% 
			     ArrayList<level_bean> al_level = javadb.getLevel(obj.topicId);
			     for(level_bean obj_level :al_level)
			     {
			     %>
			     <p> <a href="question_page.jsp?topicId=<%=obj.topicId%>&levelId=<%=obj_level.levelId%>&topicName=<%=obj.topicName%>&levelType=<%=obj_level.levelType%>" class="btn btn-default" id="<%=obj_level.levelId%>"> Level <%=obj_level.levelType %></a> </p> 			    		     
			     <%
				 }
			     %>
			      </div>
			      <div class="modal-footer">			         
			        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div> 
			<%
			}
			%>
			 </div> <!-- row -->
	 
		
			</div> <!--Container closed  -->