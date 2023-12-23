<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <% 
String username = session.getAttribute("name").toString();
String email = session.getAttribute("email").toString();
%>

<h3>Hello <%=username %> Login Successful!!!</h3>

<h5>Please <a href="create">Click Here</a> To Create A Deployment Request</h5>

<h5>Please <a href="requestreport">Click Here</a> To View Pending Deployment Requests</h5>

<h5>Please <a href="deployreport">Click Here</a> To View All Deployment Requests</h5>

<h3><a href="logout?email=<%=email%>">Click Here</a> to Logout</h3>
 --%></body>
</html>