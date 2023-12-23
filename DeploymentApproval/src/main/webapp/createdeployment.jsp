<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@include file="menu.jsp" %>
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Registration  Template · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

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
      
      body {
	background-image: url('images/registerbg.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	backdrop-filter: blur(5px);
}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
    
    
    <script>
    function getDetails(){
    	//console.log("in searchName function");
    	var val = document.getElementById("projectname").value;
    	alert("ProjectName:"+val);
    	
    	if(val == ""){
    		
    	}
    	else{
    	var ajaxRequest;
    	
    	ajaxRequest = new XMLHttpRequest();
    	
    	ajaxRequest.onreadystatechange=function(){
    		if(ajaxRequest.readyState==4){
    			
    			var reslt = ajaxRequest.responseText;
    			//alert("result:"+reslt);
    			var det = reslt.split("#");
    			//alert("details:"+det);
    			var ip = det[0];
    			//alert("Server IP:"+ip);
    			var path = det[1];
    			//alert("Path:"+path);
    			
    			document.getElementById("serverIP").value = ip.trim();
    			//alert("server ip set successfully");
    			document.getElementById("path").value = path.trim();
    			//alert("deployment path set successfully");
    			
    		}
    	}
    	var queryString = "?proj="+val;
    	ajaxRequest.open("GET","GetProjectDetails.jsp"+queryString,false)
    	ajaxRequest.send(null);
    	}
    	
    }
    </script>
  </head>
  <body class="text-center">
    <%!
    Connection conn = null;
    Statement st1 = null;
    Statement st2 = null;
    String developer = null;
    String project = null;
    Timestamp today = null;
    String tester="";
    String currentName ="";
    String currentRole="";
    String department="";
    
    %>
    <%
    try{
    	
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
    	conn = DriverManager.getConnection("jdbc:mysql://localhost/DeploymentApproval","ashish","Ashish@1992");
    	
    	st1  = conn.createStatement();
    	st2  = conn.createStatement();
    	
    	today = new Timestamp(new java.util.Date().getTime());
    	
    	System.out.println("today:"+today.toString());
    	
    	if(session !=null){
    	
    	currentName = session.getAttribute("name").toString();
    	currentRole = session.getAttribute("role").toString();
    	department = session.getAttribute("dept").toString();
    
    	System.out.println("Session Name:"+currentName+" Session Role:"+currentRole);
    	
    	}else{
    		response.sendRedirect("start");
    	}
    %>
    
    
<main class="form-signin">
  <form action="createrequest" method="post">
    <!-- <img class="mb-4" src="assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <h1 class="h3 fw-normal">Deployment Approval Request Form</h1>

    <div class="form-floating">
      <input type="text" name="pageName" class="form-control" id="pageName">
      <label for="floatingInput">Page Name</label>
    </div>
    <div class="form-floating">
      <textarea name="requirement" class="form-control" id="requirement"></textarea>
      <label for="floatingInput">Requirement</label>
    </div>
    <div class="form-floating">
      <textarea name="changes" class="form-control" id="changes"></textarea>
      <label for="floatingInput">Changes</label>
    </div>
    
    <div class="form-floating">
      
      <input type="text" name="developer" id="developer" value="<%=currentName%>" class="form-control" readonly>
      <label for="floatingInput">Developer</label>
    </div>
    
    <div class="form-floating">
      
      <select name="tester" class="form-select" id="tester">
      <%
      String sql1 = "select name from user_master";
      ResultSet rs1 = st1.executeQuery(sql1);
      while(rs1.next()){	  
    	  tester = rs1.getString("name");
      %>
      <option value="<%=tester%>"><%=tester %></option>
      
      <%}%>
      
      </select>
      <label for="floatingInput">Tester</label>
    </div>
    
    
    <div class="form-floating">
      
      <select name="projectname" class="form-select" id="projectname" onchange="getDetails()">
      <option value="">Select</option>
   <%  
      String sql2 = "select SystemName from SystemMaster";
      ResultSet rs2 = st2.executeQuery(sql2);
      while(rs2.next()){
    	  project = rs2.getString("SystemName");
    	  
     %>
      
      <option value="<%=project%>"><%=project %></option>
      <% } %>
      </select>
      <label for="floatingInput">Project Name</label>
    </div>
    
    <div class="form-floating">
       <input type="text" name="department" id="department" value="<%=department%>" class="form-control" readonly>       
       <label for="floatingInput">Department</label>
    </div>
    
   
     <div class="form-floating">
       <input type="text" name="serverIP" id="serverIP" class="form-control">       
       <label for="floatingInput">Server IP</label>
    </div>
    
     <div class="form-floating">
       <input type="text" name="path" id="path" class="form-control">       
       <label for="floatingInput">Path</label>
    </div>
    
      <div class="form-floating">
       <input type="text" name="parentId" id="parentId" class="form-control">       
       <label for="floatingInput">Parent Id</label>
    </div>
    
      <div class="form-floating">
       <input type="text" name="commitId" id="commitId" class="form-control">       
       <label for="floatingInput">Commit Id</label>
    </div>
    
    <input type="hidden" id="status" name="status" value="Pending">
    <input type="hidden" id="entrydate" name="entrydate" value="<%=today%>">
    <input type="hidden" id="actiondate" name="actiondate" value="-">
    <input type="hidden" id="actionby" name="actionby" value="-">
   
    <button class="w-100 btn btn-lg btn-primary" type="submit">Create Request</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2023</p>
  </form>
</main>
<%
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	if(conn!=null){
    		conn.close();
    	}
    }

%>

    
  </body>
</html>
