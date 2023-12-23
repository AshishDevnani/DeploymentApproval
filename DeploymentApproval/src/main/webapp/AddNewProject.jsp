<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">

<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Insert title here</title>
<script>
function validate(){
	ProjectName = document.getElementById("ProjectName").value;
	DeploymentPath = document.getElementById("DeploymentPath").value;
	ServerIP = document.getElementById("ServerIP").value;
	Department = document.getElementById("Department").value;
	
	if(ProjectName==""){
		alert("Project Name cannot be empty");
		return false;
	}
	
	if(DeploymentPath==""){
		alert("Deployment Path cannot be empty");
		return false;
	}
	
	if(ServerIP==""){
		alert("Server IP cannot be empty");
		return false;
	}
	
	if(Department=="Select"){
		alert("Please select valid Department");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<div class="card">
	<h3 align="center">Add New Project</h3>
</div>

                 <div class="card-body card">
                 <form action="addprojectaction" onsubmit="return validate()" method="post">
								<div class="row col-12">
										  <div class="col-6">
												<div class="md-2">
												<span style="color:red;">*</span>
													<label for=" First Name:-" class="tcolor"><b>Project Name</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder=" Enter Project Name" name="ProjectName" id="ProjectName" >
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
												<span style="color:red;">*</span>
													<label for="" class="tcolor"><b>Deployment Path</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"       
															placeholder="Please enter Deployment Path" name="DeploymentPath" id="DeploymentPath"  ><!--pattern="^[a-z0-9](\.?[a-z0-9]){5,}@bayer\.com$"  -->
													</div>
												</div>
											</div>
										</div>
										<div class="row col-12">
										  <div class="col-6">
												<div class="md-2">
												<span style="color:red;">*</span>
													<label for=" First Name:-" class="tcolor"><b>Server IP</b></label><br>
													<div class="input-container">
														<input class="form-control" type="text"
															placeholder=" Enter Server IP" name="ServerIP" id="ServerIP" >
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="md-2">
												<span style="color:red;">*</span>
													<label for="" class="tcolor"><b>Department</b></label><br>
													<div class="input-container">
														<select class="form-select"  name="Department" id="Department" ><!--pattern="^[a-z0-9](\.?[a-z0-9]){5,}@bayer\.com$"  -->
														<option value="Select" selected>Select</option>
														<option value="Software">Software</option>
														<option value="Embedded">Embedded</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										 <div class="d-grid gap-2 col-4 mx-auto mt-2">
												<button class="btn btn-primary btn2" type="submit">Submit Form</button>
											</div>
                                   
                                   </form>
                                   </div>
                                   
     

</body>
</html>