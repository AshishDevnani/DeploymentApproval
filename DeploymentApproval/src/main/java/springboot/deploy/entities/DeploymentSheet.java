package springboot.deploy.entities;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DeploymentSheet")
public class DeploymentSheet {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="PageName")
	private String pageName;
	
	@Column(name="Developer")
	private String developer;
	
	@Column(name="requirement")
	private String requirement;
	
	@Column(name="changes")
	private String changes;
	
	@Column(name="Tester")
	private String  tester;
	
	@Column(name="ProjectName")
	private String projectname;
	
	@Column(name="ServerIP")
	private String serverIP;
	
	@Column(name="Path")
	private String path;
	
	@Column(name="ParentID")
	private String parentId;
	
	@Column(name="CommitID")
	private String commitId;
	
	@Column(name="Status")
	private String status;
	
	@Column(name="EntryDateTime")
	private Timestamp entrydate;
	
	@Column(name="ActionDateTime")
	private String actiondate;
	
	@Column(name="ActionBy")
	private String actionby;
	
	@Column(name="Department")
	private String department;

	

	public DeploymentSheet(int id, String pageName, String developer, String requirement, String changes, String tester,
			String projectname, String serverIP, String path, String parentId, String commitId, String status,
			Timestamp entrydate, String actiondate, String actionby, String department) {
		super();
		this.id = id;
		this.pageName = pageName;
		this.developer = developer;
		this.requirement = requirement;
		this.changes = changes;
		this.tester = tester;
		this.projectname = projectname;
		this.serverIP = serverIP;
		this.path = path;
		this.parentId = parentId;
		this.commitId = commitId;
		this.status = status;
		this.entrydate = entrydate;
		this.actiondate = actiondate;
		this.actionby = actionby;
		this.department = department;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}

	public String getTester() {
		return tester;
	}

	public void setTester(String tester) {
		this.tester = tester;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getServerIP() {
		return serverIP;
	}

	public void setServerIP(String serverIP) {
		this.serverIP = serverIP;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getCommitId() {
		return commitId;
	}

	public void setCommitId(String commitId) {
		this.commitId = commitId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	public DeploymentSheet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Timestamp getEntrydate() {
		return entrydate;
	}

	public void setEntrydate(Timestamp entrydate) {
		this.entrydate = entrydate;
	}


	

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getChanges() {
		return changes;
	}

	public void setChanges(String changes) {
		this.changes = changes;
	}

	public String getActiondate() {
		return actiondate;
	}

	public void setActiondate(String actiondate) {
		this.actiondate = actiondate;
	}

	public String getActionby() {
		return actionby;
	}

	public void setActionby(String actionby) {
		this.actionby = actionby;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "DeploymentSheet [id=" + id + ", pageName=" + pageName + ", developer=" + developer + ", requirement="
				+ requirement + ", changes=" + changes + ", tester=" + tester + ", projectname=" + projectname
				+ ", serverIP=" + serverIP + ", path=" + path + ", parentId=" + parentId + ", commitId=" + commitId
				+ ", status=" + status + ", entrydate=" + entrydate + ", actiondate=" + actiondate + ", actionby="
				+ actionby + ", department=" + department + "]";
	}

	
	
	
	
	

}
