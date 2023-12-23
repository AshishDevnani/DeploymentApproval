package springboot.deploy.controllers;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import springboot.deploy.entities.DeploymentSheet;
import springboot.deploy.entities.Project;
import springboot.deploy.services.DeploymentService;

@Controller
public class DeploymentController {
	
	@Autowired
	DeploymentService deployservice;
	
	@GetMapping("/create")
	 public String createRecord(Model model) {
		 
		 return "createdeployment";
	 }
	
	
	@PostMapping("createrequest")
	public ModelAndView AddRequest(@ModelAttribute("deploy") DeploymentSheet deploy) {
		
		ModelAndView view = new ModelAndView();
		System.out.println(deploy);
		
		String status = "";
		
		boolean flag = deployservice.saveDetails(deploy);
		
		if(flag==true) {
			status="successful";
		}else {
			status="failure";
		}
		
		view.addObject("addstatus", status);
		view.setViewName("AddRequestAction");
		
		
		return view;
	}
	
	@GetMapping("requestreport")
	public ModelAndView PendingReportView(@RequestParam(name="fromDate",required=false) String fromDate,@RequestParam(name="toDate",required=false) String toDate,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String date1 =""; 
		String date2 =""; 
		String dept="",role="",name="";
		List<DeploymentSheet> deploylist = null;
		
		if(fromDate==null && toDate ==null) {
		
			fromDate = new SimpleDateFormat("01-MMM-yyyy").format(new java.util.Date());
			toDate = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
		
		}
		
		try {
			date1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDate));
			date2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(toDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			dept = session.getAttribute("dept").toString();
			role = session.getAttribute("role").toString();
			name = session.getAttribute("name").toString();
			
			if(role.equals("DeptHOD") || role.equals("DevManager")) {
				
				if(dept.equals("All")) {
					dept="";
				}
			
		         deploylist = 	deployservice.GetDeploymentRequest(date1, date2,dept);
		   
			}
			
			if(role.equals("Developer")) {
				
				   deploylist = deployservice.GetDeploymentRequestByName(date1, date2,dept,name);
			   
				}
		
		System.out.println("in controller class:"+deploylist);
		
		mav.addObject("requestlist", deploylist);
		mav.addObject("fromDate",fromDate);
		mav.addObject("toDate",toDate);
		mav.setViewName("DeploymentRequestReport");
		
		
		
		
		
		
		return mav;
	}
	
	@GetMapping("depappr")
	public ModelAndView UpdateApprovalStatus(@RequestParam("action") String action,@RequestParam("id") int id,@RequestParam("actionby") String actionby,@RequestParam("fdate") String from,@RequestParam("tdate") String to,HttpSession session) {
		System.out.println("Action:"+action);
		System.out.println("Id:"+id);
		
		String date1="";
		String date2="";
		String dept="";
		String role="";
		String name="";
		
		ModelAndView m = new ModelAndView();
		
		List<DeploymentSheet> pendingdeployreq = null;
		
		deployservice.updateDeployReqStatus(action, id,actionby);
		
		try {
			date1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(from));
			date2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(to));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
			dept = session.getAttribute("dept").toString();
			role = session.getAttribute("role").toString();
			name = session.getAttribute("name").toString();
			
			if(role.equals("DeptHOD") || role.equals("DevManager")) {
				
				if(dept.equals("All")) {
					dept="";
				}
			
				pendingdeployreq = 	deployservice.GetDeploymentRequest(date1, date2,dept);
		   
			}
			
			if(role.equals("Developer")) {
				
				pendingdeployreq = deployservice.GetDeploymentRequestByName(date1, date2,dept,name);
			   
				}
		
		System.out.println("in controller class:"+pendingdeployreq);
		
		m.setViewName("DeploymentRequestReport");
		m.addObject("requestlist", pendingdeployreq);
		m.addObject("fromDate", from);
		m.addObject("toDate", to);
			
		
		
	
		
		return m;

   }
	
	
	@GetMapping("deployreport")
	public ModelAndView ReportView(@RequestParam(name="department",required=false) String department,
			                       @RequestParam(name="fromDate",required=false) String fromDate,
			                       @RequestParam(name="toDate",required=false) String toDate,
			                       @RequestParam(name="name",required=false) String name,
			                       @RequestParam(name="project",required=false) String project,
			                       @RequestParam(name="status",required=false) String status,
			                       @RequestParam(name="submit",required=false) String submit,
			                       HttpSession session) throws SQLException {
		ModelAndView view = new ModelAndView();
		
		String queryFromDate = "",queryToDate="";
		List<DeploymentSheet> requests = null ;
		String nameslist="";
		String projectlist="";
		
		if(session !=null) {
		
		String role = session.getAttribute("role").toString();
		String sessiondept = session.getAttribute("dept").toString();
		String sessionname = session.getAttribute("name").toString();
		
		if(submit==null) {
			
			department="All";
			project="All";
			status="Approved";
			name="All";
			
			
			fromDate = new SimpleDateFormat("01-MMM-yyyy").format(new java.util.Date());
			toDate = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			
			
			
			
		}
		
		
		
		nameslist = deployservice.getNamesList(sessionname,sessiondept,role);
		
		projectlist = deployservice.getProjectListByDepartmentName(sessiondept);
		
		try {
			queryFromDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDate));
			queryToDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(toDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(submit==null) {
			//on-load
			System.out.println("In Onload Condition...");
			//this function query does not consider role
			//requests = deployservice.GetApproveRejectRequestByDate(queryFromDate, queryToDate, status);
			
			//considers role
			requests = deployservice.getDeploymentsByCondition(sessionname, sessiondept, role, queryFromDate, queryToDate, status);
			
		}else {
			//onsubmit
			System.out.println("In Controller Class Onsubmit Condition...");
			
			System.out.println("Department:"+department);
			System.out.println("Project:"+project);
			System.out.println("Name:"+name);
			System.out.println("Status:"+status);
			
			
			requests = deployservice.GetDeploymentsByDetails(queryFromDate, queryToDate, department, project, name, status);
		}
		
		 view.setViewName("AllDeploymentReport");
		 view.addObject("department",department);
		 view.addObject("fromDate",fromDate);
		 view.addObject("toDate",toDate);
		 view.addObject("name",name);
		 view.addObject("project",project);
		 view.addObject("status",status);
		 view.addObject("deploylist", requests);
		 view.addObject("namelist", nameslist);
		 view.addObject("projectlist", projectlist);
		 
		}else {
			view.setViewName("index");
			view.addObject("status","expired");
		}
		 
		 System.out.println("in controller class:"+requests);
		
		 
		
		return view;
	}
	
	@GetMapping("/NewDeploymentApproval")
	@ResponseBody
	public String UpdateDeployStatusAjax(@RequestParam("id") int id,@RequestParam("action") String action,@RequestParam("actionby") String actionby) {
		String status="Failure";
		
		int rows = deployservice.updateDeployReqStatus(action, id,actionby);
		if(rows>=1) {
			status = "Success";
		}else {
			status="Failure";
		}
		
		return status;
	}
	
	
	
	
}
