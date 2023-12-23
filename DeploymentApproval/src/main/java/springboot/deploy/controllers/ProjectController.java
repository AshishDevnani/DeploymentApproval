package springboot.deploy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springboot.deploy.entities.Project;
import springboot.deploy.services.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService projectservice;
	
	@GetMapping("/addproject")
	public String AddNewProject(Model model) {
		return "AddNewProject";
	}
	
	@PostMapping("/addprojectaction")
	public ModelAndView AddProjectAction(@ModelAttribute("Project") Project project) {
		ModelAndView m = new ModelAndView();
		
		System.out.println(project);
		
		String status = "";
		
        boolean flag = projectservice.SaveNewProject(project);
		
		if(flag==true) {
			status="successful";
		}else {
			status="failure";
		}
		
		List<Project> projects = projectservice.GetAllProjects();
		
		m.addObject("projects",projects);
		m.addObject("addstatus", status);
		m.setViewName("ProjectMasterReport");
		
		
		
		return m;
	}
	
	@GetMapping("/projects")
	public String Projects(Model model) {
		
		List<Project> projects = projectservice.GetAllProjects();
		
		model.addAttribute("projects", projects);
		
		return "ProjectMasterReport";
		
	}
	
	@PostMapping("/projectupdate")
	public ModelAndView UpdateProject(@RequestParam("project") String project,@RequestParam("deppath") String path,@RequestParam("serverip") String serverip,@RequestParam("projectId") int projectId) {
		
		ModelAndView model = new ModelAndView();
		boolean flag = false;
		String status = "";
		
		flag = projectservice.update(projectId, project, path, serverip);
		
		if(flag==true) {
			status="successful";
		}else {
			status="failure";
		}
		
		List<Project> projects = projectservice.GetAllProjects();
		
		model.addObject("projects",projects);
		model.addObject("updtstatus", status);
		model.setViewName("ProjectMasterReport");
		
		return model;
	}

}
