<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String currentName="";
String currentRole="";
String department="";
String addRequestStatus="";

if(session !=null){
	
	currentName = session.getAttribute("name").toString();
	currentRole = session.getAttribute("role").toString();
	department = session.getAttribute("dept").toString();
	addRequestStatus = request.getAttribute("addstatus").toString();

	System.out.println("Session Name:"+currentName+" Session Role:"+currentRole);
	
	if(addRequestStatus.equals("successful")){
	%>
	<script>
	  alert("Request Added Successfully")
	</script>
	
	<%
	}else{
		%>
		<script>
		 alert("Some Error Has Occured in Adding Deployment Request")
		</script>
		<%
	}
	
	}else{
		response.sendRedirect("start");
	}

	
	response.sendRedirect("requestreport");

%>

</body>
</html>