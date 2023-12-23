<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%!
    Connection conn = null;
    Statement st1 = null;
    Statement st2 = null;
    
    String department = "";
    
    //String sessiondept = session.getAttribute("dept").toString();
   
    String list ="";
    String project ="";
    
    %>
    <%
    try{
    	
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
    	conn = DriverManager.getConnection("jdbc:mysql://localhost/DeploymentApproval","ashish","Ashish@1992");
    	
    	st1  = conn.createStatement();
    	st2  = conn.createStatement();
    	
    	department = request.getParameter("dept");
    	
    	if(department.equals("All")){
    		department="";
    	}
    	
    	list +="<option value='All' selected>All</option>";
    	
    	
    	//String sql = "select distinct(SystemName) from SystemMaster where Department like '%"+department+"%'";
    	String sql = "select distinct(project_name) from project_master where department like '%"+department+"%'";
    	System.out.println("sql--->"+sql);
    	ResultSet rs= st1.executeQuery(sql);
    	while(rs.next()){
    		//project = rs.getString("SystemName");
    		project = rs.getString("project_name");
    		list += "<option value='"+project+"'>"+project+"</option>";
    	}
    	 
    	System.out.println("projectlist:"+list);
    	
    	session.setAttribute("projects",list);
    	
    	out.print(list);
    	
    	
    	
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	if(conn!=null){
    		conn.close();
    	}
    }
    	
    	%>