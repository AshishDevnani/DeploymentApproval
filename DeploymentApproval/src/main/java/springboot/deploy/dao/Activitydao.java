package springboot.deploy.dao;

import org.springframework.data.repository.CrudRepository;

import springboot.deploy.entities.Activity;

public interface Activitydao extends CrudRepository<Activity,Integer>{
	
	//@Query(value="select activity_id from loguseractivity where email=:e order by log_in_time desc limit 1", nativeQuery=true)
	//public int getLastLoginDetails(@Param("e") String email);
	
	//@Query(value="update loguseractivity set log_out_time=NOW() where email=:e order by log_in_time desc limit 1",nativeQuery=true)
	//public int updateLogout(@Param("e") String email);

}
