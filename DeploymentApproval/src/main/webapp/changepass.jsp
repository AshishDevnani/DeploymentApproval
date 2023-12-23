<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
function compareoldpass(){
	//alert("in compareoldpass()")
	existPassword = document.getElementById("epass").value;
	
	if(existPassword==""){
		alert("Existing Password Cannot be Empty");
		return false;
	}
	
	newPassword = document.getElementById("newpass").value;
	if(newPassword==""){
		alert("New Password Cannot be Empty");
		return false;
	}
	
	if(existPassword==newPassword){
		alert("New Password Cannot be same as Old Password");
		document.getElementById("newpass").value="";
		return false;
	}
	
	return true;
	
}

function comparenewpass1(){
	newPassword = document.getElementById("newpass").value;
	if(newPassword==""){
		alert("New Password Cannot be Empty");
		return false;
	}
	
	newPassword1 = document.getElementById("newpass1").value;
	if(newPassword1==""){
		alert("Retype Password Cannot be Empty");
		return false;
	}
	
	if(newPassword!=newPassword1){
		alert("New password should be same as re-typed password");
		document.getElementById("newpass").value="";
		document.getElementById("newpass1").value="";
		return false;
	}
	
	return true;
	
}
</script>
</head>
<body>
<div align="center">
	<h3>Change Password</h3>
</div>

<%

if(request.getAttribute("updatestatus")!=null){

int update = (int)request.getAttribute("updatestatus");

if(update>=1){
%>
<script>
	alert("Password Updated Successfully");
	window.close(this);
</script>
<% }else{ %>
	<script>
	alert("Some Problem in Update Password");
	window.close(this);
	</script>
<%
}

}
%>
 <div class="card-body card">
<form action="updateuserpassword" method="post">
<input  type="hidden" name="contractid" id="contractid" value="<%=session.getAttribute("contractid").toString() %>">
<div class="row mb-2">
						  <div class="col-md-4">
						  <label for="basicSelect">Email:</label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="text" name="email" id="email" value="<%=session.getAttribute("email").toString() %>" readonly>
						    </div>
						 </div>
						
                        <div class="col-md-4">
							<label for="basicSelect">Existing Password: </label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="password" name="epass" id="epass">	
						   </div>
						</div>
			</div>
			<div class="row mb-2">
						
						 <div class="col-md-4">
							<label for="basicSelect">New Password: </label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="password" name="newpass" id="newpass" onblur="compareoldpass()"> <!-- compare old password with new should be different  -->	
						   </div>
						</div>
						
						<div class="col-md-4">
							<label for="basicSelect">Retype New Password: </label>
							<div class="input-group input-group-merge">
							<input class="form-control" type="password" name="newpass1" id="newpass1" onblur="comparenewpass1()">	<!-- compare new password with retyped password both new should be same  -->
						   </div>
						</div>
                          
             </div>
             <div class="row mb-2">
               <button class="w-100 btn btn-lg btn-primary" type="submit">Submit</button>
             </div>
             </form>
             </div>
</body>
</html>