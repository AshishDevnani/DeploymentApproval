package springboot.deploy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import springboot.deploy.dao.Projectdao;
import springboot.deploy.entities.Project;

@Component
public class ProjectService {
	
	@Autowired
	Projectdao projectdao;
	

	  public boolean SaveNewProject(Project project) {
		  boolean flag = false;
		  
		 Project p = projectdao.save(project);
		 
		 if(p==null) {
			 flag = false;
		 }else {
			 flag = true;
		 }
		  
		  return flag;
		  
	  }
	  
	  public List<Project> GetAllProjects(){
		  List<Project> projects = projectdao.findAll();
		  
		  return projects;
	  }
	  
	  public boolean update(int id,String projname,String path,String ip) {
		  boolean flag = false;
		  
		  int s = 0;
		  s = projectdao.updateProject(projname, path, ip, id);
		  
		  if(s>=1) {
			  flag = true;
		  }else {
			  flag = false;
		  }
		  
		  return flag;
	  }

}
