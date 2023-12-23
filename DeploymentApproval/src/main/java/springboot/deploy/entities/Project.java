package springboot.deploy.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ProjectMaster")
public class Project {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="ProjectName")
	private String ProjectName;
	
	@Column(name="DeploymentPath")
	private String  DeploymentPath;
	
	@Column(name="ServerIP")
	private String ServerIP;
	
	@Column(name="Department")
	private String Department;

	
    
	

	@Override
	public String toString() {
		return "Project [id=" + id + ", ProjectName=" + ProjectName + ", DeploymentPath=" + DeploymentPath
				+ ", ServerIP=" + ServerIP + ", Department=" + Department + "]";
	}

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(int id, String projectName, String deploymentPath, String serverIP, String department) {
		super();
		this.id = id;
		ProjectName = projectName;
		DeploymentPath = deploymentPath;
		ServerIP = serverIP;
		Department = department;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProjectName() {
		return this.ProjectName;
	}

	public void setProjectName(String projectName) {
		this.ProjectName = projectName;
	}

	public String getDeploymentPath() {
		return this.DeploymentPath;
	}

	public void setDeploymentPath(String deploymentPath) {
		this.DeploymentPath = deploymentPath;
	}

	public String getServerIP() {
		return this.ServerIP;
	}

	public void setServerIP(String serverIP) {
		this.ServerIP = serverIP;
	}

	public String getDepartment() {
		return this.Department;
	}

	public void setDepartment(String department) {
		this.Department = department;
	}

	
	
	
	
	
	
}
