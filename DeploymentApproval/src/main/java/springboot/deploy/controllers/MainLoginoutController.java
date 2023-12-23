package springboot.deploy.controllers;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springboot.deploy.entities.User;
import springboot.deploy.services.UserService;

@Controller
public class MainLoginoutController {
	
	@Autowired
	UserService userservice;
	
	@GetMapping("/register")
	public String register(Model model) {
		return "Userregistration";
	}
	
	@GetMapping("/start")
	public String showHome(Model model) {
		return "index";
	}
	
	
	@PostMapping("/loginaction")
	public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String pass,HttpSession session) {
		
		ModelAndView obj = new ModelAndView();
		boolean status=false;
		System.out.println("email:"+email);
		System.out.println("pass:"+pass);
		//status=true;
		
		Optional<User> user  = Optional.ofNullable(userservice.getUser(email,pass));
		
		User userval = null;
		
		if(user.isPresent()) {
			status=true;
			userval = user.get();
			
		}
		
		if(status==true) {
			//return "success";
			
			//obj.setViewName("success");
			obj.setViewName("home");
			//obj.addObject("name", userval.getName());
			//obj.addObject("email",userval.getEmail());
			
			userservice.saveLogin(email);
			
			session.setAttribute("contractid", userval.getContractId());
			session.setAttribute("name", userval.getName());
			session.setAttribute("email",userval.getEmail());
			session.setAttribute("role", userval.getRole());
			session.setAttribute("dept", userval.getDepartment());
			session.setMaxInactiveInterval(300000);

			
		}else {
			//return "failure";
			obj.setViewName("index");
			obj.addObject("status", "failed");
		}
		
		
		
		
		return obj;
	}
	
/*	@RequestMapping(path="/registeraction",method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		
		System.out.println("User:"+user);
		
		
		boolean x = userservice.saveUser(user);
		if(x==true) {
		return "registersuccess";
		}else {
		return "failure";	
		}
	} */
	
	@RequestMapping(path="/registeraction",method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("User:"+user);
		
		
		boolean x = userservice.saveUser(user);
		
		List<User> users =	userservice.Users();
		
		mv.setViewName("UserMasterReport");
		mv.addObject("createstatus",x);
		mv.addObject("users", users);
		return mv;
	}

	
	@GetMapping("/logout")
	public String logoutaction(@RequestParam("email") String email,HttpSession session,Model model) throws SQLException {
		//carry out logoout action
		session.invalidate();
		userservice.saveLogout(email);
		return "index";
	}
	
	@GetMapping("/home")
	public String HomePage(Model model) {
		return "home";
	}
	
	@GetMapping("/users")
	public String UserMaster(Model model) {
			
		List<User> users =	userservice.Users(); 
		model.addAttribute("users", users);	
		
		return "UserMasterReport";
	}
	
	
	@PostMapping("userupdate")
	public ModelAndView UpdateUser(@RequestParam("contractid") int contractid,@RequestParam("name") String name,@RequestParam("email") String email,@RequestParam("role") String role,@RequestParam("department") String department,@RequestParam("status") String status) {
		
		
		ModelAndView m= new ModelAndView();
		m.setViewName("UserMasterReport");
		
		String updtstatus = "";
		
		int row = userservice.UpdateUser(contractid, name, role, department, email, status);
		
		
		if(row >=1) {
			updtstatus="successful";
		}else {
			updtstatus="failure";
		}
		
		m.addObject("updtuserstatus", updtstatus);
		List<User> users =	userservice.Users(); 
		m.addObject("users", users);
		
		return m;
	}
	
	public String PasswordChange() {
		return "changepass";
	}
	
	@PostMapping("/updateuserpassword")
	public ModelAndView PasswordChangeAction(@RequestParam("contractid") int contractid,@RequestParam("epass") String epass,@RequestParam("newpass") String newpass) 
	{
		ModelAndView mav = new ModelAndView();
		
		int update = 0;
		
		update = userservice.UpdateUserPassword(contractid, newpass);
		
		mav.setViewName("changepass");
		mav.addObject("updatestatus",update);
		
		return mav;
	}
	
}
