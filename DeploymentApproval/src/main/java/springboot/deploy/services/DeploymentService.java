package springboot.deploy.services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import springboot.deploy.dao.Deploymentdao;
import springboot.deploy.dao.Projectdao;
import springboot.deploy.dao.Userdao;
import springboot.deploy.entities.DeploymentSheet;
import springboot.deploy.entities.Project;
import springboot.deploy.entities.User;

@Component
public class DeploymentService {
	
	@Autowired
	Deploymentdao deploydao;
	
	@Autowired
	Userdao userdao;
	
	
	public Deploymentdao getDeploydao() {
		return deploydao;
	}

	public void setDeploydao(Deploymentdao deploydao) {
		this.deploydao = deploydao;
	}

	public boolean saveDetails(DeploymentSheet deploy) {
		
		DeploymentSheet sheet  = deploydao.save(deploy);
		
		if(sheet==null) {
			return false;
		}else {
			return true;
		}
	}
	
	public List<DeploymentSheet> GetDeploymentRequest(String d1,String d2,String dept){
		List<DeploymentSheet> requests = new ArrayList<DeploymentSheet>();
		
		requests = deploydao.getPendingRequestsByEntryDateAndDept(d1, d2, dept);
		
		return requests;
	}
	
	public List<DeploymentSheet> GetDeploymentRequestByName(String d1,String d2,String dept,String name){
		
		List<DeploymentSheet> requests = new ArrayList<DeploymentSheet>();
		
		requests = deploydao.getPendingRequestsByDateDeptName(d1, d2, dept,name);
		
		return requests;
	}
	
	public int updateDeployReqStatus(String action,int id,String actionby) {
		int rows = 0;
		rows = deploydao.updateStatusForDeploymentRequest(action, id,actionby);
		return rows;
	}
	
   public List<DeploymentSheet> GetApproveRejectRequestByDate(String date1,String date2,String status){
		
		List<DeploymentSheet> deploys = null ;
		
		deploys = deploydao.getRequestsByEntryDate(date1,date2,status);
		
		System.out.println("in service class:"+deploys);
		
		return deploys;
	}
   
   
   public List<DeploymentSheet> GetDeploymentsByDetails(String date1,String date2,String department,String project,String name,String status){
	   
	   List<DeploymentSheet> sheet = null ;//new ArrayList<DeploymentSheet>();
	   
	   
	   if(status.equals("All")) {
	    	
		   System.out.println("In Status=All Condition");
		   
		   //skip status in query
		   sheet = deploydao.getRequests1(date1,date2,department,project,name);
		   
	    }
	   else if(name.equals("All")) {
	    	
		   System.out.println("In name=All Condition");
		   //skip name in query
		   sheet = deploydao.getRequests3(date1, date2, department, project, status);
		   
	    }
	    else if(department.equals("All")) {
	    	
	    	System.out.println("In department=All Condition");
	    	//skip department  in query
	    	sheet = deploydao.getRequests2(date1, date2, status, project, name);
	    
	    }
	    else if(project.equals("All")) {
	    	
	    	System.out.println("In project=All Condition");
	    	//skip project  in query
	    	sheet = deploydao.getRequests4(date1, date2, department, status,name);
	    
	    }else {
	    	
	    	//include all paramters in query
	    	sheet = deploydao.getApprovedRequests(date1, date2, department, project, name, status);
	    }
	    
	   return sheet;
   }
   
   public String getNamesList(String sessionname,String sessiondept,String role) {
	   String nameList="";
	   
	   Iterable<User> userlist = null;
	   
	   
	   
	   if(role.equals("DevManager")){ 
		   
		   nameList += "<option value='All'>All</option>";
		   
			//get all names registered
		    userlist =  userdao.findAll();
		    
		    for(User user : userlist) {
		    	nameList += "<option value='"+user.getName()+"'>"+user.getName()+"</option>";
		    }
		    
		 } 
	   else {
			/* Names of Embedded/Software Depending of sessiondept */
			if(role.equals("Developer")){ 
				nameList = "<option value='"+sessionname+"' selected>"+sessionname+"</option>";
			 }else{ 
				 
				 nameList += "<option value='All'>All</option>";
				 
				 userlist =  userdao.findByDepartment(sessiondept);
				    
				    for(User user : userlist) {
				    	nameList += "<option value='"+user.getName()+"'>"+user.getName()+"</option>";
				    }
			} 
	   }
		  
		
	   
	   return nameList;
	   
   }
   
   public String getProjectListByDepartmentName(String department) throws SQLException {
	   String projects="";
	   
	    Connection conn = null;
	    Statement st1 = null;
	    
	    
	    
	    String project ="";
	    
	    if(department.equals("All")){
    		department="";
    	}
	    
	    projects += "<option value='All'>All</option>";
	    
	    try{
	    	
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost/DeploymentApproval","ashish","Ashish@1992");
	    	
	    	st1  = conn.createStatement();
	    	
	    	String sql = "select distinct(SystemName) from SystemMaster where Department like '%"+department+"%'";
	    	System.out.println("sql--->"+sql);
	    	ResultSet rs= st1.executeQuery(sql);
	    	while(rs.next()){
	    		project = rs.getString("SystemName");
	    		projects += "<option value='"+project+"'>"+project+"</option>";
	    	}
	    	
	    }catch(Exception e){
	    	e.printStackTrace();
	    }finally{
	    	if(conn!=null){
	    		conn.close();
	    	}
	    }
	   
	   return projects;
   }
	
	
	  public List<DeploymentSheet> getDeploymentsByCondition(String sessionname,String sessiondept,String role , String date1 , String date2 , String status)
	  { 
		  List<DeploymentSheet> sheet = null;
	  
	  if(role.equals("DevManager")){
	     
		 sheet = deploydao.getRequestsByEntryDate(date1,date2,status);
	  
	  } else{
	  
	  if(role.equals("Developer")){
	  
		  sheet = deploydao.getRequestsByDateAndName(date1, date2, status, sessionname);
		  
	  }else{
		  
	      sheet = deploydao.getRequestsByDateAndDept(date1, date2, sessiondept, status);
	  
	  }
	  
	  }
	  
	  
	  return sheet; 
	  
	  }
	 
	  
  

}
