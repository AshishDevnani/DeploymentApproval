<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%!
    Connection conn = null;
    Statement st1 = null;
    Statement st2 = null;
    
    String projectname = "";
    String path="";
    String serverip="";
    String details ="";
    
    %>
    <%
    try{
    	
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
    	conn = DriverManager.getConnection("jdbc:mysql://localhost/DeploymentApproval","ashish","Ashish@1992");
    	
    	st1  = conn.createStatement();
    	st2  = conn.createStatement();
    	
    	projectname = request.getParameter("proj");
    	
    	//String sql = "select * from SystemMaster where SystemName='"+projectname+"'";
    	String sql = "select * from deployment_path where project_name='"+projectname+"'";
    	System.out.println("sql--->"+sql);
    	ResultSet rs= st1.executeQuery(sql);
    	if(rs.next()){
    		path = rs.getString("deployment_path");
    		serverip = rs.getString("serverip");
    	}
    	details = serverip.trim()+"#"+path.trim();
    	
    	out.print(details);
    	
    	
    	
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	if(conn!=null){
    		conn.close();
    	}
    }
    	
    	%>