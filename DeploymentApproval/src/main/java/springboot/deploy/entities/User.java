package springboot.deploy.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="UserMaster")
public class User {
	
	@Id
	@Column(name="ContractID")
	private int contractId;
	
	@Column(name="Name")
	private String name;
	
	@Column(name="Password")
	private String password;
	
	@Column(name="Department")
	private String department;
	
	@Column(name="Role")
	private String role;
	
	@Column(name="Email")
	private String email;  //for deployment email sending and password recovery functionality.
	
	@Column(name="Status")
	private String status;

	public User(int contractId, String name, String password, String department, String role, String email,String status) {
		super();
		this.contractId = contractId;
		this.name = name;
		this.password = password;
		this.department = department;
		this.role = role;
		this.email = email;
		this.status = status;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getContractId() {
		return contractId;
	}

	public void setContractId(int contractId) {
		this.contractId = contractId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}
