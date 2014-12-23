<%@page import="support.static_question"%>
<%@ page import="pkg.*"%>
		
		<%@ page import="java.util.ArrayList"%>
		<%
		static_question exam_obj = new static_question();
		session.setAttribute("exam_counter",exam_obj);
		
		%>
		<div class="page-header">
 		 <h2>Topics Created: 	<a href="add_topic.jsp?addTopic=true" type="button" class="btn btn-default">Add New Topic <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> </a> </h2>
		</div>
		 
	
		
		<div class="container">
		 <div class="row">
			<%
			boolean flag=true;
			System.out.println((String)session.getAttribute("company"));
			ArrayList<topic_bean> al = javadb.getTopic((String)session.getAttribute("company"));
			
			for(topic_bean obj :al){
				flag=false;
			%>
			
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail">
			      <img data-src="holder.js/200x200" alt="topicImage">
			      <div class="caption">
			        <h3><%=obj.topicName%></h3>
			        <button type="button" data-toggle="modal" data-target="<%="#"+obj.topicId%>" class="btn btn-primary topic_button" "  >Select</button>
			        <a type="button" class="btn btn-danger pull-right" href="delete_topic.jsp?topicId=<%=obj.topicId%>" >Delete</a>
			              
			      			      
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
			     <div class="panel panel-info">
					  <!-- Default panel contents -->
					  <div class="panel-heading">Levels</div>	
					  
					  <!-- List group -->
					  <ul class="list-group">
					    <% 
			     ArrayList<level_bean> al_level = javadb.getLevel(obj.topicId);
			     for(level_bean obj_level :al_level)
			     {
			     %>			 
					  
					    <li class="list-group-item">
						<span>Level: <%=obj_level.levelType %>  </span> 
			        	 <a class="btn btn-default btn-sm" href="add_question.jsp?topicName=<%=obj.getTopicName() %>&topicId=<%=obj.topicId%>&levelId=<%=obj_level.levelId%>"  id="<%=obj_level.levelId%>">Add Questions</a> 		    		     
		  				 <a class="btn btn-danger btn-sm" href="delete_level.jsp?topicId=<%=obj.topicId%>&levelId=<%=obj_level.levelId%>"  id="<%=obj_level.levelId%>">Delete Level</a>  		    		     
		  			 	 
						</li>
					    
			     <%
				 }
			     %>
					  </ul><!-- list closed -->
					</div> <!--panel closed --> 
			      </div> <!-- modal body closed -->
			      <div class="modal-footer">			         
			        <a type="button" class="btn btn-default pull-left" href="add_topic.jsp?topicId=<%=obj.topicId%>&topicName=<%=obj.getTopicName()%>&addTopic=false" >Add level</a>
			        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div> 
			<%
			}// for closed
			
			if(flag){
				%>
				<h3>You have not created any topics yet.</h3>
				<%
			}
			%>
			 </div> <!-- row -->
	 
		
			</div> <!--Container closed  -->