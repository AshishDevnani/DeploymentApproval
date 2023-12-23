package springboot.deploy.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import springboot.deploy.dao.Activitydao;
import springboot.deploy.dao.Userdao;
import springboot.deploy.entities.Activity;
import springboot.deploy.entities.User;

@Component
public class UserService {
	
	@Autowired
	Userdao userdao;
	
	@Autowired
	Activitydao activitydao;

	//public User getUser(String email) {
	public User getUser(String email,String pass) {
		
		//User user = userdao.findByEmailAndPassword(email,pass);
		User user = userdao.getActiveUser(email, pass);
		
		return user;
	}
	
	public boolean saveUser(User user) {
		
		
		User usersave = userdao.save(user);
		
		if(usersave==null) {
			return false;
		}else {
			return true;
		}
	}
	
	public void saveLogin(String email) {
		System.out.println("In Save Login");
		String logInTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		
		Activity activity = new Activity(email,logInTime);
		
		activitydao.save(activity);
	
	}
	
	public void saveLogout(String email) throws SQLException {
		System.out.println("In Save Logout:"+email);
		
		//activitydao.updateLogout(email);
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/DeploymentApproval","ashish","Ashish@1992");
		String sql="update loguseractivity set log_out_time=NOW() where email='"+email+"' order by log_in_time desc limit 1";
		System.out.println("updatelogout---->"+sql);
		conn.createStatement().executeUpdate(sql);
		conn.close();
	}
	
	public List<User> Users(){
		
		List<User> users = null ;
		
		users = userdao.findAll();
		
		return users;
	}
	
	public int UpdateUser(int contractid,String name,String role,String department,String email,String status) {
		int f = 0;
		f = userdao.updateUser(contractid, name, role, department, email, status);
		
		
		return f;
	}
	
	
	public int UpdateUserPassword(int contractid,String newpass) {
		int updt = 0;
		updt = userdao.updateUserPassword(contractid, newpass);
		return updt;
	}
	
}
