<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/navbar-top-fixed.css" rel="stylesheet">
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>


<body>
<%

String username = session.getAttribute("name").toString();
String email = session.getAttribute("email").toString();
String sessionrole = session.getAttribute("role").toString();

String creationTime = new java.text.SimpleDateFormat("dd-MMM-yyy HH:mm").format(new java.util.Date(session.getCreationTime()));
%>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><%=username%></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home">Home</a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link" href="create">Create Request</a>
        </li> -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false">Data Entry</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<%
							if (sessionrole.equals("DevManager")) {
							%>
							<li><a class="dropdown-item" href="register">Register New User</a></li>
							<li><a class="dropdown-item" href="addproject">Add New Project</a></li>
							<%
							}
							%>
							
							<li><a class="dropdown-item" href="create">Create Request</a></li>
							<li><a class="dropdown-item" href="#" onclick="javascript:window.open('changepass.jsp','popup2','width = 500, height = 500')">Change Password</a></li>
						</ul>
					</li>


					<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Reports</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown01">
              <li><a class="dropdown-item" href="requestreport">Pending Request</a></li>
              <li><a class="dropdown-item" href="deployreport">All Deployments</a></li>
              <li><a class="dropdown-item" href="projects">Project Master</a></li>
              <li><a class="dropdown-item" href="users">User Master</a></li>
            </ul>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="logout?email=<%=email%>">Logout</a>
         
        </li>
        <li class="nav-item">Login Time:<%=creationTime %></li>
        
          
        
        
        
      </ul>
     <!--  <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
    </div>
  </div>
   <a class="navbar-brand" href="#">Deployment Approval</a>
</nav>

<!-- <main class="container">
  <div class="bg-light p-5 rounded">
    <h1>Navbar example</h1>
    <p class="lead">This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>
    <a class="btn btn-lg btn-primary" href="../components/navbar/" role="button">View navbar docs &raquo;</a>
  </div>
</main> -->

</body>
</html>