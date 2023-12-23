package springboot.deploy.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import springboot.deploy.entities.User;

public interface Userdao extends CrudRepository<User,Integer>{
	
	
	
	public User findByEmail(String email);

	
	public User findByEmailAndPassword(String email,String password);
	
	@Query(nativeQuery=true,value="select * from user_master where email=:e and password=:p and status='Active'")
	public User getActiveUser(@Param("e") String email,@Param("p") String password);
	
		
	public List<User> findAll();
	
	public List<User> findByDepartment(String department);
	
	@Transactional
	@Modifying
	@Query("update User user set user.name=:name , user.role=:role , user.department=:department , user.email =:email , user.status=:status where user.contractId =:contractid")
	public int updateUser(int contractid,String name,String role,String department,String email,String status);

	@Transactional
	@Modifying
	@Query("update User user set user.password=:newpass where user.contractId=:empcode")
	public int updateUserPassword(@Param("empcode") int contractid,@Param("newpass") String newpass);

}
