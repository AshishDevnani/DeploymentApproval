package springboot.deploy.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="loguseractivity")
public class Activity {

	@Id
	@GeneratedValue
	int activityId;
	String email;
	String logInTime;
	String logOutTime;
	
	public int getActivityId() {
		return activityId;
	}
	
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getLogInTime() {
		return logInTime;
	}
	
	public void setLogInTime(String logInTime) {
		this.logInTime = logInTime;
	}
	
	public String getLogOutTime() {
		return logOutTime;
	}
	
	public void setLogOutTime(String logOutTime) {
		this.logOutTime = logOutTime;
	}
	
	public Activity(int activityId, String email, String logInTime, String logOutTime) {
		super();
		this.activityId = activityId;
		this.email = email;
		this.logInTime = logInTime;
		this.logOutTime = logOutTime;
	}
	
	public Activity( String email, String logInTime) {
		super();
		
		this.email = email;
		this.logInTime = logInTime;
	}
	
	public Activity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
