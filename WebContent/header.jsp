<!-- Fixed navbar -->

<% String home;


if(((Boolean)session.getAttribute("isAdmin"))){

home = "admin_dashboard.jsp";
}
else{
home = "dashboard.jsp";
}

 %>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" >CodeXam</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<%=home%>">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="view_profile.jsp">View Profile</a></li>
                <% if(!(Boolean)session.getAttribute("isAdmin")){                
                 %>
                <li><a href="assessments_display.jsp">My Assessments</a></li>
                <%} %>
               <!-- <li><a href="#topics">Topics</a></li> --> 
                <li><a href="account_settings.jsp">Account Settings</a></li>
                <li><a href="change_password.jsp">Change Password</a></li>
             
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
